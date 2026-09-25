Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52756C98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 11:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB1B10F9F8;
	Fri, 25 Sep 2026 11:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cm/DDDfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B70910F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333881; x=1821869881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1ToyKUe9lb4SoeltaXx4xNMd20W5V19/GP6i+cGtczE=;
 b=Cm/DDDfRiV0uB4vcfb8sYpYf2/mqImcbBXfcjcZLiOd7P/iZPD19voNs
 bh55TvZLZNzM7x52vfcy2pD7+U9i9ua6+6SU5EcY8n8DqwZcxX3aNyYP+
 e29hMZHiIjqQtNzwo7s7nwNZJxRRiHG5rgBx7d93LgbMJSrOEzI2Zhtfk
 6DkEI/FkVEnI/G7SXYClFsqqd0GFSgIJocxXFjUsUglw3AaAaLKjabl0A
 bXDrI4dGOBdy47IbOD3ZmSlbbhopW7XQ9GWDTRU+3Zk12YiJa/S7/oTFe
 R1sp/OCt8lByH+05rrhXxWbRxHhoqwuubNenKsI50qS1Vum089LzoJN+q g==;
X-CSE-ConnectionGUID: 5Jn5ebqoQi6/7hrjm8x/Ng==
X-CSE-MsgGUID: 79OKa4EDRdWpfdSyQmvGRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94935921"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="94935921"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:00 -0700
X-CSE-ConnectionGUID: f820BgBtSAi6Y87FvSVnRQ==
X-CSE-MsgGUID: wdYhiZDNS7a+4qSXrjcoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="312230357"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:57:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:57:59 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nhdgu+4QO0KSkAhu/m0/J0xyXDjJdSyk6q4A7AmtOCS9Wcdo84s48Cm/1YRElcZPy55kjxASzxO54cDSdsqY+AH9p7CvOZ71gNwRE5FA0biid+2f4IjJREjN2s7J/w8z5Zoqo45QaQo5m/IvSiVTYuu6IPAIkBSDe395yXZbwAbNRLvGr5c2DVNfwzCRi5us68uf8Aq6O8iBiYMIkfkfYZFzZ2wTk5qTvJtKWd3tvCb259ToSjssGQ0SL+1u+mUoCD+3UbcJPYpkA+L1lrTcd7AcB5/4a7FvsnqFFs45rnvgI8onzglMPJW3veer6r18tGpQxbby/7innVnAHtrKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OumZL6ZdP+jENpI7Ue7WK63OHVo8woLShblF2fFIlfg=;
 b=CgBZ7+S8cbR5JQQ5l2qzTrCqtCI3rb9E+HuAeuL9sAQzi/LNDuQgeBkSK0JsZXbx4sRhPMn0U9yKHziUNuuJv/UG/BX/ItPDHtQ5YgomGaatvl5cHRa1JchO+QQ/7VE3CYyd/uPJiXHe3YtEsco+U8/8nIOzLdawD0VwNIiZ2ih0ELJ7VycnwGutptmd/Zqyni/bshbvC33tjHe4cCQ31MNB19eMQt0m2G/0aa+KMpwPK9yPIMR5GSzk5jKXGNe5SEBuwOJtF1rbexkhnF9r5jEBCiBXM9YZBeH5roKeaU0r1WTzYHxio5meXvM4Tlu/PZ1A4rM/qBZm7LZ4BxolTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:57:57 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:57:57 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 1/8] tools/gputop/xe_gputop: fix struct layout and PMU
 read
