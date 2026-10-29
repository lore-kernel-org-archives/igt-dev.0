Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D5606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CLdjdqn7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A09112428;
	Thu, 29 Oct 2026 16:14:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C566D112405
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793290387; x=1824826387;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=hITq9B3AVM0KEVDw+pZACCEnQe9Ce2z0xXYMPaEOI5g=;
 b=CLdjdqn7GPl686onbcf0VO7679hXrICzXzGlH3QJv8wG1fjN4F6dT+o7
 liqdytqeopY3Ridwj2byj+rT4g89Yk/MaGybCDHllBYd4r3I9LwI7wKOt
 SwLdXQCaxWRLqVJFd5lbBWhaFX0dQoMuZwX07XXQpMZTwxWaqmtR2n1lF
 nAr7sMqWfhvoq+RHdAuyUtOPvmM3t56EjN8zdnF7AnPczA4QuIK/AH5aZ
 0ctxJYi3GUZILq++YA6DYLa8ZB65Pyvxac/YQbmmC6jo26e+G5LdP9CCo
 OqS/zvUc7pK/3KES8L/REZDljba44R5yIqm79adwH9Gpx07Ce+iocb2sH Q==;
X-CSE-ConnectionGUID: 9iLlvbBnRO2OTt3vq5zXTA==
X-CSE-MsgGUID: /9d2TZKWRsW+CgKhZq/vfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2044954"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2044954"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 09:13:07 -0700
X-CSE-ConnectionGUID: CGGCv7bSR6OJFaOuvBfzCQ==
X-CSE-MsgGUID: XfPW96aaTLC8OV0Fhb6KrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5167748"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 09:13:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 09:13:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 09:13:06 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 09:13:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6jd1Yfy4jE75LuKc98Y9IWbz8IwW+qkI1ZpFIO4RWLe+lB7Q/mT7zsPfbCLBdNxnik4bhRcuAnqm0MAaHw0CwDpTG/j2h9H4nAy8lHqYqzZdmMzyhXMKsOxE0BNg6s+z4h77h4WUUlXtBdSsSHWybaRWoNqyFOSTPoBsgbdAZAL1/4sihqwSFq8xc2xb3Opf2rkQgXMXXAWlWFOSzZRluTDb70S1lWkFvkrLuORn660Xpr9GE+xVd8pykb8Spl87Typa0+ujvuP0xF6wwVPy+0MjHbarLt9gqVfttvNFGfyvyvf52CmoqfTNb79xYF5E4TPbkwjEqVOLFxBdOEUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rA0tCIDRgwh5QQaGR45TTUwOtd5Rns4QAbzSULn6lF8=;
 b=LEtyN+WyJXlq/+qU+pVc9qVyV3spyul/Rk0qa5l0s5XAMWV8+VrzflmYoPw2kphRnfvPjp+YI/QnEZkxQ/XeaYs02I8y49apipZwWYwf8YBrJJLvsZZ3/d9zrwg6Iaj8yxzEAkFqBTbFRLomRNJkTkvSbrFHWzm6p0eV4XOaT5zhIK6PUVXtmxrGYe8FTM1jGWgomMCcTFFdBB/symrfuffSJswuQ2ColUCQlTEISGcrXBIXPTHI3eyhq07ovqFc8R+qbaY8ot9rS3IgvwNNxQ65QJix8Sq/IMAf1HSIaNcolo8Zg5h+e1ya6LrphSchguVgnUmNySlzxrOAIMap8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 16:13:04 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 16:13:03 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Priyanka Dandamudi" <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm: Scale BO size in out-of-memory to
 available VRAM
