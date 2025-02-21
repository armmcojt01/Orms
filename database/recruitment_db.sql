-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2025 at 09:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recruitment_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `cover_letter` varchar(255) NOT NULL,
  `position_id` int(30) NOT NULL,
  `resume_path` text NOT NULL,
  `process_id` int(30) NOT NULL DEFAULT 0 COMMENT '\r\n',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `message` varchar(525) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `email`, `contact`, `address`, `cover_letter`, `position_id`, `resume_path`, `process_id`, `date_created`, `message`) VALUES
(90, 'Angelo', '', 'Desabille', 'Male', 'ngldc09@gmail.com', '09481913928', '61 camia', '', 9, '1740014520_New Text Document.txt', 1, '2025-02-20 09:22:53', ''),
(91, 'angelo', '', 'desabille', 'Male', 'ngldc09@gmail.com', '09481913928', '61 cami', '', 7, '1740015000_New Text Document.txt', 0, '2025-02-20 09:30:56', ''),
(92, 'Angelo', '', 'Desabille', 'Male', 'ngldc09@gmail.com', '09481913928', '61 camia', '', 11, '1740022800_ANGELO B DESABILLE.pdf', 0, '2025-02-20 11:40:11', '');

-- --------------------------------------------------------

--
-- Table structure for table `dept_tbl`
--

