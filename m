Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFD1606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vt6Vud9D;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KyfOPQWO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F1A10EA29;
	Thu, 26 Nov 2026 18:10:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78A910EA0A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 18:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795716354; x=1827252354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X51x9q+LjAt7UmmLNVnEh6BxUgv23Bh+ZSnZCZk1jW8=;
 b=Vt6Vud9D5tXJc+UwoMoDqKEyhnY6WnMqkSg6a9I5kEbSnxxYXN6+73WB
 4GhWBfwPPmePbG/OI7jSyoAQi6ByloVDof3f76eftp7BZdmt3EMxFlxM+
 CJQGzpORi9bpZK2VMX1s7EWqWFSpCYsUGc1Thp1vyXpf9DpgYPgii47bJ
 RR8QM93hcHIjQJaQuf4RKDVlplLNAtWCw34CSIoBuGgVdAGrdAl9KXWoI
 r2ZapWVjnX/Bb8HrGxQeGuMGtHkwCMlBsx10onT1x5VpgeZvYR3i3/ZX0
 NqnjkNbO1+t54FN7F0tBBM8MO5jibsItTBA9z49bL4RvLNyQ0W8OhFdqV Q==;
X-CSE-ConnectionGUID: pT9OoYmsRyeayolV44/fNw==
X-CSE-MsgGUID: UsUBZ8ewTTus0djxK5QJmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4541036"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4541036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:53 -0800
X-CSE-ConnectionGUID: mgfgD7rMTL66jaqqJj98IQ==
X-CSE-MsgGUID: hTOz46IPRNGFeWRqDP0gMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12560602"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 10:05:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 10:05:52 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 10:05:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU0svDtGjmwNbWQeFF+jmI/FOZ5zDaa9NCgIAmN2rsEndH+rowaKYhlP7vQmnzJXqMtpqdJ0MW4oX6bMuZkwvkk87WPwuJ1Te8f3DYzaKHl5BKvsLplqwMAkiVGjKWaUGFtV9g28EIagkaE61JtlifqidfJHq8xNSIGToVTe6G11OGaQSre9hppAyahDh9NnAecAfiOswaYIzIevuyVa+2nT365M1K0c0MmLOI6ngJjg9K352OtpDd+FgH0FxPOqmYYvDprZI2F1ANl3RDowo7oYQgv16xvUKxcUVBrcZUekEipbdivKgsOCx/sZN3JyBsbmJAfB80ptmfAfD7ziEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDeQJU1H+SzIyOOaGcWZCIa18X0+lBdbE8GNz6fS5ro=;
 b=yWK+VnxklaUtgSBp2khGBwQCIHeO7sybCqEjIFaqW1BUacpiqlPuFzBAqd3lVqx6DKEVjMv2ut7GYiwV8MuODUdUCa/eJBN9CONwBHqfCuUMosZwWdZX2qYYQhOrANDWo/FzmRJAY/jibdCVyq7oRNKd4RHNsLeVA18eTtRBoFqAoBBx5rnDKXF4DwVLQNFe4D8cV5pae/I2HM8A3jDpSRuYp3z4ROecbUn29/4kpo3dyQDM4Wbv7SCV+zhXSFYk5nAwEmD27nQH6cJgz7ytUs/LmD/gcs+ckbFg1CfFJS6kA6E5btHh8GVoJQzDC+dhB9DzcuKxKeNMYRNJP8PD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDeQJU1H+SzIyOOaGcWZCIa18X0+lBdbE8GNz6fS5ro=;
 b=KyfOPQWO0IuU+dH/V0eD9iXvZLrNrn8Tl7iwZkuxXNo0RCtzOtvRrjjXhvQkw3W+mGz/COk0UGE2nThFZmSSKjcoJeqq1CpSFswFNs/2zJaKMeUzwLi/5MSczt5AIe3WvG+t4/SJSsGvrmlyLmqRXJSCXd9p/M06rmOp3KQ8jek=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.7; Thu, 26 Nov 2026 18:05:45 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 18:05:45 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 2/9] tools/drm_ras: Add a DRM RAS netlink tool
