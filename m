Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5618BC98321
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 11:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCC610F9FD;
	Fri, 25 Sep 2026 11:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxWp499m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707C610F9EB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790333894; x=1821869894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HxfwKkzp3xurUnCaOkf+I9SxSJYXJNskH/rMEG0MijY=;
 b=BxWp499m0RItQCFM8QqPFBC+IOBLJ+J2YN/j1yfBPpGm4XPFdyD8qtnd
 w+OY6AW076dTXO8HmFsK0k4P4bkL9h/c/uNN40FnjpIQHHwL+2PwJ9hZw
 lskvN0qkrI0GW8kUMpS2lUvu5RwSlxgx4cBAVBurSvmWhtVYvbiJylg9R
 MeOKxeNyZUkdvi3yzt101+CKK6Xf3FjHBoUc0K4cX2bQqo0QRMdBB1Zn9
 IVkphU+tkvJo7kcVWR/syh6TtvP1w6IOynMZYq5W2NEOZPqkJ1wtwIr/S
 jCbJzBLn3aHvDP7E+7/QBBU13L6pVjJ7I6jK8tJCOXvodkdnZANswdZPa Q==;
X-CSE-ConnectionGUID: l+FJk+emQpi9RYUvR6UKhA==
X-CSE-MsgGUID: QS3pbv0pQqiGtFgwzId72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90076477"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90076477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:13 -0700
X-CSE-ConnectionGUID: ATZHbn85TsC60Norbp0Kmg==
X-CSE-MsgGUID: bQLL00O0SWunZhRV/UU2DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="272884227"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 03:58:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 03:58:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 03:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdMR4tJU7iy7RX/vQg0yO3dXvm24GAGUohHM8RMDGWrMjf7Ml8f44P0LrLWXbQq9tuls3q1qxmdkgDvaYxQ8aHqSYkbx9N0ho0LbEUpazjlCYXEh2fH7Pahl8XSVUmFo+zegTCcH/rGEN61BJGZOrHOZ5hWzGZwkBUjAZduHI9XoVd64qtpQrFq0U5/tH/91s9epl8q4a17Tj3Wv5V7ubqyTJVYmi7CvtGqHyu3WLdJrbkIxHup8/e0Ux71Vrnx/3JWV8YyjoE/JId1zf1OJ7o1c3YFJYq2zP29qErCmhBtDf7yUHxHHDMShawtHZ0VoTU+lcaleIfpn5BJN1P5Xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8/ixd7k520VEul4gbpncgVfUMfmZQUjbWnIRnvfyMg=;
 b=uu+9oTdc8OrPIlnFeaIRJwfbbHpEg7J5HYKYWX1IRIpBBrlXVmCSUPLuGiKfiwWFbtKgXCn6/h3KFVK9Or0K/xeMsXa5w/uJWSdN8O56JxrC+M0dWnSeeb4cQByfLUO1FJ2CSzBke9BzAkyTqiRxK8RwXZFuVvvi8osreTDBkf8EuK3/JOLDBw2+zyIlkqtAhZXLlIZqQbRoiZNaYfC1bArk9v0AsWJsN3CgNnLGt0MqNrL/nZlHVnb2G0L3dfJeYyPFwzMI0t8lXFNcL6GAoSpOW6Ri4fTyY7gLgQhiuLG0Xr/gGm+bu34Ca3y5Xm5DBAMEf0i+Xjp8yiDmlt6gwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 10:58:10 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:58:09 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 7/8] tools/gputop: integrate i915 and xe PMU engine
 monitoring
