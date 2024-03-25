Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC674C6FD1F
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2183210E316;
	Mon, 25 Mar 2024 15:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U95/ikEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA5210E168
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711382245; x=1742918245; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=bjlNKbbTSlWJwd7XKQJQBvLVzs9JqBs3vTegUjBUsuU=;
 b=U95/ikEpnVNNo5ZS2dTn44+919CnknAEt48JyFq0NqrQpNAyN2zPdCas
 26bLQj6NQao3DCiXEGbDiwy0KsmCzupfS7Hxe4xLSq9HJyWfZPLH9PD8M
 LtQ3FKUZ2ebDKoTqqigJmy6oyR8SAemRbThc2+0vFtjz1uulEIqYdq9q0
 f9LNhrmhwm3WYYu80yO2q2Cih7p3tDjMNLGZbuMD15JJg9AYwK6JBwSZd
 0zDHgUXCBvKVOu42PL3lyD6zMZn3GCw+48ROfU8Z53Ol5rpmmp43CehgE
 5fd9dn4CDQO3UYnXV+OnRtyxjQ3XV2eOz4ZLVZrlTuqLAiwD3aALurLsK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10186678"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10186678"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15637175"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 08:57:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 08:57:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 08:57:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 08:57:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1XaSh+tpBv8YSeEz7COtXx1uPN/klPBjcyzSRA5V9bL7T+vIA2aCKFCY4lnJof1bGo+Dmi3Ju3U6PoInwe04mB+TksrK9lbatDnYcWUZ3ebu1b389vnIeLJpms0nyTE5GQp9CY0sj9bPY33jVv+hVO9RorXw7oUArZbZ8YSOD/WY1FWt2DwPTPHp6D5eI1tKy5m745YIp6Qxm2AZMm9lDfXbfULjjzRSOXGu4VQDTPzYYo86FlpYAURMmNH/crTqy/IrjFJQqPXm6R91dRy3l7SPuUkHTYPARhUS6TVeAqH5/LGOg3SfQ6bJdM5gAfAACjP0BS3mm4G4K7IdMqGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qa9s26euVaLANWDTR6k4FWWqoH0JNzbZhRIi438hsb0=;
 b=IvR/4CQTHhu3Qihi9bmR5Ee1yi8dsCHnzH/WW+li9+AYgX6Z2vAhUPk9x8guaVFn+rZDooC1lQNfR8vAbS6tAVRRU5UMOYw54uMoeMWcpSi+9SmKVlG78icjnYYF/PsDSb6+9ApdH/4U+KbkWgJWCaf92BH3RL5148LpbTJvhAbT4/mkSNWv/u4XEs1h1KpDicK9cpaFzyUz/WnmCUg/9NOMFi+iO4aryfemAo7C68KVpTZ6xcc7rEsei7qQ5F9J/Hdyd0JpVRbqirttBAFO5YtVlH9Rsif7UCVqoUFsOTRhavIyBSyFI2mf4WGmvhyH4DFhlje3bb2/yIv1i5lKpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 15:57:20 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 15:57:20 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 0/2] lib/xe_mmio: Introduce Xe MMIO lib