CREATE TABLE `dept_tbl` (
  `id` int(255) NOT NULL,
  `dept_name` varchar(255) NOT NULL,
  `division_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `division_tbl`
--

CREATE TABLE `division_tbl` (
  `id` int(11) NOT NULL,
  `division_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `division_tbl`
--

INSERT INTO `division_tbl` (`id`, `division_name`, `description`) VALUES
(1, 'Medical Center Chief', 'Sample description.'),
(2, 'HOPSS', 'Sample description for hoops.'),
(3, 'NURSING', 'Sample description for nursing.'),
(4, 'ALLIED', 'Sample description for ALLIED.'),
(5, 'FINANCE', 'Sample description for FINANCE.');

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_status`
--

CREATE TABLE `recruitment_status` (
  `id` int(30) NOT NULL,
  `status_label` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recruitment_status`
--

INSERT INTO `recruitment_status` (`id`, `status_label`, `status`) VALUES
(1, 'For Initial Interview', 1),
(2, 'PASSED II', 1),
(3, 'FAILED II', 1),
(4, 'For Final Interview', 1),
(5, 'PASSED FI', 1),
(6, 'FAILED FI', 1),
(7, 'FOR POOLING', 1),
(8, 'Job Offer', 1),
(9, 'Hired', 1),
(10, 'Withdraw Application', 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'ARMMC | Online Recruitment Management System', 'hrmo@armmc.doh.gov.ph', '+62 8948 1263', 'recruitment.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;&lt;b&gt;ARMMC Online Recruitment Management System&lt;/b&gt;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt; is created by IMIS Section to digitalized application or Job hiring process of Human Resources Management Office, for easy navigation and processing of Applicants Credentials and Requirements.&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;/p&gt;&lt;h2 style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/h2&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `uid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `cpass` varchar(255) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`uid`, `fname`, `mname`, `lname`, `email`, `uname`, `pass`, `cpass`, `pic`, `created_at`, `updated_at`) VALUES
(1, 'Alvin', 'Mabasa', 'Lopez', 'traxcie21@gmail.com', 'alvin', '$2y$10$wV31MVxMJ5SYz73wQbNfsOffCqWzefAwr7DNvgvBvZWZXnQD66IdS', '$2y$10$WWm39i9qy1kzC63t3K2VUOnJGpfg79n61idiBDpp.1FJPqgtHBUdC', 'uploads/amang.jfif', '2024-07-22 07:20:51', '2024-07-22 07:20:51'),
(6, 'jane', 'jane', 'jane', 'jane@jane.com', 'jane', '$2y$10$KbLnQgvwALcO/JxBNKInQudJMtXENlFIQ.yQjplwgvpZbCBAhhC3i', '$2y$10$KbLnQgvwALcO/JxBNKInQudJMtXENlFIQ.yQjplwgvpZbCBAhhC3i', 'uploads/BizBox.jpg', '2024-07-23 00:59:44', '2024-07-23 00:59:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `div_id` int(11) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=superadmin, 2 = admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `div_id`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 0, 'admin123', 1),
(2, 0, 'admin2', '', '', 'admin02', 0, 'admin', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

CREATE TABLE `vacancy` (
  `id` int(30) NOT NULL,
  `position` varchar(200) NOT NULL,
  `availability` int(30) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `deadline` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vacancy`
--

INSERT INTO `vacancy` (`id`, `position`, `availability`, `description`, `status`, `date_created`, `deadline`) VALUES
(7, 'Registered Nurse', 5, '&lt;p data-start=&quot;256&quot; data-end=&quot;272&quot;&gt;&lt;b&gt;&lt;span data-start=&quot;256&quot; data-end=&quot;271&quot; style=&quot;&quot;&gt;Job Summary:&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;p data-start=&quot;256&quot; data-end=&quot;272&quot;&gt;We are seeking a compassionate, skilled, and dedicated Registered Nurse (RN) to join our healthcare team. As a registered nurse, you will provide patient care and support to individuals in various settings, ensuring that patients receive high-quality, safe, and effective healthcare. You will collaborate with a multidisciplinary team to assess, plan, implement, and evaluate patient care needs while demonstrating a commitment to patient-centered care.&lt;/p&gt;&lt;p data-start=&quot;274&quot; data-end=&quot;727&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p data-start=&quot;734&quot; data-end=&quot;759&quot;&gt;&lt;b data-start=&quot;734&quot; data-end=&quot;758&quot;&gt;Key Responsibilities&lt;/b&gt;:&lt;/p&gt;&lt;ul data-start=&quot;760&quot; data-end=&quot;1754&quot;&gt;&lt;li data-start=&quot;760&quot; data-end=&quot;864&quot;&gt;Provide direct patient care in accordance with established nursing standards, policies, and protocols.&lt;/li&gt;&lt;li data-start=&quot;865&quot; data-end=&quot;968&quot;&gt;Assess patients&rsquo; conditions and medical histories to develop and implement individualized care plans.&lt;/li&gt;&lt;li data-start=&quot;969&quot; data-end=&quot;1048&quot;&gt;Administer medications and treatments as prescribed, ensuring patient safety.&lt;/li&gt;&lt;li data-start=&quot;1049&quot; data-end=&quot;1143&quot;&gt;Monitor and document patient progress, responses to treatment, and any changes in condition.&lt;/li&gt;&lt;li data-start=&quot;1144&quot; data-end=&quot;1246&quot;&gt;Educate patients and their families about healthcare needs, medications, and discharge instructions.&lt;/li&gt;&lt;li data-start=&quot;1247&quot; data-end=&quot;1365&quot;&gt;Collaborate with physicians, medical staff, and other healthcare professionals to ensure comprehensive patient care.&lt;/li&gt;&lt;li data-start=&quot;1366&quot; data-end=&quot;1467&quot;&gt;Assist in patient admissions, transfers, and discharges while maintaining a compassionate approach.&lt;/li&gt;&lt;li data-start=&quot;1468&quot; data-end=&quot;1566&quot;&gt;Ensure compliance with healthcare regulations, safety protocols, and infection control measures.&lt;/li&gt;&lt;li data-start=&quot;1567&quot; data-end=&quot;1664&quot;&gt;Provide emotional support to patients and their families, addressing any concerns or anxieties.&lt;/li&gt;&lt;li data-start=&quot;1665&quot; data-end=&quot;1754&quot;&gt;Maintain accurate and up-to-date patient records using electronic health systems (EHR)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;b data-start=&quot;2813&quot; data-end=&quot;2829&quot;&gt;How to Apply&lt;/b&gt;: Please fill out the form and send your resume, cover letter, basic information and any relevant certifications to [contact email/website]. We look forward to reviewing your application!', 1, '2025-02-20 08:15:14', '2025-02-25'),
(8, 'Cyber Security', 5, '&lt;p data-start=&quot;292&quot; data-end=&quot;308&quot;&gt;&lt;b data-start=&quot;292&quot; data-end=&quot;307&quot;&gt;Job Summary&lt;/b&gt;:&lt;/p&gt;&lt;p data-start=&quot;310&quot; data-end=&quot;750&quot;&gt;We are seeking a proactive, detail-oriented, and experienced Cybersecurity Analyst/Engineer to join our dynamic IT security team. In this role, you will be responsible for protecting the organization&rsquo;s information systems, networks, and data from cyber threats and vulnerabilities. You will collaborate with cross-functional teams to identify, assess, and mitigate risks while ensuring compliance with industry standards and best practices.&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;p data-start=&quot;757&quot; data-end=&quot;782&quot;&gt;&lt;b data-start=&quot;757&quot; data-end=&quot;781&quot;&gt;Key Responsibilities&lt;/b&gt;:&lt;/p&gt;&lt;ul data-start=&quot;783&quot; data-end=&quot;2092&quot;&gt;&lt;li data-start=&quot;783&quot; data-end=&quot;944&quot;&gt;Monitor network traffic and security systems for potential security breaches and unusual activity using SIEM (Security Information and Event Management) tools.&lt;/li&gt;&lt;li data-start=&quot;945&quot; data-end=&quot;1061&quot;&gt;Conduct regular vulnerability assessments and penetration testing to identify weaknesses and propose improvements.&lt;/li&gt;&lt;li data-start=&quot;1062&quot; data-end=&quot;1207&quot;&gt;Implement and manage security tools, firewalls, intrusion detection/prevention systems (IDS/IPS), antivirus software, and encryption protocols.&lt;/li&gt;&lt;li data-start=&quot;1208&quot; data-end=&quot;1330&quot;&gt;Respond to security incidents, providing timely and effective resolution, including root cause analysis and remediation.&lt;/li&gt;&lt;li data-start=&quot;1331&quot; data-end=&quot;1421&quot;&gt;Work closely with IT teams to ensure secure configurations for systems and applications.&lt;/li&gt;&lt;li data-start=&quot;1422&quot; data-end=&quot;1499&quot;&gt;Develop, update, and enforce security policies, procedures, and guidelines.&lt;/li&gt;&lt;li data-start=&quot;1500&quot; data-end=&quot;1644&quot;&gt;Stay up-to-date with the latest cybersecurity trends, threats, and technologies, and recommend proactive measures to protect the organization.&lt;/li&gt;&lt;li data-start=&quot;1645&quot; data-end=&quot;1740&quot;&gt;Perform risk assessments and provide recommendations for mitigating security vulnerabilities.&lt;/li&gt;&lt;li data-start=&quot;1741&quot; data-end=&quot;1827&quot;&gt;Manage and maintain endpoint protection and secure access controls (VPN, MFA, etc.).&lt;/li&gt;&lt;li data-start=&quot;1828&quot; data-end=&quot;1987&quot;&gt;Provide support in compliance audits, including SOC 2, ISO 27001, and GDPR, ensuring that security practices meet regulatory and organizational requirements.&lt;/li&gt;&lt;li data-start=&quot;1988&quot; data-end=&quot;2092&quot;&gt;Assist with the training and awareness of staff on cybersecurity best practices and threat prevention.&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span data-start=&quot;2813&quot; data-end=&quot;2829&quot; style=&quot;font-weight: bolder;&quot;&gt;How to Apply&lt;/span&gt;: Please fill out the form and send your resume, cover letter, basic information and any relevant certifications to [contact email/website]. We look forward to reviewing your application!&lt;/p&gt;', 1, '2025-02-20 08:19:48', '2025-02-28'),
(9, 'Network Administrator', 2, '&lt;p data-start=&quot;282&quot; data-end=&quot;298&quot;&gt;&lt;b data-start=&quot;282&quot; data-end=&quot;297&quot;&gt;Job Summary&lt;/b&gt;:&lt;/p&gt;&lt;p data-start=&quot;300&quot; data-end=&quot;772&quot;&gt;We are looking for a skilled and detail-oriented Network Administrator to join our IT team. The Network Administrator will be responsible for the installation, configuration, and maintenance of the organization&rsquo;s network infrastructure, including local area networks (LAN), wide area networks (WAN), and cloud environments. The ideal candidate will have experience in managing network systems, troubleshooting network issues, and ensuring network security and performance.&lt;br&gt;&lt;br&gt;&lt;/p&gt;&lt;p data-start=&quot;779&quot; data-end=&quot;804&quot;&gt;&lt;b data-start=&quot;779&quot; data-end=&quot;803&quot;&gt;Key Responsibilities&lt;/b&gt;:&lt;/p&gt;&lt;ul data-start=&quot;805&quot; data-end=&quot;2224&quot;&gt;&lt;li data-start=&quot;805&quot; data-end=&quot;925&quot;&gt;Install, configure, and maintain networking hardware such as routers, switches, firewalls, and wireless access points.&lt;/li&gt;&lt;li data-start=&quot;926&quot; data-end=&quot;1041&quot;&gt;Monitor network performance and troubleshoot issues to ensure optimal performance, reliability, and availability.&lt;/li&gt;&lt;li data-start=&quot;1042&quot; data-end=&quot;1176&quot;&gt;Implement network security protocols and practices, including firewalls, VPNs, and intrusion detection/prevention systems (IDS/IPS).&lt;/li&gt;&lt;li data-start=&quot;1177&quot; data-end=&quot;1295&quot;&gt;Perform regular network assessments, identify potential risks, and resolve any vulnerabilities or security concerns.&lt;/li&gt;&lt;li data-start=&quot;1296&quot; data-end=&quot;1404&quot;&gt;Support users by providing network-related troubleshooting, ensuring connectivity across the organization.&lt;/li&gt;&lt;li data-start=&quot;1405&quot; data-end=&quot;1471&quot;&gt;Configure and manage DNS, DHCP, VPN, and other network services.&lt;/li&gt;&lt;li data-start=&quot;1472&quot; data-end=&quot;1586&quot;&gt;Manage and maintain the company&rsquo;s cloud-based network infrastructure (e.g., AWS, Azure) and hybrid environments.&lt;/li&gt;&lt;li data-start=&quot;1587&quot; data-end=&quot;1678&quot;&gt;Assist with capacity planning, network upgrades, and hardware/software updates as needed.&lt;/li&gt;&lt;li data-start=&quot;1679&quot; data-end=&quot;1788&quot;&gt;Document network configurations, changes, and performance metrics for reporting and future troubleshooting.&lt;/li&gt;&lt;li data-start=&quot;1789&quot; data-end=&quot;1902&quot;&gt;Collaborate with IT teams to ensure network infrastructure meets the needs of business operations and projects.&lt;/li&gt;&lt;li data-start=&quot;1903&quot; data-end=&quot;2016&quot;&gt;Provide technical support during network outages or disruptions, coordinating recovery and minimizing downtime.&lt;/li&gt;&lt;li data-start=&quot;2017&quot; data-end=&quot;2119&quot;&gt;Perform regular backups of network configurations and data to ensure disaster recovery capabilities.&lt;/li&gt;&lt;li data-start=&quot;2120&quot; data-end=&quot;2224&quot;&gt;Stay up-to-date with industry trends, new technologies, and best practices for network administration.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p data-start=&quot;3840&quot; data-end=&quot;4005&quot;&gt;&lt;span data-start=&quot;2813&quot; data-end=&quot;2829&quot; style=&quot;font-weight: bolder;&quot;&gt;How to Apply&lt;/span&gt;: Please fill out the form and send your resume, cover letter, basic information and any relevant certifications to [contact email/website]. We look forward to reviewing your application!&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', 1, '2025-02-20 08:21:47', '2025-03-07'),
(10, 'Physician (MD/DO)', 3, '&lt;p data-start=&quot;315&quot; data-end=&quot;331&quot;&gt;&lt;b data-start=&quot;315&quot; data-end=&quot;330&quot;&gt;Job Summary&lt;/b&gt;:&lt;/p&gt;&lt;p data-start=&quot;333&quot; data-end=&quot;900&quot;&gt;We are seeking a compassionate, experienced, and highly skilled physician to join our medical team. As a physician at Amang Rodriguez Memorial Medical Center (ARMMC), you will be responsible for diagnosing, treating, and managing patient care across a variety of medical conditions. You will collaborate with other healthcare professionals, including nurses, specialists, and allied health staff, to provide high-quality, patient-centered care. The ideal candidate will demonstrate exceptional clinical expertise, a strong commitment to patient well-being, and excellent communication skills.&lt;/p&gt;&lt;p data-start=&quot;333&quot; data-end=&quot;900&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p data-start=&quot;907&quot; data-end=&quot;932&quot;&gt;&lt;b data-start=&quot;907&quot; data-end=&quot;931&quot;&gt;Key Responsibilities&lt;/b&gt;:&lt;/p&gt;&lt;ul data-start=&quot;933&quot; data-end=&quot;2264&quot;&gt;&lt;li data-start=&quot;933&quot; data-end=&quot;1022&quot;&gt;Conduct thorough physical examinations and take detailed medical histories of patients.&lt;/li&gt;&lt;li data-start=&quot;1023&quot; data-end=&quot;1134&quot;&gt;Diagnose medical conditions, develop treatment plans, and prescribe appropriate medications or interventions.&lt;/li&gt;&lt;li data-start=&quot;1135&quot; data-end=&quot;1255&quot;&gt;Order, interpret, and follow up on diagnostic tests (e.g., blood tests, imaging studies) to guide treatment decisions.&lt;/li&gt;&lt;li data-start=&quot;1256&quot; data-end=&quot;1342&quot;&gt;Provide preventive care, including immunizations, screenings, and health counseling.&lt;/li&gt;&lt;li data-start=&quot;1343&quot; data-end=&quot;1444&quot;&gt;Counsel patients and their families on medical conditions, treatment options, and health promotion.&lt;/li&gt;&lt;li data-start=&quot;1445&quot; data-end=&quot;1586&quot;&gt;Maintain up-to-date and accurate patient records, documenting all interactions and procedures in the electronic health record (EHR) system.&lt;/li&gt;&lt;li data-start=&quot;1587&quot; data-end=&quot;1690&quot;&gt;Monitor and manage chronic conditions, ensuring appropriate follow-up care and treatment adjustments.&lt;/li&gt;&lt;li data-start=&quot;1691&quot; data-end=&quot;1795&quot;&gt;Participate in interdisciplinary team meetings to discuss patient cases and collaborate on care plans.&lt;/li&gt;&lt;li data-start=&quot;1796&quot; data-end=&quot;1897&quot;&gt;Stay current with advancements in medical research, treatments, and technologies in your specialty.&lt;/li&gt;&lt;li data-start=&quot;1898&quot; data-end=&quot;2038&quot;&gt;Adhere to healthcare regulations, ethical guidelines, and hospital policies to ensure patient safety and privacy (e.g., HIPAA compliance).&lt;/li&gt;&lt;li data-start=&quot;2039&quot; data-end=&quot;2150&quot;&gt;Provide guidance and mentorship to medical students, residents, and other healthcare trainees, if applicable.&lt;/li&gt;&lt;li data-start=&quot;2151&quot; data-end=&quot;2264&quot;&gt;Participate in hospital committees, quality improvement initiatives, and community outreach programs as needed.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;How to Apply: Please fill out the form and send your resume, cover letter, basic information and any relevant certifications to [contact email/website]. We look forward to reviewing your application!&lt;/p&gt;', 1, '2025-02-20 08:25:49', ''),
(11, 'Certified Nursing Assistant (CNA)', 10, '&lt;p style=&quot;text-align: left;&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p data-start=&quot;282&quot; data-end=&quot;298&quot;&gt;&lt;b data-start=&quot;282&quot; data-end=&quot;297&quot;&gt;Job Summary&lt;/b&gt;:&lt;/p&gt;&lt;blockquote style=&quot;margin: 0 0 0 40px; border: none; padding: 0px;&quot;&gt;&lt;p data-start=&quot;300&quot; data-end=&quot;841&quot; style=&quot;margin: 0 0 0 40px; border: none; padding: 0px;&quot;&gt;We are seeking a compassionate and dedicated Certified Nursing Assistant (CNA) to join our healthcare team. As a CNA, you will provide essential support to nursing staff and assist patients with activities of daily living (ADLs) while ensuring their comfort and safety. You will work closely with nurses, physicians, and other healthcare professionals to deliver high-quality, patient-centered care. The ideal candidate will have strong interpersonal skills, the ability to work in a fast-paced environment, and a passion for helping others.&lt;/p&gt;&lt;/blockquote&gt;&lt;p data-start=&quot;848&quot; data-end=&quot;873&quot;&gt;&lt;/p&gt;&lt;p data-start=&quot;848&quot; data-end=&quot;873&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot; style=&quot;&quot;&gt;Key Responsibilities&lt;/span&gt;:&lt;/span&gt;&lt;/p&gt;&lt;ul data-start=&quot;874&quot; data-end=&quot;2272&quot;&gt;&lt;li data-start=&quot;874&quot; data-end=&quot;992&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Assist patients with activities of daily living (ADLs), including bathing, dressing, grooming, eating, and mobility.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;993&quot; data-end=&quot;1103&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Monitor and record patients&rsquo; vital signs, such as temperature, blood pressure, pulse, and respiration rates.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1104&quot; data-end=&quot;1221&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Assist in positioning, transferring, and ambulating patients safely, using proper lifting techniques and equipment.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1222&quot; data-end=&quot;1342&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Provide emotional support and comfort to patients, offering companionship and maintaining a positive, caring attitude.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1343&quot; data-end=&quot;1428&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Observe and report changes in patients&rsquo; conditions to nursing staff and physicians.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1429&quot; data-end=&quot;1516&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Help patients with basic hygiene and incontinence care, ensuring dignity and privacy.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1517&quot; data-end=&quot;1608&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Assist with feeding patients, ensuring dietary restrictions and preferences are followed.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1609&quot; data-end=&quot;1687&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Support nursing staff in preparing patients for medical procedures or exams.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1688&quot; data-end=&quot;1800&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Maintain a clean and safe patient environment by ensuring that rooms are tidy and patient areas are sanitized.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1801&quot; data-end=&quot;1926&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Ensure proper documentation of patient care activities and daily interactions in the electronic health record (EHR) system.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;1927&quot; data-end=&quot;2046&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Follow infection control and safety protocols, including proper hand hygiene and personal protective equipment (PPE).&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;2047&quot; data-end=&quot;2174&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Assist with patient intake, admissions, and discharge processes, including gathering patient information and preparing rooms.&lt;/span&gt;&lt;/li&gt;&lt;li data-start=&quot;2175&quot; data-end=&quot;2272&quot;&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;Provide transportation for patients to and from various departments (e.g., radiology, therapy).&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span data-start=&quot;848&quot; data-end=&quot;872&quot; style=&quot;&quot;&gt;How to Apply: Please fill out the form and send your resume, cover letter, basic information and any relevant certifications to [contact email/website]. We look forward to reviewing your application!&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', 1, '2025-02-20 08:26:54', ''),
(12, 'PHP Developer', 4, 'Yes my love.', 1, '2025-02-21 15:43:19', '2025-02-28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dept_tbl`
--
ALTER TABLE `dept_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `division_tbl`
--
ALTER TABLE `division_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruitment_status`
--
ALTER TABLE `recruitment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `dept_tbl`
--
ALTER TABLE `dept_tbl`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `division_tbl`
--
ALTER TABLE `division_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recruitment_status`
--
ALTER TABLE `recruitment_status`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vacancy`
--
ALTER TABLE `vacancy`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