Date: Fri, 25 Sep 2026 12:57:47 +0200
Message-ID: <0b56b441614d8e5e0f24f1c79cdd49efa9a2931a.1790331690.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 670542e1-3a28-4106-a70b-08df1af3e2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 7paBVvjbTGhkmfXzqo08B3d1T8cKtoKYWq7nxALALmLj6cGJNIpo/nrd8bip4gOUQ5CuDqnrooVLjkd1KWxcL1ItebqwG0VqG7prXP+vWKbGhKa+FU2iuspIlW7c5v0UioqjO3IjsnOMhVS+phWID8HaSZQaEevW+N4zL1Vb2pdImRZk/GJoH9zAfmIdn/ykYH3v8F1F09LVHA12094GomVJv9j7w8rodOW26Ejin8XQrfRTyILronS2eous5X9Hb+OSIyQQ1X7AHBJrpEJx+mRAUFseOxhmjw0Md+52tf9H+zJNS1cyh4xM5UQofktSZe8eYUFSV1hZpd7VYbyuGOhmkUtXuj5watViiIzaDRDJsb9M+quQcDdgq/l9g3izgMLO3PBJUtucs+CXSqroJxouJ0qWlSeld6UubMB0xKKDHyahTqX471uDhHXY2eGKNDLII3Tk5ko0OBLoMwwO0DhM7CjPrmoyfBE57npvroUn99QR2SrPKtz3mwOK6pk/z0ud0CinU7JGvOj/NFFw6mLyfRO+rfMglAqvkI+aUZ6bhtXAd9caNLCU8r92tuEX3Eq2Y93gWCPcbWrLOu+Aj1utKrQiz5kpz9+mZzD7UupjoYyyvEqFqT9ICRSxXEDmbX4kGakcg+9uDbSkojdBQXFIofG2bwb/o4sNeEcaxAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzUwUjk2ZHB1Wmt2ZE8yRGNXdDR4YlVkQnJKc2RPc0wxbHFTK3N1UnI1WmJ5?=
 =?utf-8?B?dmgvQTlMSy9ocWg2eWJjcS9kcklDZk1rRWVqVDh5N0t2M1JPV2dBYjlxMVVu?=
 =?utf-8?B?aXRPOTNFT3ZueTlVbVNnaGlHKytoV3VEd3ZicTZzbHhpRnZFNlgvYWpEZ0FM?=
 =?utf-8?B?UTB6WjV4b0dQRnpEanJlVm0yOGIxd2pMMithSnJ1bFZ1T21rUHZFS2MyVmor?=
 =?utf-8?B?b3pqTjMvN2Z0bHpZMGI5eGIrSUVBcm9vT2F4aUVWOExMbStVZUZIVmtFNmFW?=
 =?utf-8?B?UUtLQzFEY2t0ODFlbUFXcDBwTGZuRXU3dlU1ZUdIR1JvZUJCZVM5ZmpEQ0dB?=
 =?utf-8?B?NS9iazRxVWhtQ25zYmRBSUpVdGRUci9PZ3UwL05FL3c0L1ZzaEdRSVc5cE1P?=
 =?utf-8?B?c2pxT3NPeHphZHFlNmZSUWt5OSs0YnRaZldxaHFLaGZkbVpjL2NVWUVySGtI?=
 =?utf-8?B?TmVnM3FsTU5UbUd2d2dMOXN0M1BFcWVreFJSNnFkUy9YTXVESm4wWHY1d3Ar?=
 =?utf-8?B?aDY4NWt4QTVYWXAwOWRNcGlhRGFqdm5lSEdxTEhkVjZHODJYOCtyTFowVUNF?=
 =?utf-8?B?VGV3dXNlbmZuaHV6MWpYTk50bjMyUkJJUWQ0azkwYWRtLytSMEVjQy92bldN?=
 =?utf-8?B?YVEzWGxBOWpXZm40eWdENGlBRUFCeVFybThqdlZqQThCcUFTbllRUjB4ektZ?=
 =?utf-8?B?ZmtqYVhGeVR0STV1T09vN2VrRXBKcVZ2cnl2T205ZjJ5NUQ4aGpMT1JBWEti?=
 =?utf-8?B?dm81TmtZSE9nSXlLeGVubFBRTEh4NFdtdC81NW9HQXF6VS9tRFRPNTFPRVRr?=
 =?utf-8?B?RDYyb3dFcGQ3aXZBYmttaEhoRjQ1Ym9YOU42OThqZm8yWGgzOHdlUWs1QWs2?=
 =?utf-8?B?Ry9nN2RkVmsxR3hQTXp0RXAycmt5Z0lRc040STBrN2xCYXh0RTVHVkxhM2dW?=
 =?utf-8?B?cjBhL3BQd0RHYmM2dDhGRUVLMUtiRzlBRHVOUjhNMThtWjV6REYxQUhiK3dj?=
 =?utf-8?B?cDMzQ1VNYVRkUEZEQkgwYXNmNkZHRHpUSmhicXdSOTJDYlg0UFF0TWlQM25y?=
 =?utf-8?B?Zk5uT1JyMXJIbWdtdlhRS2VpMHlhUkVrQWZvQ1phd09pU1M0MXZtdG9pSU0x?=
 =?utf-8?B?czhtVEx2ZXBxTXRVNmRtZXkxaTV4aFdhUjdGWEo2aE9ERUtFTVFzY0xWOXZE?=
 =?utf-8?B?TGJSZ2lSaFJLYWVJYUFyWmtadFM0Wk9HcDRWR1plWVRzdU1rRVBrRUZ0QzQv?=
 =?utf-8?B?WnBiS29lSGJtRHBHZFFuYjZDQ256c2xzWHRSUHprc013SUk5OWhZNXM2OXNY?=
 =?utf-8?B?WGRvTm43L25zWDRSUHdKZkdqY1hkeEU5T1hwdVlmcVhxZ0NLc0pxVDhTMldS?=
 =?utf-8?B?VjBkdkovYmJVM005MnpyLzdYSnphdmQzbUZxeTZuYU4yS0VqeVNDSnhrR2Zv?=
 =?utf-8?B?VHpmSEJVYVdzajgyZzcwYVJOTFdPcXhuSlFWMzU3Rzl3SFZ6NmxkMEl6Q1BC?=
 =?utf-8?B?cEVPTUxuUzVVSkRLeUtTNUdlVmIyUWNJUDdibkxzRStZdG96MkIvM0dwcDJ2?=
 =?utf-8?B?cGZnNWVnNDIxc3d5d094UmJRbGxRSGRKWWphOWQ5SlA5aG1JMFkzaWp5SWMz?=
 =?utf-8?B?anVreFhkV3lVQUJnRGV6VGVCaFBVd1RlWlE4cU51RHg5K2VoZjU3eXc1WTAw?=
 =?utf-8?B?WHhSakRzaVFaZlBVY0NHZGlKMzdlYjdzczNRek1nVCt5cHZPMitlMGFzYVZy?=
 =?utf-8?B?QXlwT1QxK2VicXQycEhFa1ZDY2JGVENmbzBlblduL0lWaysvRS9xYlJjNSth?=
 =?utf-8?B?bkw5TW02S2d2Z2djQ1BYd0tKbFpMVFBZMW1maWhXZXJrbkdKQThwQWlPWUMy?=
 =?utf-8?B?SXlGVXVFZDlZbXpNZ0lmaE5qSGpNN0l0WktHbDJWSitkamJzTnpGdjZaOEdU?=
 =?utf-8?B?clJoNS8rMGZ5UW5SN3JMNkowOVF1U05NclZDbG9HRWxnKzdDRlg2dWhLTmhH?=
 =?utf-8?B?eExwS2RrOWRaNHZpTnpLSkFtN2hqRm9uZzlIU3dyU0ZRc1UvU3NSZXF4NUdU?=
 =?utf-8?B?a2UvcDJYL09zcHJtMjV1aFB5SzN1WEViUGJlR29OcDJlYzN1NkhWRUxYV28r?=
 =?utf-8?B?OHhjVDNrdjNoeWtVRDlCTmVEQ2V0aXkvOXFkM3g0RUJaNllxQ2dLak5IcnhH?=
 =?utf-8?B?NXgyVllyblRvekdZSUszQTBkSEJIMUxyaEswb1pRODl5YkZKd3Fwb0hUa0Vq?=
 =?utf-8?B?Vllka2lUWDlXMXdhc09wQVJlNkQ4aS9jaHpMZ0RrN0M1bkVldURoVkRzdG40?=
 =?utf-8?B?YURnQ3BhR242eE9iWWxCWGlpRmE1Ui91SE1aalhoeTRhK0l3ZlhWdGdRemt5?=
 =?utf-8?Q?/dsVm1FRDfh35LZc=3D?=