Date: Mon, 25 Mar 2024 16:57:07 +0100
Message-ID: <20240325155709.3521039-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 82455824-41ec-4c87-4953-08dc4ce440f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jQdo7iCRanbrDO9hgPWqfkQKPyDv/Nm6LNGKcM3ogwsijAtA4F9F9If15HZZvwpwGLNKemrrcou2eN/LnTwoensLI93ONQiqfkH1wKFFMG8JQXi7aMc6D+tgwdzeVzEtxNezJyi1HbHaP+9bmOb/48dzCmRQijloEYLurBMiRaCgv5WX7FeLZi8PwHE+LSCe1PwiW1adLdAFOTVgWobBQ83KNVU9EsSREaqeOtw+mRlGwnMwbc24qHpnUvjF6Ds9PoyObzBKfzfaapj3Nnx0d2xrTSqDmgtUsXH8XeN3+3cfcNRYCVsHfB7oMmlu0ZHjODiju4+2X48JFspAoVH3krGO7yYnnwknvVV2fmtc/thEeMGnCDZa59mIrZLrDg4hn6+LdE64Uo6AEQ1zHJzjsSPnLgwotojjoyCF/zgI2Aqh7RnTk08rMPdPPFm625FXZSa1vLM1lftI0CUyzV3l4AtL/KKbW8pGgXcf97iMhr/OJ0oxZlPbG7vI6r9zCPiZFNMGz9civ2oaKgFi35gd+Tikfm/lWwEnKWMdP3cTy89yqDdJBOwJOo14oJ5B0Sb8Fcr4JM/Z6m04Kz3Z4zTWagzA6GYik01/AyjpOt26c8vRQWkZbuVIKnxrJYSpcpVe4/U1QgHjyCpIzcY10DT3mN/sj0nBFbChgGxqyLNL274=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akNPUFJBUlptOTZ2aElpV2hBSitlVkVuM3FvOCtoSzM3VGJmeHNLR3NZcWdY?=
 =?utf-8?B?ajVCSnY0MFE4V2hLYmE5NXp6WlFsU0ZUU3pVMjVPVEdwRXhlRFVWcGNzSUta?=
 =?utf-8?B?UjJQQTJaSXRBcFRKWERYUllKZnAralRIWHR3M2JsNG94dHlyNXFpb2NYSEdG?=
 =?utf-8?B?ZUhiaGhEcDBOejBMZ3ltS3V4TWdDOXJBYUs1UjdPTmJ4Q002K1NFOE5hVGUw?=
 =?utf-8?B?d2xOcmVMZFFGRW1GcngrVHd6eWFBazJqRkR6aHJ1SlVxb2NiMDFoNTc2QWJL?=
 =?utf-8?B?UVJFYXBsL3FwbUdQMVlMbmJFV1E4S3JiajA0d2lVUTAwRmNEOEdDSWp4Szd0?=
 =?utf-8?B?d1RxZlEya25UWGtTZkdOcXVzaTFyME1Ya2JyUno5V0tZRjlicmlFN0tZZzV2?=
 =?utf-8?B?bkFXcGpVbGZyMFRQa3o4UG13bUtweGVaK2ZRUXhiTFl6VkoxY0Zpd1YvbjM2?=
 =?utf-8?B?cjZLT3gzOUJhQW1ZMEF4eG8vRnlUaVVmRU9iQTlKMytMMi83WGc0dmgvZjFJ?=
 =?utf-8?B?ZjFFUjRpWm9GTFVudUxQMkxBdzBDYnlVTHEvUkR2dEpJNjFBZDFKZzVWVzZQ?=
 =?utf-8?B?RkovSmdzVFV0SjVRUURDdkJUWURoM1FOeHM2UEJTNlRsTGgzS1hZbUNhZkh0?=
 =?utf-8?B?WXNrcTRTUXFwZTF5SThZQ3lzSkZBOTE3Q21qL0ZtVG1zS3lxUXhwMEV6em9t?=
 =?utf-8?B?REppNHoxWEc2RzIyNURKc3dzd1NjUG1MWk9BTi85SzZwVWR4OEtUdVB1L3hZ?=
 =?utf-8?B?TlB2TThTY1lPV3M1K0dMcEd0U2VOemgxUmt5UjFkMDl3M29qaTdDN2J6eDl3?=
 =?utf-8?B?SHRhcnJtT2NqNGdrTG9QTVRsWHZTMko1Vk1TYXF4VWNpZi84NTFlOHZHbUI1?=
 =?utf-8?B?Z3krUkdVcHdiaitaUVFDQ0xYbWxtb3hsNUxYZzZhcTZXVGVhQ01aUm1XM3pV?=
 =?utf-8?B?Mmo2dEZqWkFJR2pCdHVLbXZQQzYvUUFwazQydXlBYkxYYkZ2T1BybjB5bkR2?=
 =?utf-8?B?Ty9JVklMQnhkdTZiM1NjRzI5RTFCWXdqZlM0TUlRV3JSZUlabG5pY1NjNnQv?=
 =?utf-8?B?UHJRZDV0UmNVWjBtclFRemY1KzRpKzJzeXpreGppbFU0b0lCSXljZ0FzVENN?=
 =?utf-8?B?R3h6cGwxMW9Bd1lMWXhtS0ZwOUJITTNFaWY2K28reFQzTlpIcWg3ZTREYXpz?=
 =?utf-8?B?RU1sSVFaZVhZN1M3N3d0MTVXam80eWVNSVA2Wm5xcFZMWmUzeE0wdXdyNmZI?=
 =?utf-8?B?UmYvNUgwbC9qNTdjbFprampLMk9nOFR6dVF4VU5HTUZDOS9pN2xhaE5yK3No?=
 =?utf-8?B?dlN3WDQ2K2ZtQTJHZVYvaTU2SStzcHdoMUNqZkxhNlRkcVpRVkZFUVBKN2wy?=
 =?utf-8?B?VEt1MnBQSEVIMzVoWlRkTVBwVlB3RFJFa1RpTEZIaGhyWHFDWG51cDE0MXIx?=
 =?utf-8?B?d0JFM2JHMThCeFV0R0NOdjIrdE9tVGUwVi9qSU1QMElldFVXQ0tMc1JaMjg0?=
 =?utf-8?B?Y2x1cG9hQksyWkUxN0R0bVNBbkY0enlnZHhsVU1DbHR5dDhVdlB0Ujc1R3Rh?=
 =?utf-8?B?SEI0dXBFNTBDd01TSm00SmVHV09nTjJKWWFEL2dZUnovaG8yVk1mRlBnNUNS?=
 =?utf-8?B?RWJVUDI5VDdZVnJCTk02NHdGejVYNVNSQnVlR1p6NzFLbFljYisyREQwdWls?=
 =?utf-8?B?ODh6SThhUXFTQ1dLYkIvNER1b0ZEbjJHYWJzZkRFTUd1YVBZRlZDejRpY1pP?=
 =?utf-8?B?N2plVVhPTG9aeWo0c2lYQXZYbkVITG43bzlaVnlNa0xWelNoR3BhOElSbmd6?=
 =?utf-8?B?ZnB4UzdIOWs2UWIzT0UzRG9VR1BlVGlzYW9wRkJFdWlxSkM0VU54SXlDRDh1?=
 =?utf-8?B?Vnd1Z1pJaCtVRlA5R0lxc0cyME5SZFBPTXd1bml3c3lXMWJiYndUL1ZPdGVS?=
 =?utf-8?B?VTFFTE9JaXBiSk1aU0gvV2JleGtSK0FyUVdZUUcyTzdER2QrTEYzUDA5OHFD?=
 =?utf-8?B?UXVOVm1GRk41aVF3eE5qN3FPcWhtdkFqdVpHZlQ2M043OGE2UVl6d1VnUmZN?=
 =?utf-8?B?ZlFkeE4wUkRja2ZoYVBrcmlJQ2lRVjJlQXdHVDlXZE5QZzZUNlhsZVBEOG9w?=
 =?utf-8?B?cGFxeXM2UlQrT0NRUUtiM2I1aHdZdDJYeXAzYUszWlBBbXlCbEFoL1hJV0Qr?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82455824-41ec-4c87-4953-08dc4ce440f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 15:57:20.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zut1EEf3FoBgGVoudDReEGafn6cNWjJndUlt9UmOX7CZ/fIV5ZlDaiSA4PQnkwwD9i/uTRLftrgQFdJzJjBwbRGZRuyut5HOkcuu0nFmlmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
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

The series includes a simple set of helpers, dedicated to Xe, allowing
access to registers and GGTT, on various tile, using MMIO BAR access.

Piotr Piórkowski (2):
  lib/intel_mmio: Map the whole BAR0 for gen12+
  lib/xe_mmio: Introduce Xe MMIO lib

 lib/intel_mmio.c  |   2 +-
 lib/meson.build   |   3 +-
 lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_mmio.h  |  37 +++++++++
 lib/xe/xe_query.c |  19 +++++
 lib/xe/xe_query.h |   1 +
 6 files changed, 267 insertions(+), 2 deletions(-)
 create mode 100644 lib/xe/xe_mmio.c
 create mode 100644 lib/xe/xe_mmio.h

-- 
2.34.1