Date: Fri, 25 Sep 2026 12:57:41 +0200
Message-ID: <a839f4c50d30389830ea3436c5bc157770d81620.1790331690.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790331690.git.sebastian.brzezinka@intel.com>
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a108d7-504e-4db7-918d-08df1af3db60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: /z+VEGQvC/cXWyuGc3/PMHJ28sWEWLndJsyJjx0d62NT8n5hSD9Os4wE6cRKEuXnLqHK605Uvak+DYi0RFqZEu0P63y/0KKAhaZ1d89u7deWNhi7bDO6WF+OiLn5OcIEqHJ76p54VAN0AcilDn3qOx2zEwH1acNMrPl+4ka7fy7hijeTgHrOXesrVAKDIe2mO80fkGZjxXvwBTd5z5zTbgMkBJblMJq/QL2mcmZv5PaOcd6fatrYtJCWI2gow5cOW7zR81rPcXnbD0PVP0o0YkryvxP3stPGdwtZfNkaTkgB96ytpW+vxcpyot+yFSRVuenydasNQD2fNwzYlxCufKwERZrqgk4vuvaGzrCvLifZwDS1pOV3ad5iesu55FjLEpRPL6DF1/nAl1C1xAq2m91OIuQ8gJiGsvvmq9CsbArM9e2EWB7l9PoT4JMkgG0rkzz3zz7qqcvxL+dzDQyVnyK/B6xPDlZP9ypE7aukyG7JOjIA3OPzY7xuO3SGlMEaMq+rRWdXNNy7uq6jppclXK6q2HZaIC9DDpoZfZ0rUXpLpjQyJLyGqjjMz5ZpObjX9cmsxBGirLs+jExaeQGHQpb3lcNIzdIPrTBhjTFgH/qfZaDMghu3AQ2Imbf2xRa3hT2knXApAfk4TQGMSN2VYot1MTNqyS/kFmp7m9SqE3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akNrZHFOVDRTNUtkUlZEb2RCRWhSWWpKVE1Kd0Z4TnZlTG82V2dLRUdKaWRZ?=
 =?utf-8?B?TUpEdFRsMWhsL0lRbi8wdTFCYndhWHhUa3FKZUlYTWpOdnJDMGxOZ2ZXKzls?=
 =?utf-8?B?WDNIaGpLcU1ncXYzWXpjTUpTS1dsZ24rbTQvcm15SGVaUnlzL044KzFWYXgr?=
 =?utf-8?B?aUR3M1dvamYvWVk1K0RmQTNaYS9IYzZmT3FwSFFvZnF1NFo4bWlXSU1VV1Nm?=
 =?utf-8?B?ZUdIS0h5dWpDTGJ3TXVHZ0tXWllWWVhaYmpTc2ViT09VYWUzd2VZL1hQcGVE?=
 =?utf-8?B?a0ZGUkpDRDh2ekUxSVdIa1h6a08rSlM3cjRlRjVwWHZjeXZxaW5lY0hxSDB3?=
 =?utf-8?B?cllFNVZoZ0lpOGRyK3dwTU9EdW1SRkZuMUVFQlRJa040TkdRWTdYK1EyMVJS?=
 =?utf-8?B?YTFWazVidFpvYW5ycnVUOXFTUVRXWlhKSDBPNlEwMi9pQ2hBMWp4K0NrTFRZ?=
 =?utf-8?B?WXdvZjcyckcxdXVRVjhFM0VjN3Vidmd3SjFWdkJLbGV4TGlma21zc0JFVExI?=
 =?utf-8?B?Yzd3VStGTjI5Y3ozOXk2c2JZdWlFZHlkb09BSW1JSGppaXJ0cDY0NmdDbVBV?=
 =?utf-8?B?OVh4UWRXOXJLelk2dnBIZ2psUzA2eEtLb1JOVHdPVllOODl6V0hta3hBdURH?=
 =?utf-8?B?Q2F2cWNCem42MlhmOVE4aTJYMXhSbnlmeUw5WHV3d29PWDZTNnByOVF3N0xT?=
 =?utf-8?B?ejJvb01NTE1LSE4wVUpZTzNOK3l5K3IvTEZoR3R4a29kVitBQWo5ZW55ZFVt?=
 =?utf-8?B?RTkzZDQ0QUhHREh0aEpoUXY5c2JTSmRmOG5yWVVhbEdLUHlEQzdNc3c1TzV5?=
 =?utf-8?B?WUQ5NHRGaWh3NXdYcTBPTzBjaU9XNXNvUWFGRE9Vc0RiSlA2L3UyWnRpYk5U?=
 =?utf-8?B?eFJFUzk4Y0ZNR2Y3QzVxdlAyWENVQk13VVlpbGR5aEJXTFZxS1B3ZzZmNUlv?=
 =?utf-8?B?NFh6NTFTb20yQXpHWFphT1hFdEJPWVJlT1ZhaW5zZTVDMGNrQ1lkWVByMkNC?=
 =?utf-8?B?YzhvTXU3WWJPZGdUaUZyc3JERTMydEhnaU00Mm12SEdQeTY4MUR6Q3VBekE1?=
 =?utf-8?B?dVVGcEliNkhWcnpmNUQ2M0FyWDhzK3FtcjByeTR5VXpMTXNtVm1CSWFjcGdC?=
 =?utf-8?B?aTczaW1xU08vbVBCcVVqT0xXaTREZGVmVkFaL2xKZmRlSEVpWEFLaEU1cUJY?=
 =?utf-8?B?enNEaEtJRnFqM1hjS0NUN3VpS0R3dDk1YjBPQXVTT2JhcmRxWVJabElCVkFp?=
 =?utf-8?B?VDFNN0RmaWJtNnNhb1BNUktLOGQ3ZDBuTWNpYUhRWWswMmt1N2F4RE15SlFM?=
 =?utf-8?B?UDlmMkpqWmpNamFyY2R1UGFPeVN2U1hEYXhIcnc2R0swbUhUVVV3WWhibjJa?=
 =?utf-8?B?V09Tc2w2TzdCdTBFbGpwZ1Zyem9YUDRIT2wwMWh6VkliZGVtQzJQcHY3b3dH?=
 =?utf-8?B?SnhEUzF6MlRSWTA2NkllNzlFV09QSmV1T2gyQjc0YklyNGJGU1dZRG0xZC93?=
 =?utf-8?B?d1RUNkxyTUZjMUQxT0JEK0tFR25RTU5scW5FMVlWRVpwTDdBMW9HUmh5eHRT?=
 =?utf-8?B?T09QRnRaMDdxSGtReFNhUjBORHJzZnhjWjFrS1FjcUlvVGpWem8zSFp2ZUFx?=
 =?utf-8?B?Zm5TVmNnS2pESzQrc0pwbFY5Tit5MTVFRUxDNTBVMnlUMTQ4R0dqV29Ec2k4?=
 =?utf-8?B?ZG4zV1c0UVhJRVo4OHRWdDAySXhiemNkSmdhQmFOSFVXc1BXampjK0x6ejFW?=
 =?utf-8?B?Z1pnZ0NNVHdMbEhLV0lob2Z1azNNMkUxTXQwSkZUZUNRUGd1Y1RCVFdIWk15?=
 =?utf-8?B?NGdSWEF0eFYxb3A3UUo1eER0RldhTVVJY3RSeUg0K1NRbHJsTjNRRTVDMlNl?=
 =?utf-8?B?aU9NanRrUHZCK2U4YjhpMiszaXpGTDVyNURQNzF5V3JCSjFzVFY2TWtVUFM2?=
 =?utf-8?B?UzJLZDIwUFBBT3RiR1FuOWFHdzV4WmRCa1FUOTR2MlFUd25EaTlQMzJyTE9v?=
 =?utf-8?B?ZzNQMm82eXp1aElrVjA4WlRocFR5aHFpU1J1K21MOWxCWFM4ZmhYa1FRVE1M?=
 =?utf-8?B?WUtFaFRsTDlmeFh0amhpMjdoV1BUT20rSjIxSGFjQk9jVzY1dTlVemlnNENw?=
 =?utf-8?B?SzEzRVJSTEI0ZGh0Ulk0OXI2b0QxOFp6bjRnMUxlVU5aOUIxVnluMFpwMzVm?=
 =?utf-8?B?NmlRanBWS05Wa09DRG56enl0SEo3ZXlWZC9MOUdZUlhKdEpycStxV090VWJS?=
 =?utf-8?B?N3J1NmN6aWRPQ1VOK0FoaU1UY215Vi95dTgwNWg0eG1PbnlrOFE0djYwNHlj?=
 =?utf-8?B?TmoxajNpUHZyakl4K3FjNGhIcTFVK0NLQ3k1RzVpdXdXNmZCKzF5dGExOS95?=
 =?utf-8?Q?FP8uz1t1OGjRFygU=3D?=