X-Exchange-RoutingPolicyChecked: umfQdWuhEfxHcXHNNtc44gj1ESV872qSBRZ/jD3JfZGSS4UjpItIBIz9nXsiustNk7LvGnmT3zpgHvrBKY9QzA3o1/nSqYrEqR/ZoU+NsSJZQlANHufE/gh6r7ocLgYOG4q1mpbgSFV2GtlCi2ThiGGAkU/RmM1+s9wFBlEqEgisfGB4hvsBXmW1gUHRi8K0DskPNuq6jC2y8cwilqCphpVINGbXhPypO5D/qtOxP+C3vm1RYiKWCngGg3Q7gF377F77mTVUuMYr9cq8gpdU109pSIrvo6NavLKvkdgeIWdyqD2GUY3emuQjPAe/5T/gShZwp9WBvXUVjpYLoeNSow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 670542e1-3a28-4106-a70b-08df1af3e2b1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:58:09.3721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vItYWjGNUKp1Br73bqxlDubEsUY45u4gdabgcrA/m+8BHhsAwmbKMqbS5kKwWYFGtrECrcFkmLYbCDVYC5Pk11WT7SizwnqfDaRNDbxDcY=
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

Wire the i915 and xe PMU backends into the main gputop display loop.
Rename intel_driver_type/is_intel_device to gputop_driver_type/
gputop_is_intel_device to avoid symbol conflicts with drmtest.h, and
drop the local print_percentage_bar(), n_spaces(), bars[], ARRAY_SIZE
and ANSI_HEADER/ANSI_RESET now that utils.c/utils.h provide them.

