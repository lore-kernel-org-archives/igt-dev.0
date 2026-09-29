Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4E2CA5FAC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 11:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAEB10E9A1;
	Tue, 29 Sep 2026 11:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6i3R4jX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D12B10E6CD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790682291; x=1822218291;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dZ7+0wuMp5jvoIPlWHrSLgQEpfI/5a11uNkAkC2Xjsg=;
 b=B6i3R4jXJBhCaxbIP2PJmYyr9K/qnIrrO7QIGnfqyR8mPcZY0hBrO/nx
 6cNTJL3db0T4fWIu0zy+oGw4ZQh2N8bwEYMmRwBljSwxCwa5wO0Uz0Wft
 j+d2KFBvKldjJsoXf+V1LWfmUY/0LgxyRHtCCxUl5WH3z+sfUAWfOCQTd
 wxY0B1fT54+cYX+0H3TKgBF0yU6qfCW5I0F+kU2n1GLd5+Esu3zbpek4x
 6PfArPo2iivvacBeISwP8OsJMZgpQ67AkmuHM1c6FZTP9bw3UGZ2flFEC
 q7ktwIDz8Ury0Z0cPBVW64gg1ldwyTrh3sd1erZncZrXYEX9aDCP+NVLn w==;
X-CSE-ConnectionGUID: hyUPlQxZTkaHUBmMtu5HjA==
X-CSE-MsgGUID: /L7W8zXMRtGOifXF3ullPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102770498"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="102770498"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:44:51 -0700
X-CSE-ConnectionGUID: hWIBD2/SQ9u7G6PnLoqQEA==
X-CSE-MsgGUID: JCM339VxRy+O7k3ngHYvZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274883961"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:44:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:44:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 04:44:50 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 04:44:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qaxsx6s9lGi/fafRbW7DAfh4YL/U+xjFpd00DH+wH25AX0wQqPCOElWZ92UNLb2Q4zytviSCO/3J9d7cUvP+k9x2IlhqkUB+5fxw33H9caU1JvdYvwFOq0zwdNl5Oi9wI4Ao4Y96oB1QWOcI9DB7CncHPw60BdRGu4HcIybsdf9C29TWx3ZwtRU7c2gZSuDuolPvgyML6rmY4gH70P3a3ygqd+AhxO+U6gLsiQCRneGcK2o3ub2cmhblCxua6gSNhlCMK0+EHSpW9JIhvzf4zfU/ECDmA/iReJXH1FsI/3JHBKJ+9wzekIPKT9mbB4yuYdoHUEN1IYjb1/rJE2LxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgvXTuh7Cgj023teEf+0mdDh4ThvDc/5r4vC7Evheho=;
 b=xj0FxnGzR4qtf1MSN109OWPRCLE2SFXkUSOC+09rRlqQ9vHoix6o4xxqWtGYv5GieBAiOrba/s1k3GLchirIUVp2vBAYSsof0UFLMtL6/H8ejY8RHFJFp0ADSyt67WxfeQbYF6/8hoY5VMNVnF+0GNIRjlUzYu/3B21q9EMa/TrgmMhSN/DvkFmp3oeHDR1r7PVIQ46nSkaVDRjcNEHf5tBKcMmvBYjr0JAR9M2OxSBqjeGn/XZralIC/d43m0pw4Ri+hgR1vvsppbkrC6fBegLkZtAG+rXjmZatJkQNOFLhiBiquCCkc+90+BdFTnUkGyOGQy4GK9epH1DC4sNBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 11:44:48 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 11:44:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/4] Add PCI configuration tests for SR-IOV VFs