X-Exchange-RoutingPolicyChecked: jYjyN872LWk5cOTA1PpKCGcdDAtx6x1X5iguvSJ07DuiTqD4yLduCVsvOPlS9knFqCkQuDgC8drjrKx9zPoJY4Gk4xAGDIvnqxwYiPElOshhpFp2uq/17Jg+Z+nWKGzktfrqknd+4iXhrXAHzfgJsVM4Z6cczw1j9ODdTIzqKkxYhu8Ex7GM0r6rni77Qe0Zk8sIIV0Pb3AaNGgtbZXb6XCTuNOmAwA53j099sUiuCKjANfDf6CPj0cD+D+6pRlAzZVnB5BAyoYWvez/uAXf5gK034DPCLpI5BpJbnSMKe9c1WOTHGKUdyh2uAwUyAfAo3relA6C2G/Frunmls9q7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a108d7-504e-4db7-918d-08df1af3db60
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:57:57.1078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r43uulitOcM6+AY1kT/vH59GXfrKikzNP9FRDlgCVLQX42gzLklI4V33+5ho51Hk30nmm0MxY7ksfeyopLFwvzdNw+z+RF/WR0/XsmZNiPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

struct xe_pmu_device ended with a plain 'struct xe_engine engine' member,
but xe_populate_engines() reallocs the struct to hold multiple engines
beyond that member, which is undefined behaviour. It is replaced with a
proper C99 flexible array member (engine[]), and engine_ptr() is updated
to use [] indexing accordingly.