Add per-driver device_operations dispatch tables (i915_ops,
xe_ops) and pmu_devices_init(), which discovers devices via
igt_device_card_match_all() and initializes each one. main() seeds an
initial PMU sample before the display loop, samples and prints engine
busyness each iteration, and cleans up PMU resources on exit.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/gputop.c | 218 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 160 insertions(+), 58 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 0ed5af456..adfb31447 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -30,59 +30,21 @@
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
 #include "igt_profiling.h"
+#include "igt_device_scan.h"
+#include "gputop/i915_gputop.h"
+#include "gputop/xe_gputop.h"
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
 	UTILIZATION_TYPE_TOTAL_CYCLES,
 };
 
-enum intel_driver_type {
-	INTEL_DRIVER_I915,
-	INTEL_DRIVER_XE,
-	INTEL_DRIVER_UNKNOWN,
+enum gputop_driver_type {
+	GPUTOP_DRIVER_I915,
+	GPUTOP_DRIVER_XE,
+	GPUTOP_DRIVER_UNKNOWN,
 };
 
-#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
-
-static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
-
-#define ANSI_HEADER "\033[7m"
-#define ANSI_RESET "\033[0m"
-
-static void n_spaces(const unsigned int n)
-{
-	unsigned int i;
-
-	for (i = 0; i < n; i++)
-		putchar(' ');
-}
-
-static void print_percentage_bar(double percent, int max_len)
-{
-	int bar_len, i, len = max_len - 1;
-	const int w = 8;
-
-	len -= printf("|%5.1f%% ", percent);
-
-	/* no space left for bars, do what we can */
-	if (len < 0)
-		len = 0;
-
-	bar_len = ceil(w * percent * len / 100.0);
-	if (bar_len > w * len)
-		bar_len = w * len;
-
-	for (i = bar_len; i >= w; i -= w)
-		printf("%s", bars[w]);
-	if (i)
-		printf("%s", bars[i]);
-
-	len -= (bar_len + (w - 1)) / w;
-	n_spaces(len);
-
-	putchar('|');
-}
-
 /* Get the correct sysfs prefix based on DRM minor number */
 static const char *get_sysfs_drm_path(unsigned int drm_minor)
 {
@@ -116,25 +78,25 @@ static bool is_bound(unsigned int drm_minor, const char *driver_name)
 	return strcmp(driver, driver_name) == 0;
 }
 
-/* Detect if this is an Intel device (i915 or Xe) */
-static bool is_intel_device(unsigned int drm_minor)
+/* Detect if this is an Intel device (i915 or Xe) by sysfs driver link */
+static bool gputop_is_intel_device(unsigned int drm_minor)
 {
 	return is_bound(drm_minor, "i915") || is_bound(drm_minor, "xe");
 }
 
 /* Detect Intel driver variant */
-static enum intel_driver_type detect_intel_driver(unsigned int drm_minor)
+static enum gputop_driver_type detect_intel_driver(unsigned int drm_minor)
 {
 	if (is_bound(drm_minor, "xe"))
-		return INTEL_DRIVER_XE;
+		return GPUTOP_DRIVER_XE;
 	else if (is_bound(drm_minor, "i915"))
-		return INTEL_DRIVER_I915;
+		return GPUTOP_DRIVER_I915;
 
-	return INTEL_DRIVER_UNKNOWN;
+	return GPUTOP_DRIVER_UNKNOWN;
 }
 
 /* Count the number of GTs by checking which gt* directories exist */
-static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_type)
+static int get_num_gts(unsigned int drm_minor, enum gputop_driver_type driver_type)
 {
 	char path[256];
 	struct stat st;
@@ -142,7 +104,7 @@ static int get_num_gts(unsigned int drm_minor, enum intel_driver_type driver_typ
 
 	/* Check for gt0, gt1, gt2, etc. up to a reasonable maximum */
 	for (int i = 0; i < 8; i++) {
-		if (driver_type == INTEL_DRIVER_XE)
+		if (driver_type == GPUTOP_DRIVER_XE)
 			/* For Xe, all GTs are under tile0 */
 			snprintf(path, sizeof(path), "%s%u/device/tile0/gt%d",
 				 get_sysfs_drm_path(drm_minor), drm_minor, i);
@@ -185,12 +147,12 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 	char gt_info[64];
 	int num_gts;
 	int gt;
-	enum intel_driver_type driver_type;
+	enum gputop_driver_type driver_type;
 	bool first = true;
 
 	/* Detect Intel driver variant */
 	driver_type = detect_intel_driver(drm_minor);
-	if (driver_type == INTEL_DRIVER_UNKNOWN)
+	if (driver_type == GPUTOP_DRIVER_UNKNOWN)
 		return NULL;
 
 	/* Get GT count from sysfs */
@@ -205,7 +167,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 		bool has_cur = false, has_act = false;
 
 		/* Read requested frequency */
-		if (driver_type == INTEL_DRIVER_XE)
+		if (driver_type == GPUTOP_DRIVER_XE)
 			snprintf(freq_path, sizeof(freq_path),
 				 "%s%u/device/tile0/gt%d/freq0/cur_freq",
 				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
@@ -217,7 +179,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 		has_cur = read_freq_value(freq_path, &cur_freq);
 
 		/* Read actual frequency */
-		if (driver_type == INTEL_DRIVER_XE)
+		if (driver_type == GPUTOP_DRIVER_XE)
 			snprintf(freq_path, sizeof(freq_path),
 				 "%s%u/device/tile0/gt%d/freq0/act_freq",
 				 get_sysfs_drm_path(drm_minor), drm_minor, gt);
@@ -252,7 +214,7 @@ static char *get_intel_frequencies(unsigned int drm_minor)
 static char *get_frequencies(unsigned int drm_minor)
 {
 	/* Check for Intel devices (i915/Xe) */
-	if (is_intel_device(drm_minor))
+	if (gputop_is_intel_device(drm_minor))
 		return get_intel_frequencies(drm_minor);
 
 	return NULL;
@@ -523,6 +485,28 @@ static void clrscr(void)
 	printf("\033[H\033[J");
 }
 
+/* Check whether any DRM display/render device node exists at all. */
+static bool any_drm_device_present(void)
+{
+	struct dirent *dent;
+	bool found = false;
+	DIR *d;
+
+	d = opendir("/dev/dri");
+	if (!d)
+		return false;
+
+	while ((dent = readdir(d)) != NULL) {
+		if (!strncmp(dent->d_name, "card", 4)) {
+			found = true;
+			break;
+		}
+	}
+	closedir(d);
+
+	return found;
+}
+
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
@@ -603,12 +587,72 @@ static void sigint_handler(int sig)
 	stop_top = true;
 }
 
+static const struct device_operations i915_ops = {
+	.gputop_init   = i915_gputop_init,
+	.init_engines  = i915_populate_engines,
+	.pmu_init      = i915_pmu_init,
+	.pmu_sample    = i915_pmu_sample,
+	.print_engines = i915_print_engines,
+	.clean_up      = i915_clean_up,
+};
+
+static const struct device_operations xe_ops = {
+	.gputop_init   = xe_gputop_init,
+	.init_engines  = xe_populate_engines,
+	.pmu_init      = xe_pmu_init,
+	.pmu_sample    = xe_pmu_sample,
+	.print_engines = xe_print_engines,
+	.clean_up      = xe_clean_up,
+};
+
+static void pmu_devices_init(struct gputop_driver *drv,
+			     const struct device_operations *ops,
+			     const char *filter, size_t instance_size)
+{
+	struct igt_device_card *cards;
+	int n;
+
+	n = igt_device_card_match_all(filter, &cards);
+	if (n <= 0)
+		return;
+
+	drv->instances = calloc(n, instance_size);
+	if (!drv->instances) {
+		free(cards);
+		return;
+	}
+
+	drv->len = n;
+
+	for (int i = 0; i < n; i++) {
+		struct igt_device_card *card = malloc(sizeof(*card));
+
+		if (!card)
+			continue;
+
+		*card = cards[i];
+		ops->gputop_init(drv->instances, i, card);
+
+		if (!ops->init_engines(drv->instances, i)) {
+			fprintf(stderr, "gputop: failed to populate engines for device %d\n", i);
+			continue;
+		}
+
+		if (ops->pmu_init(drv->instances, i) < 0)
+			fprintf(stderr, "gputop: failed to init PMU for device %d\n", i);
+	}
+
+	drv->device_present = true;
+	free(cards);
+}
+
 int main(int argc, char **argv)
 {
 	struct gputop_args args;
 	unsigned int period_us;
 	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
+	struct gputop_driver i915_drv = {}, xe_drv = {};
 	int con_w = 80, con_h = 50;
 	int ret;
 	long n;
@@ -619,6 +663,11 @@ int main(int argc, char **argv)
 	if (!ret)
 		return EXIT_SUCCESS;
 
+	if (!any_drm_device_present()) {
+		fprintf(stderr, "gputop: no DRM device found\n");
+		return IGT_EXIT_SKIP;
+	}
+
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
@@ -640,6 +689,28 @@ int main(int argc, char **argv)
 
 	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 
+	/* Discover and initialise PMU-based per-engine monitoring. */
+	pmu_devices_init(&i915_drv, &i915_ops,
+			 "device:driver=i915,card=all",
+			 sizeof(struct i915_gputop));
+	pmu_devices_init(&xe_drv, &xe_ops,
+			 "device:driver=xe,card=all",
+			 sizeof(struct xe_gputop));
+
+	/* Seed initial PMU samples so the first display has valid deltas. */
+	for (int di = 0; di < i915_drv.len; di++) {
+		struct i915_gputop *s = (struct i915_gputop *)i915_drv.instances + di;
+
+		if (s->pmu_device_obj)
+			i915_ops.pmu_sample(i915_drv.instances, di);
+	}
+	for (int di = 0; di < xe_drv.len; di++) {
+		struct xe_gputop *s = (struct xe_gputop *)xe_drv.instances + di;
+
+		if (s->pmu_device_obj)
+			xe_ops.pmu_sample(xe_drv.instances, di);
+	}
+
 	while ((n != 0) && !stop_top) {
 		struct igt_drm_client *c, *prevc = NULL;
 		int i, engine_w = 0, lines = 0;
@@ -650,6 +721,28 @@ int main(int argc, char **argv)
 		update_console_size(&con_w, &con_h);
 		clrscr();
 
+		/* Sample and display PMU engine busyness per device. */
+		for (int di = 0; di < i915_drv.len && lines < con_h; di++) {
+			struct i915_gputop *s =
+				(struct i915_gputop *)i915_drv.instances + di;
+
+			if (!s->pmu_device_obj)
+				continue;
+			i915_ops.pmu_sample(i915_drv.instances, di);
+			lines = i915_ops.print_engines(i915_drv.instances, di,
+						       lines, con_w, con_h);
+		}
+		for (int di = 0; di < xe_drv.len && lines < con_h; di++) {
+			struct xe_gputop *s =
+				(struct xe_gputop *)xe_drv.instances + di;
+
+			if (!s->pmu_device_obj)
+				continue;
+			xe_ops.pmu_sample(xe_drv.instances, di);
+			lines = xe_ops.print_engines(xe_drv.instances, di,
+						     lines, con_w, con_h);
+		}
+
 		if (!clients->num_clients) {
 			const char *msg = " (No GPU clients yet. Start workload to see stats)";
 
@@ -682,6 +775,15 @@ int main(int argc, char **argv)
 
 	igt_drm_clients_free(clients);
 
+	if (i915_drv.device_present) {
+		i915_ops.clean_up(i915_drv.instances, i915_drv.len);
+		free(i915_drv.instances);
+	}
+	if (xe_drv.device_present) {
+		xe_ops.clean_up(xe_drv.instances, xe_drv.len);
+		free(xe_drv.instances);
+	}
+
 	if (profiled_devices != NULL) {
 		igt_devices_configure_profiling(profiled_devices, false);
 		igt_devices_free_profiling(profiled_devices);
-- 
2.55.0