Date: Tue, 29 Sep 2026 13:44:31 +0200
Message-ID: <20260929114435.2961154-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CO1PR11MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: eb02966a-0cc9-44a6-4161-08df1e1f1062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: YG6xOpG0fNtDaSpffiX9Fnf442koKniWoJ6LSG9vvKNVbI4L7FBQaa4Pdr4g2f/5wMU313tNx2FkyHy3okLjq9Sf4T5z8WgoUabI+yoVtBMwI3R3H7VI0hLyghcHxneW5pYAW3UyjkwCG1gTSzb4FR2OzQnANERSci8lnrwWgNvbM52CwshwAbpDk0z7lLYXjJzIWUFnAsTIR2K1fjg3v1qe/EED355FLoUDBhbuGCUreOQgjeefaUEF1EXeETeXpT0cXJP+b4vWlOUb2RmFjdhw41NY28P5Db28VYgavin0ogiK2fkwH6/WHu/f7JyaPX0j2YYSoERuTUlUmE050NMsVSRp9pziGTUUlYcxghZAqZxjO2XzHFhG/RDkChilwOQxQLPpWTTYuSABRa0ysa0rHZXVki+tUDFE6rugGTQQQQNMIgI0UZwBABldGxrqenDAXOfWO+d1v/RGfpItusaQvSl4ur+eiRC5ORkZihM3yvHbhe4Iz4R4vYgshXU1JjPEX/KTrVR96DKfrleLPmTPW8CKjxCEly7xfkPjKNRBK/0MGEd17L/He7TLeHYAfed1AGS0IJ/sBkLqE0PVOQ3K9s+xPh4wxSVLO3qhibHJbMLQiKhynPtPqVrmPSHdgguWaf52GPx+kr933l2EWeTAtz6OQOlvMv48vVPdZ5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG9BS3RuQ3l2NnAvdVZYRm8zcHV5SzA0S3JUTjdQbGV0SFQ4WldEODRPZTQ3?=
 =?utf-8?B?aFhCVDVjMlYwQUlKSXRxKzczNXM0L1ZLZVlwdXIwcUY0NXdVbnphcEQ2MTJK?=
 =?utf-8?B?Um5tZGFGQ3R2Q0hEOC85VDFuYlcyeDhGSWVENjNoMUlyS1owbFlORGZ2cW5P?=
 =?utf-8?B?eVhzcVByZ0s2MlJvMVVZK0R3UnJTTmE4TSs4TG83TURtendVSCtLeVIrOGJX?=
 =?utf-8?B?MXJEUVFLYnY5UnNZZzlwV3h3NFRjVml1VFRKTFhzWFpYTlFja1BBYU93S3VX?=
 =?utf-8?B?Z0FvRUU5alI1NTZRNG1ZWVR0dTlDMlRkV0tlMlBFQ21tdEQxR0J5b1pJdjU5?=
 =?utf-8?B?Z3JqUmI2cTBueHF4Q0hBQ1R1bllCUzlBdDR4V0NhU1RzSXlLdGxLWXROTC9K?=
 =?utf-8?B?VWF2Y0VuWWRiNW9VajZxNFBHS3BjbG9SUUEwS1RsZVdNZjRlYS9aZjVrSmZ1?=
 =?utf-8?B?ZkRBU1cvYmlZTFcvQ2VhNlZVMFNMU2svWS9HNVovTXBhSGhDWG9oT1NGZTcy?=
 =?utf-8?B?dDFXT3NQVGxXcXd5K1N1M25qZDR3eGRaQUlnYUtDN0FibUt2R1pwWGltK2xy?=
 =?utf-8?B?Q3plUWtuTFB5dFZ3Mk40eXJRRkxXQjgxeWV5UnJ3VDduaE1SVWNCeE10VWlT?=
 =?utf-8?B?cmx2MjBCRS9CR0p5WFNKSjZ1YlAydE54YlNEL2J2dDNWMEhZUVZBUU1odTM4?=
 =?utf-8?B?aFIwd3FnVmdnR0c3TmRteklCZXdDazUwOWJmNS8ya0xZMWlLa2phcGhWZzQ1?=
 =?utf-8?B?TksyUklTUU5LRGdMYThvRUdvV25na1EyWTUzWjdDUHpWZUppWGZRYmhYUDZH?=
 =?utf-8?B?d0ZKTEF4bEVWbnZTMFBJeVFsRkhWYmhIcTAzLzNtMHlDdUxMN3ZvTlhQcnhr?=
 =?utf-8?B?TS94WVUrbkNqZnJMVUJpektnYXRtc0tlTUsvK2UwZkdDM284UHlUYkRtb3p2?=
 =?utf-8?B?WWFleVNlMWk2Qzd5bjA4bzNBTk1wTVNiYW1ZdEx2Y1RKZWNQUG9zSjkyTXI5?=
 =?utf-8?B?RWFwbzVHTTg5cG9sSXF0em1USnlKRTFkbWc2R2M1QjVxUzZZQUdzcytiblBr?=
 =?utf-8?B?Z2ZNNkZCVkJIK0N6MUZTeWlzbVM0bThSRzc3MTBOSExBVmJITGUzaFdFaU9M?=
 =?utf-8?B?cklaMmc3SnhMdkgxR2M5ciswTFd5ZEJWVzNhaG8yeWdVMjhLSkdvMEtIcm5S?=
 =?utf-8?B?cmNZZTl6WW91REZ5dlBTL1kya3MzdEJDODJLc25Lb1VQYmRoZldFT2VONndP?=
 =?utf-8?B?Yzh0MEIxTmpTbSsvdUFEL0RvVm1DSXZzSnF4eHdlRnZFUkZiMUJpb0ZsTzdt?=
 =?utf-8?B?TWIxNzhkRVE1eFMwTXJMRysrd3RsZGE5RmVjbVRvOVR6WEtkQjNJRW1wU1Zw?=
 =?utf-8?B?cTc1akRaY2lzcFlkMjJNR0UrTjNKYTI3cmYyNHorRGhkUjR6ekpwODdaSDZB?=
 =?utf-8?B?RkEwRERubmNHUDBqNjBub0pjOHF0M2dqRlo3WDNEaDVFOERya1BBZXNvckdK?=
 =?utf-8?B?ZDdSb1VSMlVWZk43OStPU3RHTlpUSkVZL0QwUEZENVlEYzJrUEJyTzlrQkIr?=
 =?utf-8?B?Tm9WZFo1dnhtMEs0TlVBMjREVXVWNnRYWXg5VmdseDNUaUtxUWtia1BMNjkw?=
 =?utf-8?B?blFhRlVZaFpJSm11NWNidi9OK0FnWFBTZG5ZSjJQWHlHZUJqRjV4K1h0cGEr?=
 =?utf-8?B?NVF2UDk1MmdIWGc2ajR3d1ZNamg3S3VkMDJBSEV3ODhLWXIvdEhSZ1VoT3B1?=
 =?utf-8?B?N2JFbGRMWWJycE9ESmtNbTB5RHNTSzNDRHZMcFhIS3dwMHJtZkVYVDhiRmt0?=
 =?utf-8?B?Z0Z1UHNvNW4wRjIwQ2d5NUZXb3hSYVFEa2Q3dEpHU1A5dlFIMW9zOGJBODFJ?=
 =?utf-8?B?bjJZRXhhZzR0VG8rU0EwR0sxTmErd2o1Z21QQ3B2QzZwZFVhTnJNb0ZHNWxv?=
 =?utf-8?B?dHBLNjM4YjNnMnBDbmw3djl6MHM0UnBxTklnVDZWb1o1YVV3TE9IaXhKY2JE?=
 =?utf-8?B?c0hyNGZmY1pzRHFkNTEzZkF3V2s2aEJpRFlEWG9mS3J3djlqc1lzaEJCOFR1?=
 =?utf-8?B?eVpkSHVJT1BMTHJSRVF2c3E3NXJPQ1drelhGL2szRXBTaWJpbFUvY2pxSlVy?=
 =?utf-8?B?YUduZEtWd0pmclNqbmpVZGdGRzdDa3hwSUl3T1ZtVGppMFRTVHoyUUQyUmtR?=
 =?utf-8?B?WUxLNCs3UUFqME01cVBmTURCUXo5MHRjSFJwTFhDd2dZa1JHNk0rY0R6Zmx0?=
 =?utf-8?B?UXRHdW14aFZqa2F4ZUU4bG5uNTlGQXpmN1lhdEVHS1dDaUhyeE1WSy9ScXRt?=
 =?utf-8?B?R2JKQ0JBSWxkTmtzVjVuSkVwajlqMXFia0djOWhZYTFFaXlSZEszRlpjeURO?=
 =?utf-8?Q?34qEq+Ht8R02Njvg=3D?=