Date: Thu, 29 Oct 2026 17:12:47 +0100
Message-ID: <20261029161247.1363242-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 4515db0b-ba6b-4c0b-5d87-08df35d782af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|56012099006|11063799006|10067099003|261021123027099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: JcqNxz1aXXeXRcokqmjaSWd/X26/0NyopQQYkgGWZeIDn+zZDpO2pGHN63oK3okFR9Y5M3ciQCJepqRvpxn5PvTdKINrDV4Ezr1FL7V0j4Lu7uLGGecazRqxisTWjdZxPNKqLHhZxtctmHhXTWcbZ5FppUF5Zf31u1hY0SfcwkVpZCQ4pslUMqt+kS2w/OhKXD1IMtQ2DdFJpfdwwSGtUlz5j/cpr+kUXOf4X2RAVso/W01EnhVu/M5l+opRsNXuemInQt6JwrQNN5X3i8NN6lr+wJN/tX/t1Xe69aHQlJx4wIwMQGz2Z1XzSXONHjB8QR3Vy2YMMbvfA5uZHPCKx9OxBU3q9MTz2IWWY4XPbpPwHUX4ySz2ZyGI9lRpUFbkv6zmc/++ua+xRoWfaVOCLbWlZ2uShR2z2Cd3IY3ucRLXUerP+6jASGAF6gRpO6pVyil0shU9UoqQJQzWZkk0joAgS3A4PFvRtEkOPwO5+b9HL6bZy7uq94h4OCHS7M+p8wjlC9EPIQieBFyxg6Dclmwv74XEbFGbaLSEIA0znpS14kURjnpDCQhmvSf/i8LAiEWFrCPULHHie1IRrPLTW6LUZQSnq5DXUS1c4/oM3Jnu3MWUHDkmqLiOCBOZDDpLR85wYchnNu1LYUPT+8LRU2Qgcu7qIkB3SXc5n7aXMc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(56012099006)(11063799006)(10067099003)(261021123027099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDVhaGdnM0pQSXVOTFN0Yll6YlBEZ2dYZitsMlN1dkZXb3ErTXZHc0V4T3pV?=
 =?utf-8?B?UzZxcVdBYzRUZlRXQU1uWXRQVkhNTEo1TGY2VnQ1ZVc3d0RJNWpHTGZ6RzZv?=
 =?utf-8?B?OXRpdDRscExTRGVROHBjKytzaFhmVEx6TWRaSzJqaGpGb2t5MWxCU05udHMv?=
 =?utf-8?B?R2RqbXRYazBhUEwraC9rbTFnNjlOVVQwVE02SUNOZG5LV2xESG9PczhKTnJB?=
 =?utf-8?B?bDc1Z0prNHJuYUFPR1ZGdksvSTEwQWpkSGRIMUh2RXF5OFFvWjAwNmRJSnRH?=
 =?utf-8?B?RHRocHppbEVzcnlzakM1RHdhL1ZrRjh2bStMZ09USHdiSStDNkZYNnllMjRZ?=
 =?utf-8?B?SkdmVEZDWjl1RHF5SGcwcjVwK2FER1VydFFaYndtRUc0N1h6aTREY1JKZkQ1?=
 =?utf-8?B?aXk2YWhTOWpLempuMGNiNmpnUjFkbzZpSjMvdlJEY0xRUGFPaXQzRmxsMnJt?=
 =?utf-8?B?TEh2dUJDVlhQQTNJOTh6MUR0Tm54ZHhSbjB0OTRqQjZjUHBHWW1PckUydHlz?=
 =?utf-8?B?VXJBblp6aU5zSHF5bStvOVREa1JqUlBDRk9GOWM1cmlaS2hzWXdFUlJaeTZP?=
 =?utf-8?B?YjZaWnQzOVF5RjJWdWMvZGsyVkNISkVpaEtMd0hqVDhuZ2U0R0FEZWFVUFZT?=
 =?utf-8?B?TjBlbTBVajJyZDZqUy9aQm51R2FjQ2dEb29pUXhGOTI4V3lCQS83bW11dmxw?=
 =?utf-8?B?L0Z2TTExMjFXNnM3bjRxTmtqQ1k2dFh0Kys5eGN4c1FUVFZNZmN2bkJOeVha?=
 =?utf-8?B?MTg4a3ZmNmhucVNyek5SODZvR0EyMVB6czlyK0JyMFkvM2VFbXRkd0Rma3dB?=
 =?utf-8?B?ZytHeit1RlRWb2VCc3ZrRmZDV2haNy80K3BVV2xQbThZa053S3F6aGhZZ21u?=
 =?utf-8?B?T2swTk93M2t2b1FWY2xnRCtENVV0QWNvakJFU09xRFBHK08vSVhHNU1ETUtp?=
 =?utf-8?B?anRxY0txbktuUzhyS0ZtOHhmTFYrelFnZjhuVWZGblpONmNpeitVTkN4aGtI?=
 =?utf-8?B?a0lSdm5ZVjhxNlNmZ3FCZ3B0ZG9BRkZLcWRxQSt2dGY0cHZVL0l0V2J1UVky?=
 =?utf-8?B?b1RwUjFGRENCSWM2bGc5ODA2WVh4TVZRa3ljVkFlYXNqdXlKQzRRaE92QVAv?=
 =?utf-8?B?TVVwa1hCUGxyWUJ3eXA5aGFBTWVPQlFCUVlnMmIzbzNUSWhFL0tRbTJ6UU53?=
 =?utf-8?B?UW9pajlrMWlnUnE5aDRMbkVyK0xMdzlvbVlqNE5SYUFvZzJUYnZtdzdOamZK?=
 =?utf-8?B?bmJ4Qi9wZDJpeWRzQXFiUlRONU5qNXpGZHdweWpRWldEWnZ2OWxIc0w2QVA4?=
 =?utf-8?B?ZjhuM3F1My9KZC9lUG1mQ25iNGc4aGdYbEhZOFpRMVJ1bThseWdlSGI5cHcx?=
 =?utf-8?B?VWZWYk02UExXdmR3ZHBpVS9tbmtHR2lvbVdlaG1mU1lPVk96RTdkUnJwb1hT?=
 =?utf-8?B?eE1KK2RtUVhETWhxVFovTGlFK0NFQjRvM04zR1l0WFJ1cXk0dmhLa0JzQmdH?=
 =?utf-8?B?aW9EYmY0akcvdkNUSWQ3V3NqdkwzR2R3ZDhYRzdnZmNHN2VxWGpNSlJsZ1lT?=
 =?utf-8?B?ckUwaDNUQVVzdWl3QTZUOGhmL294d2JHM2xOaVhtUW1FMmJHZTNFaEVTVzZz?=
 =?utf-8?B?SS9PU1BYeDA2S29hczdSNGdsYVYrQnlta1QrZzJIQ0xHQ0FYM3BDSUZvRi9s?=
 =?utf-8?B?b3BxcXdBejJDOFNFbjAvdUdwNkdleXFyRzkvZW0rK3lMYzhYTWFRajBZMUx4?=
 =?utf-8?B?eFJsN3RtaUdxc0R6SEpzanNSNzhaVENIbDV5OTU2NDFLSkdDMjBzQThFS3h5?=
 =?utf-8?B?WmZ5RkZCOElmSTlzb0VidVNtOFAvMFdIS3hacjNqTkFBOFBndUI2R29SMUhT?=
 =?utf-8?B?ekRkWmYrT2ZpbFczUzJWVzNKQi9MQTI3dVo2UWpBNGhPNExCV05rYVl3NWZV?=
 =?utf-8?B?NDVSem5od1FtMTJhSXRVbGdhZjdJZ2RVd21MZkFtQVQ4dnBjK0FWdUtmeU05?=
 =?utf-8?B?SkJBZUZFQkJ5NTNsMEpiWHRCcWdxY3g0QVc1UEk5eFAwb2NnK1ZWY0lPTzAy?=
 =?utf-8?B?bVBkQlBhang0cFd1enVoWFJnNE56QUVCbWRlNzNEbXBzYzN1Vms2Y0U3UjFo?=
 =?utf-8?B?OVBFVjRuK0dXbE1wWmFTQVZONFJIaTQ5aDVNbjJQZVBmUlozb25Nb2FVMzFv?=
 =?utf-8?B?eXowTlVnWHBEd3lBY2cvd3VIMXZyc2M1TWxSQXpoaE5qYlBjKzJZaHJCc1g3?=
 =?utf-8?B?SHYxVEExbThBUmZsajRFZ1pTdmFVMEJVVmloRGRMVVprdWNSQ2c4dXUxckdC?=
 =?utf-8?B?NEpEWGVjL0hlYmJRQlk3ckI2MldlK2k3NXhZdFhQV3o2OHZSSmI2RkhaV1VG?=
 =?utf-8?Q?KWK+8gGUIV6KB95g=3D?=
X-Exchange-RoutingPolicyChecked: mglJRlxcq0Rk/tie7Hl8Q8SQk/ay2WP09NCvTVml5rbLp0bnrjhofuYoTKxzycMUwu9Xzg5u6dzqePfaANNqawYSvOi5ao/GD1wWufAsm4DyQJ7p8oyO82Z3katuzaPyUZ6EeFwQaWr1860NxVeNn5mqRZwter6GCNioKd/NZSmF5OUB5wlgy2hZ0EjSo+aVe+2ihLS2p9bZqk/Ai0rEw5V6VpprEYXm9a/1cDTZtypIidtSjCH3gf419JqpPVzfTyAQ0KxWVqzwRx9oySmkuO3fD9pnIT4FeF8ak8jmrPFarXNvDRG7LxyprvpJS9Q8hZ8Vb4uS2ALvwz4LFN1oPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4515db0b-ba6b-4c0b-5d87-08df35d782af
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 16:13:03.8168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBdcVgbZDR7XaC9fuZyRoRmp0heEShTfIhL6ChVxZzdMpknnVlKsXOGEGg0KmK79JbdLC4avQKdjLa0iEJKJyU3zTRJXFtcfCpjSL7YpOsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

test_oom() uses a fixed BO size of 512M. On devices with small VRAM,
e.g. SR-IOV VFs provisioned with 128M of LMEM, not even a single BO
fits, so vm_bind fails with -E2BIG (the VRAM manager refuses BOs larger
than the whole region without attempting eviction) instead of the
expected -ENOMEM/-ENOSPC, and the test fails:

  Unexpected error -7 for vm bind

Limit the BO size to a quarter of the visible VRAM, keeping 512M as
the upper bound, so that several BOs always fit before the OOM
condition is hit. Behaviour on devices with large VRAM is unchanged.

Fixes: a53a2b478cd8 ("tests/xe_vm: Report OOM for vm_bind ioctl under memory pressure")
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 tests/intel/xe_vm.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 1408cace60..30a264a4cb 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2951,19 +2951,18 @@ check_and_cleanup:
  */
 static void test_oom(int fd)
 {
-#define BO_SIZE xe_bb_size(fd, SZ_512M)
-#define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
+	uint64_t vram_size = xe_visible_vram_size(fd, 0);
+	size_t bo_size = xe_bb_size(fd, min_t(uint64_t, SZ_512M, vram_size / 4));
+	int total_bufs = vram_size / bo_size;
 	uint64_t addr = 0x1a0000;
 	uint64_t vm_sync;
-	uint32_t bo[MAX_BUFS + 1];
-	uint32_t *data[MAX_BUFS + 1];
+	uint32_t bo[total_bufs + 1];
+	uint32_t *data[total_bufs + 1];
 	uint32_t vm;
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		  .timeline_value = USER_FENCE_VALUE },
 	};
-	size_t bo_size = BO_SIZE;
-	int total_bufs = MAX_BUFS;
 	int bind_vm = 0;
 	bool oom = false;
 
-- 
2.34.1