pmu_read_multi() and xe_pmu_sample() also used VLAs (uint64_t buf[2+num],
val[2+num_val]) which are forbidden by -Wvla in IGT builds, so both are
replaced with heap allocated buffers.

pmu_read_multi() aborted the process via assert() whenever the perf
read returned an unexpected length since a monitoring tool should never
crash on a I/O error, the assert is replaced with an error message and
a graceful return.

An explicit #include <glib.h> is also added for the CLAMP() macro used
in pmu_active_percentage().

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop/xe_gputop.c | 35 +++++++++++++++++++++++++++--------
 tools/gputop/xe_gputop.h |  2 +-
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index bb2caa6ea..119545c75 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -3,9 +3,10 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <glib.h>
 #include "xe_gputop.h"
 
-#define engine_ptr(pmu_device, n) (&(pmu_device)->engine + (n))
+#define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
 
 static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
 {
@@ -212,29 +213,45 @@ void *xe_populate_engines(const void *obj, int index)
 
 static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
 {
-	uint64_t buf[2 + num];
+	const size_t buf_size = (2 + num) * sizeof(uint64_t);
+	uint64_t *buf;
+	uint64_t ts = 0;
 	unsigned int i;
 	ssize_t len;
 
-	memset(buf, 0, sizeof(buf));
+	buf = malloc(buf_size);
+	if (!buf)
+		return 0;
 
-	len = read(fd, buf, sizeof(buf));
-	assert(len == sizeof(buf));
+	memset(buf, 0, buf_size);
+	len = read(fd, buf, buf_size);
+	if (len != (ssize_t)buf_size) {
+		fprintf(stderr, "xe: PMU read error: expected %zu bytes, got %zd\n",
+			buf_size, len);
+		free(buf);
+		return 0;
+	}
 
 	for (i = 0; i < num; i++)
 		val[i] = buf[2 + i];
 
-	return buf[1];
+	ts = buf[1];
+	free(buf);
+	return ts;
 }
 
 void xe_pmu_sample(const void *obj, int index)
 {
 	struct xe_gputop *ptr = ((struct xe_gputop *)obj) + index;
 	struct xe_pmu_device *engines = ptr->pmu_device_obj;
-	const int num_val = engines->num_counters;
-	uint64_t val[2 + num_val];
+	const unsigned int num_val = engines->num_counters;
+	uint64_t *val;
 	unsigned int i;
 
+	val = calloc(num_val, sizeof(*val));
+	if (!val)
+		return;
+
 	pmu_read_multi(engines->fd, num_val, val);
 
 	for (i = 0; i < engines->num_engines; i++) {
@@ -243,6 +260,8 @@ void xe_pmu_sample(const void *obj, int index)
 		update_sample(&engine->engine_active_ticks, val);
 		update_sample(&engine->engine_total_ticks, val);
 	}
+
+	free(val);
 }
 
 int xe_pmu_init(const void *obj, int index)
diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
index 1e3856071..c26db0e7e 100644
--- a/tools/gputop/xe_gputop.h
+++ b/tools/gputop/xe_gputop.h
@@ -41,7 +41,7 @@ struct xe_pmu_device {
 	unsigned int num_counters;
 	int fd;
 	char *device;
-	struct xe_engine engine;
+	struct xe_engine engine[];
 };
 
 struct xe_gputop {
-- 
2.55.0