X-Exchange-RoutingPolicyChecked: mrOqBUtKTOn3LGDhR9VfsSHN1sxk4in+uT3gJ3/ZxEBa1UUiydX6Qk8rBehZsyp3k0ttWvw7H8bH0gBz2WlafXSnDBPhlLH8uyQ1R/S5mfaSzYaS/4TwKqNw4OyCpOXr8TbQ+aZPANRmLeiyuNo75M1oxI40OdoQEn1pAQ2f+G/J/xYI/3P2jymAEWTNaFD3ghhs2UnQ35KxVxG8fLvGE+nk5mAEqS75Lh0/YOUFDvpe66nIkG/OyRGAqTzVLjc94gT+fXKJEI/imHpVsesUMVYeJYRydUNbYRQgZZtii/pwanYhm0ThBZQHDtg8VScmZK7sYMr/RwSMOnweCxyRXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb02966a-0cc9-44a6-4161-08df1e1f1062
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 11:44:47.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSWDKd3YxV9lLbdkNhjtVnRjCMetHvFar+lLjD6o9iA2dPpegSSMnSFK7f5vZASAgLkFuhKIleHNIwP056CtM9YOqJiC9Jzj61TY/EjVVpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series introduces PCI configuration space tests for SR-IOV Virtual
Functions. It verifies the required values and read-only fields in the
common PCI header, BARs, PCI Express capabilities, and optional Power
Management, AER, and ATS capabilities. The series also adds the PCI
helpers needed to read raw configuration space and find standard and
extended capabilities.