Date: Thu, 26 Nov 2026 13:05:36 -0500
Message-ID: <20261126180536.487442-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126180536.487442-10-rodrigo.vivi@intel.com>
References: <20261126180536.487442-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::29) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d49c477-8b4f-4e4e-e903-08df4be7e4a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|261102123227099003|261022105027099003|261022075727099003|10067099003|56012099006|11063799006|261026140227099003|261022113327099003|261026121527099003|261028144727099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8FcNaTRWML32msTVKD02eu5omtNtBIdcJ/RVklp7XbEirOXJ6XIgK4cdzLk702bCdgNe6E0t/rN3/Q+hJAgEBOO8OqpxdaZgytWUXcOzzELWa4CdyseevQtLAcif4WQPAH9kP5T8sd2PeNXh15m5Bq8Yd0JTASIemg3OKSlHbFSjrtdo47RjUZYRbmzDyT4rZgCb1360O3VCA7YPYpd+zfT4170LPYaRdBEAkrmuBB+3WYsU9k33zDLz2SyWOUjSCBvatfTZpgVeO8WcfAV661sOFkNd/tiY1T9WYdoo+COQiIJ4ZWZZ+K7O9l9CktjuJJlZlN3oQJcH5ezAk2ZO9sv6Pysm8tXPGCvhfQK3r1XhW5/L3/kznw2UYCel5qri9Z800Hhy8jprFEbF+0oEZSrNBAT3EGdqRTEYbM84Xr+mpRf6Dq5VddTBx73xujw759bbpa68mjiSxvgHa7SIEqM8k2yA6eg/YBhQPTwAcBEdparRjLYz0MN4gEMKJyAP49+yThac4BIHWr/2mwmAZpePnOVcrHCooYrj8DAHtfNB570kPvWAAOV+d6/Dc8fgWR6eydb9wG6VSmwmHQASvAKU4l0S/bDhccA2qJ+3OF4jMAPT1g2+ujebHSY61sDKTOT3CgU/5K4+We0BzDYs8XDxC7xKy/9iUmwOzq/6XHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261102123227099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261022113327099003)(261026121527099003)(261028144727099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlpBWUt6WGZTZ2pLWHBEcHYzVkdFNDYrcHBEZ3RnYUs0djhWMTFhSHFSaDdr?=
 =?utf-8?B?aExobnJCS1JkMndMSXp3dTRxeFB2TVpPcUpJSURRRzhIbE1kcy9BT2JLbE14?=
 =?utf-8?B?S3ZZTURHUk5ic0d5VmZKYmFiaEhLSXg2Ni80K2FkY2Q3Q3JDTXdCNkpTYU5n?=
 =?utf-8?B?R3o4K3RZY2ZwWDd0ekk2TjdFdGt5bmFjYnN3OGp4dysyOFZPZ2FsSTZiOWRk?=
 =?utf-8?B?NlNadUllNDRWMCtnU2diSUVxTkxUT0ZndkhZNDlvbG1PTXlHRjBxbUxSSXFk?=
 =?utf-8?B?R0RNN2pnMnVJMDJ0RTlmQ3Naak5RMTdMUFZPRGI0a0FacEJ3eWwyRCtoc0lX?=
 =?utf-8?B?UjZ2Y2FsUUNLTUpTMnBaSXl2T3B0ZTgranBWNlFOVitCUDZYWksrRFdzYTdW?=
 =?utf-8?B?SzFmRXRCRS9vcDlVbGNvRThrU3VPN1U4NDRCL3dkU2lROENlQnVhNGxwbFNV?=
 =?utf-8?B?WElQOFRtT2Y0dXhxdy9VbS9NbUpVRDdBMHBMRloxSEVESnR4eHNSZnZjSEY1?=
 =?utf-8?B?TjhNZ252QW9BamhJUFFGcnBBcElXUkwzd0JkbkY3dHFUNm9lRUg3YWt3QUk4?=
 =?utf-8?B?ZjlZS3VrWGt3RDVTNy9vVlhid3ZvNzV3Q0lQVmkzamdldStmV2ZNNmdRWTVv?=
 =?utf-8?B?Z2JjcFpPSjFDYjRLMWYyU3JNOEwwY2RDNWx0VFZIU0g3dkMxcTU1Q0dCbmR1?=
 =?utf-8?B?SjBBM1VnMW5sdG9RUXNoejZuRDdsKzhSTGV2ckpFRkY4K0FZd2tmNUI4Q0dy?=
 =?utf-8?B?RjBsSzY0Z3JEYVJvaWViWVJHS1Q3UFZwaVZXMUJ3R21lRWdIdXlVblFsNGdF?=
 =?utf-8?B?RlYxTzA1c1FKczFTUEQ1OUQwS25lUGJHOThLM0VmTTRBdkRSNy9jTUxQSk8x?=
 =?utf-8?B?ODVrcUNmOG5mMTBnVVVUUTJWb1d3Sy9TY0hnOG01c0FSZkl6UFpXOVpEa25H?=
 =?utf-8?B?ZmtPYXhkQk8yaEtQdzM2bm5mWDMvd3dKTlV4VTZxMmx5andrenY5eWRZVVUx?=
 =?utf-8?B?M2U2NDVGclN5bWZQbWpLY2ptcTkxRDQwQnNxOFQ0Qms3MHErYlpmUk9Gd2dk?=
 =?utf-8?B?R3h3VFRwVWdRd3kzbWZjY1BNcXE1Vmw3bFJPb0lpZlhLZFhOOTkvNE00WXQ5?=
 =?utf-8?B?bVp6dEwzZ212UXVxbWpSZk9xUmdNQlp6LzhDNDBDa2F6eWVJcFlkZkx6YUta?=
 =?utf-8?B?Tjh6S2dxSjBEdXVrcDFXTlN0SWZUQ0oxc1FvTGVYNVNrVFhYTThlYWgvTWdq?=
 =?utf-8?B?RlJjcUpnNkpacDE2ajQ2b01aZk93d1ovWGE3b0FLQ1hLUkxhaG5JSnNkazcv?=
 =?utf-8?B?YzI0bVh2aXdhVzRlMU45MS9tTWM3MEhyQmdyNDlXaVpEdjh3Q2toNmVCakUx?=
 =?utf-8?B?Q1liUDJQZDMzcitXZ2pFWm10bzJza0RDVXRLa1N0MGt1c3B3V3FUM1QvdmFV?=
 =?utf-8?B?SDByY2RSNDk0M3UvdkU5aUUrV1ZvN3gzc2I5bzdPL0FNRzdBaFhiNUhINlA1?=
 =?utf-8?B?QWh1ZExsV2c5M2N3ZXR1c01CY2U1bjdPTS9nSjZWZlgrK3Y5ZG1mc0RoZ2E0?=
 =?utf-8?B?SVN1SHN2NnlOYktJelF2N3JtS29uWE9uaG1Xa01rcGVFd2hkN0hCSTZJMkVX?=
 =?utf-8?B?REs4dzl0Q3RDTlRCM0ZyakR6SGlIZHBncE90a0RpZkJmVGlSU0NLdVNWS3Fu?=
 =?utf-8?B?U3N5YTJ5cVQrbmFvQjR4bitpU1JVMWxvc3RNSGFabXoxNmtwVENuK09tcHhp?=
 =?utf-8?B?OTU0bDY4S2Fwc0VJRjZTWjJUczdjK1hpWTdyOFVMbTRWdCs4SExWQ0dSRm04?=
 =?utf-8?B?ck81Z09RSHp1Y0FWUGIrWkRVSnhoRGhCRTUxVjJwUk93Smp3bXNwdFZOUUY1?=
 =?utf-8?B?eEZHRHhNRWYvM1hDY1NxREhxTnRCOWY1b3FnSzI0TWN5RU9YbVg3NDRMd0do?=
 =?utf-8?B?MlQwSy9FQU55MlExUGR2UmlPaDBqVkg0TnBVQnhtcy9XbDRwQnFac2lVUmV4?=
 =?utf-8?B?NGwvdk53MTF2MlF2eVl2dXBxeVp5d2VXZDZYVEJXNkZVNEc2aVJiSVFTdjJI?=
 =?utf-8?B?d1J0N0EvSXVDbExnTy9xLzQrQjdUZkFQRWFPeGpNWjNPa3VNUmFsaHBlL0VB?=
 =?utf-8?B?ZG1QYkZNaVhuMFA3YjA1MmhEb1gwUCtRemNScWttVWlkS2ZwNkx1MVBINEVH?=
 =?utf-8?B?RWtTWEhtV1g0a0xDdEtCOHNOMDBEVEhWVkE1K3ZFaUVoUnh6VFhwQ0F0VXVU?=
 =?utf-8?B?WjFwNDVSSCtBWldOZFJKTzZQTXJWRTRka1NxSThUNUxDdGxVcjE2dytVTEkr?=
 =?utf-8?B?NWxqYTVTcWhVd0REZjFTZzdXNHhoaTVqZThrMmQzaFdTRXRJQjNmUT09?=
X-Exchange-RoutingPolicyChecked: FbLu5RtCJ3Z6pZVW/qfEqveDrM256tvJv5UOEhH8fiqo0zOtLY5kHb7J9kAJkeYbnSHYrJS5B70MeW7eShAeD2ZYn3rRIjsoZWooUcw9Dzg4NeaNi+FySN7bh7hS3BOlGmsHYJAZOWaCUCWGnGJy7V0PiKmGi+QVKtDv1n1WdWjefQbLtMw6gAGH8TH93x0/FKYI8AjrzSPa9HRv/5DSJ1io5Jal19+GTcpRxbeVQ4ae0lyfincfIHCNtWz5xtWgBzAMrFmZy9/r0HIPfaNbRnQnJUnlFrmR88jk08mY4zWdzAx+T9D+TVRCBciEfQ+i+hRggFSCDCAyOitRw5mSxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d49c477-8b4f-4e4e-e903-08df4be7e4a2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:05:45.6915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQdjXSNwTpYqukVmD/YvsI6+RHyfl8nmIBF7Ze0B1M+NVH3XKq2TLZCESk+hORWMXOap4Qoa7v2vpla5cnA2Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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

List the drm-ras nodes, and show the error counters of a given node:

  # drm_ras
  0	0000:03:00.0	correctable-errors	error-counter
  1	0000:03:00.0	uncorrectable-errors	error-counter
  # drm_ras -n 0
  1	core-compute	0
  2	soc-internal	0

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tools/drm_ras.c   | 106 ++++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build |   7 +++
 2 files changed, 113 insertions(+)
 create mode 100644 tools/drm_ras.c

diff --git a/tools/drm_ras.c b/tools/drm_ras.c
new file mode 100644
index 000000000..0af1ca919
--- /dev/null
+++ b/tools/drm_ras.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <getopt.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "drmtest.h"
+#include "igt_drm_ras_nl.h"
+
+static const char * const node_types[] = {
+	[DRM_RAS_NODE_TYPE_ERROR_COUNTER] = "error-counter",
+};
+
+#define name_of(names, i) \
+	((i) < ARRAY_SIZE(names) && (names)[i] ? (names)[i] : "unknown")
+
+static void print_node(const struct igt_drm_ras_node *node, void *data)
+{
+	printf("%u\t%s\t%s\t%s\n", node->id, node->device_name, node->node_name,
+	       name_of(node_types, node->type));
+}
+
+static void find_node(const struct igt_drm_ras_node *node, void *data)
+{
+	struct igt_drm_ras_node *found = data;
+
+	if (node->id == found->id)
+		*found = *node;
+}
+
+static void print_error_counter(const struct igt_drm_ras_error_counter *counter, void *data)
+{
+	printf("%u\t%s\t%u\n", counter->id, counter->name, counter->value);
+}
+
+static int show_node(struct igt_drm_ras_nl_context *ctx, uint32_t id)
+{
+	struct igt_drm_ras_node node = { .id = id };
+	int ret;
+
+	ret = igt_drm_ras_nl_list_nodes(ctx, find_node, &node);
+	if (ret)
+		return ret;
+
+	switch (node.type) {
+	case 0:
+		return -ENOENT;
+	case DRM_RAS_NODE_TYPE_ERROR_COUNTER:
+		return igt_drm_ras_nl_list_error_counters(ctx, id, print_error_counter, NULL);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static void usage(const char *name)
+{
+	printf("Usage: %s [-n <node-id>]\n"
+	       "List the DRM RAS nodes, or show the content of one node.\n"
+	       "  -n, --node <node-id>  show the error counters of a node\n"
+	       "  -h, --help            show this help\n", name);
+}
+
+int main(int argc, char **argv)
+{
+	static const struct option opts[] = {
+		{ "node", required_argument, NULL, 'n' },
+		{ "help", no_argument, NULL, 'h' },
+		{ }
+	};
+	struct igt_drm_ras_nl_context ctx;
+	long node = -1;
+	int c, ret;
+
+	while ((c = getopt_long(argc, argv, "n:h", opts, NULL)) != -1) {
+		switch (c) {
+		case 'n':
+			node = strtol(optarg, NULL, 0);
+			break;
+		case 'h':
+			usage(argv[0]);
+			return EXIT_SUCCESS;
+		default:
+			usage(argv[0]);
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (igt_drm_ras_nl_init(&ctx))
+		return EXIT_FAILURE;
+
+	ret = node < 0 ? igt_drm_ras_nl_list_nodes(&ctx, print_node, NULL) :
+			 show_node(&ctx, node);
+	if (ret)
+		fprintf(stderr, "%s\n", strerror(-ret));
+	else if (ctx.dump_interrupted)
+		fprintf(stderr, "List changed while reading, rerun for a consistent view\n");
+
+	igt_drm_ras_nl_cleanup(&ctx);
+
+	return ret ? EXIT_FAILURE : EXIT_SUCCESS;
+}
diff --git a/tools/meson.build b/tools/meson.build
index 68c31da92..78587ec74 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -38,6 +38,13 @@ foreach prog : tools_progs
 		   install : true)
 endforeach
 
+if have_libnl
+	executable('drm_ras', 'drm_ras.c',
+		   dependencies : [tool_deps, libnl, libnl_genl],
+		   install_rpath : bindir_rpathdir,
+		   install : true)
+endif
+
 executable('igt_stats', 'igt_stats.c',
 	   dependencies : [lib_igt_stats, lib_igt_tools_stub, math],
 	   install_rpath : bindir_rpathdir,
-- 
2.56.0