v2 -> v3:
- Shared the standard capability list walk between find_pci_cap_offset()
  and igt_pci_config_raw_find_cap_offset().
- Masked the reserved low bits of capability pointers instead of
  rejecting them.
- Reported an inaccessible (0xff) capability pointer as -ENODEV.
- Stopped the extended capability walk on an all-ones header.
- Documented the remaining raw configuration space helpers.
- Used PCI_CFG_SPACE_EXP_SIZE from linux/pci_regs.h instead of a local
  definition.
- Moved the test state from globals to igt_main().
- Rejected a 64-bit memory BAR type in BAR5.

v1 -> v2:
- Dropped the unused find_pci_ext_cap_offset() helper.
- Registered sriov_pci_config in tests/meson.build.
- Enabled the VF and read its configuration space once in the fixture
  instead of repeating the setup for every subtest.
- Restored the driver autoprobe state and disabled the VF in the final
  fixture.
- Removed redundant informational messages.
- Simplified subtest descriptions while retaining detailed documentation.
- Corrected PCI register macro names for compatibility with pci_regs.h.
- Improved malformed conventional and extended capability chain handling.
- Added unit tests for valid, invalid, cyclic, and boundary capability
  chains.
- Added sriov_pci_config to the Xe CI blocklist as a separate patch,
  since it is intended for HW verification rather than recurring CI runs.

Piotr Piórkowski (4):
  lib/igt_pci: Add raw configuration space helpers
  tests/sriov_pci_config: Add VF core config checks
  tests/sriov_pci_config: Add optional capability checks
  intel-ci: Block igt@sriov_pci_config.*

 lib/igt_pci.c                   | 191 +++++++++++++++++--
 lib/igt_pci.h                   |   7 +-
 lib/tests/igt_pci.c             |  76 ++++++++
 lib/tests/meson.build           |   1 +
 tests/intel-ci/xe.blocklist.txt |   1 +
 tests/meson.build               |   1 +
 tests/sriov_pci_config.c        | 323 ++++++++++++++++++++++++++++++++
 7 files changed, 580 insertions(+), 20 deletions(-)
 create mode 100644 lib/tests/igt_pci.c
 create mode 100644 tests/sriov_pci_config.c

-- 
2.34.1

