Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6FEE9D3E2
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB5C10E65A;
	Wed,  4 Feb 2026 14:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/2PsC6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A2C10E65A
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770214591; x=1801750591;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=DmlbLQs/nFn2x7Btcmx2/42GcRuhLghn/R5Yys/vXQs=;
 b=L/2PsC6pYt8Kl1npobjCeWwkKXhH7R2HijwmwrEPApBn3JpDNJ2n/0Fo
 53LCvjwG99/Xqp6B3/jr5+3YtebkOFDWNu2J502PYj3+2NMbWqqEXG9mq
 6bZdNzrDFSoB8refYnDy5ZPZwz/BeSHhokhAYEqxVlqiI22F19SLtjLdZ
 13Qx5NhkPvbj91/b/XqtA10/mxW5jBl8NQ84PcpbeKRdqfkB6xn8O6vfx
 cf9AJmxYMcrFGmVHQzuNoELO1yEKfxMRE73qWfV3uCe8Oa8vkmHmIZfG8
 YJV8nE1wELdMqhhv1GK+95nJI1fE4gKKGj7UefhiZdsUS4d9PetBmcwBf Q==;
X-CSE-ConnectionGUID: q8vzRqZQQCy08iFYjYMcaA==
X-CSE-MsgGUID: B0GnFFJzRIq7p5qnCKqnxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82835216"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82835216"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:31 -0800
X-CSE-ConnectionGUID: ex8yRscCR5mvs7jB6rUjoQ==
X-CSE-MsgGUID: CpArBYFpQT2X6tQp0/H2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214668627"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:16:29 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A76L/oy6Di7ilvQQf1SOLr5E9T2ime2hCPTe6aMpI0tepZLg79H5cy8V7gM247x57qGjccNZTxwcEBoI+J++SHVG+7aYZib14Pglkh9RaPLMbF3lJsG52HNcJy3UdFsTbdKhbkBPhGM3meWoB/u2V9goSTiXnPMXsJrEe58c9qQ9t0m9KhWaLXSO9ElvL6rZcrgIa103GHG5H5vBXOpykgTgjgKFFRN3JZtYv/TMKX+C7TpgDfPWBxHTiA/eb4IujuZNhjN1z1aMfvwrGG1gMw+SZNK+D/EgCmymc1QtWEZ1jCudr7MmAZZIQiEG3bzlS+1GcEwzgGY/zv4XyAM/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNUXtUg5RmWLa8khxkPgPQt39ztPCC2oVOII6IBXnwY=;
 b=G6EJHewaWwQV+cNOSwVMkRqYBD4C0Lu0aiFKHD5X7S3cM7BDywd//1aPT+GdcAwDYlSOCFD/3RCR8Ut28qtP72g8wJRUQPWO5aF6nsl6ugkzdaBcjV2mJq49rbRcEyNtC4RlBBYF9VCzur6lNAHkZ3UU9pK1TKpaYvymEr990QPHyl+bvmXsCBRoiEfrJzuWA0t0wslIBLf7ickmJQTtu1/StNg6xvKhoiQXjo94GJCHtPLaRPBwgbVnqm/yx84qKqx3u6zfv8cx/j69o+P9OaromHeIOf7l+1374jAKiezQW8jEeLlUTtCA5YCDexSakWvN065c4JoS1Wdyaw0mRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:16:24 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:16:24 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <krzysztof.karas@intel.com>, <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/6] meson/tools: split lightweight igt core and reduce
 tool dependencies
Date: Wed, 4 Feb 2026 15:16:02 +0100
Message-ID: <cover.1770212190.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7c5022-2d7b-402c-c276-08de63f7fa60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkJzSGM0Y2lJalVkUUdINjV3dklLSDlqYVl3aHpqU0psdGM4YlZIeWpIR2Vo?=
 =?utf-8?B?TGMvdndOSTZQQ2VvdEdBaGsxOHdaRnJzYVlxSDZsU0prTksycW04WVZnTVNo?=
 =?utf-8?B?dTh6Z3ZxSk1FcjNxeHNTSzJhcDFVNHZoSElIUGNXNGFzcHZpYVNUNXpuQkdk?=
 =?utf-8?B?aU5qSlZrenhSTldnTStPN1ZkOFRZcmF2MktJdXZlSEwzOVVZL2M3cWhHR2xQ?=
 =?utf-8?B?c0Q2dUxPM0FEOVIrbWo3ZEdtZHJSaVFtVHh6THBYSmdGMEpvRE5ZZkVKM1hw?=
 =?utf-8?B?RUZMRnBKdll0eVc0QVVwNGI1V0t5QkplZmQ5dmJhbmF4azFYVXp4WlZuSnFp?=
 =?utf-8?B?RlpqN3VsK09HVUx5M2o2K0tIbGcxVTg0VTdJVFpyL3dIWDM5Q2MrTFRYVmdq?=
 =?utf-8?B?QUxkQ0tMRWs5d1lsd2NiSGV2a0IrbG41aHFVYUIzTDhrZHJSRVpiTmErUW5E?=
 =?utf-8?B?eFFOeC9aNC81TUlJaXJzemVuSzBDL05nWUdIRjZFTnhmZmZiS2JzWitLUXhv?=
 =?utf-8?B?RDBlbmFtTEpoc09XNWdNU3YwcTFpUGQvOC9uYzh6TXh3SGVPYURwc2h3ZFVw?=
 =?utf-8?B?bXFMaVJpQmpHT0dHSGZYRGd1eGlwZ3hSd29MMHU3WWVWUVBMdHBRcmNDV21a?=
 =?utf-8?B?KzR0TzFmdXFqbUw5NnNkOGR4c1lZQWcwb2Z0UHNiQUZoZlk1bGZVUHRROEpk?=
 =?utf-8?B?bnN1dENEWVlTQ1dRR2FGVDhPb2Uxa2NNZ1ZlYSt0VDRSNjdvUkNHV05DR3dI?=
 =?utf-8?B?MWY5TDF2RGZ1M21HdzhJMVZYeFBjdlZsblQza3l3K1pjQS91eGJPTk9IM1c0?=
 =?utf-8?B?YVllTGNnWnhlNTcyYkFLSmc5M3dXdlYrdU5zRXRWUnZ4OHR5eDZPd0xLQ2hp?=
 =?utf-8?B?Q1dyUTlydlZ6ZVJvMDVlUVhRV0w0ZkVSOThxS2VoTDdKTU1KSmVDWnVoMU5P?=
 =?utf-8?B?RFcyTmh1Z29ETkxEWHRJYTBXNTlGV245OXJvcExkVWZBZlRqVGxzQTgxR1E4?=
 =?utf-8?B?MkdZNWNQK3JXQllBSVNoWnhWY2xaWjFEQXlpRnoxSWhSRWdRVnp6QWJqZ0Fm?=
 =?utf-8?B?TnJGQ0ZtaHl4Vi9JWjNWNWZEVk5ZbStVNmROV3dvNVFyNzIwT25UVEkyR09F?=
 =?utf-8?B?S3gxdElia1p0ZVF2WHUwT1krZGJVS2daYmhjcmY1ekN3bEFESzNMdTA5Yzg3?=
 =?utf-8?B?NnczQ1RTSjh3U3BHVkNtVTVCbTlPQjEzbDhYNzN0WCtlMFRTeXAvS0hLS0VZ?=
 =?utf-8?B?U1Y0VE5vTTdQL0tldmlCNEtXcWtKQUxnZzJPU0o2b29QRjZBQjFCTXlranhs?=
 =?utf-8?B?ZUV3R1hWYWg3T0h2aGUwb2N4VTZQazJmYzNucm05U0RsUUQ4Qm9PWkFMdTlN?=
 =?utf-8?B?c3k3TTN0WVo5Wm9NWjlCb0pKTkxsa3MwcEx4Zndrc0pGVXh0SkN4YmpnL3VW?=
 =?utf-8?B?Z1pkVFNRK0dWanQxbkFoRmRiaVFGeU92L0gyandnSldPSVZUZEd1cERzSlRD?=
 =?utf-8?B?c1RydFRoZ3lZSWRORHBmc3ZZN09zcCtqOW8xRHFBd0hHaHNlOUh4Ujh6Ylhn?=
 =?utf-8?B?S3RWUkswUTJCaEVZMTg1ZWNmNEFRaTdncmZVbzdqL0VnTklwSlJhQ2c3YjFB?=
 =?utf-8?B?dlBEUG5qbzhvRGo2bitmc0R0QmZ1OXNEMjZMbDIxdDlyYTBoSXNpOXZHUHY3?=
 =?utf-8?B?OFp5Z3dHdmpqKy9tdTVZN1F4N3VTU1dVTEExWk9DditlbXgrMExUei9xRVdj?=
 =?utf-8?B?MHhlbmRSWW96Vi9NSGVUNXh2ajhSbFVhSmxXOWNrUU4xZzlEeGxtK1hDV25a?=
 =?utf-8?B?Z1FQb1AremdmczdSQ0EvcEh1SGV0TWxXeWpYSDFJSGYvellhaHNkck9MWCt6?=
 =?utf-8?B?ZGJST2pvazZ6V1dhQmgxV01JakJ4Ui83aDNKelZzOFFlQjBvMFVVbUZZRTAv?=
 =?utf-8?B?ZnBnczFXRzlHcFRaaEJwSnRZcFFPLzk0cWxTZ2hxYnNiWWFTQzc0VDBheEMv?=
 =?utf-8?B?OVhURXNhN20zRWM4Rk1BQXdvNFJpMUthUnVLWGRzY0ZmcDBqZEt2WVE5MllT?=
 =?utf-8?B?YlZ3Mmt1Y1JhdFcyU2dJTHdZb2hQbkFFT3NYMHErWFB3ejlvL0Y5aEkyYVIr?=
 =?utf-8?Q?CSho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2VkbE51S2NNMWgrVldMbzRsMmhwTTFwN0tyZ21NU0pOVkNlUm9uMEFYMi9h?=
 =?utf-8?B?Q0VtbGNucUZRdzBoNm1QYnJLVzU0WmxDWUJnQ2x5UUVCZ3RFTnRlM002bG9m?=
 =?utf-8?B?YTgyOVpPWTB6L09kWGpobUZQWkdqdUQ3OFl1U1hKUjJxWnJkUUtLdWV4K0hw?=
 =?utf-8?B?MzY2Q0FDNTI1bEJaZTl4ZUhqY3V1blJaU2ZOVklYcmZVQ2xIaHJxTnhWc0RD?=
 =?utf-8?B?RmxxOUU1RXBkblhvUmJHaytOT25VT2FyU1RSRFRaUEl2ZG84Y09heXc2cFZ3?=
 =?utf-8?B?TVcwVGJYOEpkeEtRMlBBWXJ1endoVERxbWptS0tYTE9sZjBQYkhGLzYrcVpV?=
 =?utf-8?B?cnNJalNKclliTld2N3R4Qno5K2NoQWZsbnN5TEdhMG1QVEFRQzhFeEsvMUJr?=
 =?utf-8?B?cWpvcnJ4WXZ0cWJYemdVbjNkcGpWTmQ1QW5lZlR3MU5KRUU3d0xiTjc1R3NQ?=
 =?utf-8?B?VVBXNWtQUHY1cTJkdUtXdm5FVDVSTzlDTHpBMy85S3VJOFErR1VHazgyYXcx?=
 =?utf-8?B?Y3g0VWJQVWlSNkZiYWpJQjJKTVVHZFRWNEYrdzExWjYreEFSNzRjKzA0RkMy?=
 =?utf-8?B?bXAxSW9iWk56OUZrZXN2MzlZLzgzMHdBL2RnZ0wxQXYwTG1rc2k0R24rK0pG?=
 =?utf-8?B?QWhoTll4bFZTNU1VNnVGbno0cmJkSHBQLzVPLzJLL3hpTVhDSGNtLzBlOTBq?=
 =?utf-8?B?enF0UTVXTVMxYWY1YzhiMURUQmFoUFFUMlNCZGZzTVVzL1A2dzVNc1BUUnBj?=
 =?utf-8?B?T1l1ZWRCczFBbEZZaDdpTzRzSWp0b1llMmJpcTdTN0lIMDQ4SnowbVZ6a1lh?=
 =?utf-8?B?RGY3MGdhb3FUb1NsNGlWeGRManBBSUN3TVBEUFBBcTRBTnpjK2lSTEt0L2Fu?=
 =?utf-8?B?WmdQd1R1QWx6Wjh0WEJZdjhCT1B2SXg1dGUwNGszTGhrd0EySEpHb00wZjBC?=
 =?utf-8?B?czMwRFE0V3VIZkZ1ODdNeURBRy9XMnRidHd4Y0NjRFZmYUFma20rYXYreGc0?=
 =?utf-8?B?TitNd0xqbTByUWs2S1NSU3JWUW9XeTZhcHdwdlFzSHhyem5jWlF4djVieG02?=
 =?utf-8?B?bDBnTHV1bjUveXlIdkdzWDVpek9GNmpTRXUyODJpdjQzV2diNWFMT01qc1Ev?=
 =?utf-8?B?S1VyMytGVXlCMW50aENqeWJKdGxCendYZm1PTnZFeStLNGQyeHNEMWZPQnlW?=
 =?utf-8?B?NEIwZGd1VkwvcVI1c0wxbkFlMWdrYUMrZUxKOXBhWjZheDY3RUFtM0JaSjNl?=
 =?utf-8?B?aWw4V201OTRDUGZGZFhtTFJ0N0VSV2gxVXp0VEdVWnF4dHloNmFJQjlpTnlG?=
 =?utf-8?B?K0RKVm0yamtrODZFbjNaNlVKbW96YlEvSEpoSTRpNjNjSVUrNm9kQXBEZXZ5?=
 =?utf-8?B?andnc1Z2aElnK01DaG9QNTZQVU5FZFp5MER0U21nbForQWoxRDFXZWZZMEQ0?=
 =?utf-8?B?SUpzQjNEa0lZai9pNkpiV2ZIVHM2Qk4vUU9XRzFxV3Y5Z2xhbm8xU04zdk5o?=
 =?utf-8?B?Y3lrTUhDS0pZWVZJS1hwK0hYUjF1dkVzQ1lobE1ERkdTMWZlbW9ZTG1pTnVM?=
 =?utf-8?B?emhEclZ4Q01mMFo3a2dwYVZhejd3b3NXM095a1RYOXZPT1FiSlJIamFKajJJ?=
 =?utf-8?B?c2dsVjVoeEVpMUpvSFlUSlZOdkZaVHd3NDQyNjdZMFdiN3o4dFpRakE2eXNG?=
 =?utf-8?B?eDIvaDdEeExZVlFKNHAwTlRFN3Y4WWpTSitub29Zb081NG56VnFFRk9mbjlS?=
 =?utf-8?B?SytUYkVhL0YyNXA4YUtQNDZrWWpvdDlHYmI2emVVZ1U0ZkVEUzFua3ZqbkFy?=
 =?utf-8?B?MWhnbW1Ga0FIWkVlSUdpeW5qTGtRaTdUK0dRZkh0ZFZmc2IydEpuODUzZlhi?=
 =?utf-8?B?endjZlRxb3oxbERLM3puUUxCSzFURGFpN28venpoL3lCblkxcVFua0tyalpU?=
 =?utf-8?B?SjB0MXdXcUFFMXB2TGRWN3I4ZHhuTHBZQkhac1ZSNlBuSTBJZnBOajQvTXhK?=
 =?utf-8?B?TjRmdEQxL0hVOUxZV0xlUndOQ2hwN01pQ3dwQ2ZqZ2VYZkFySDFDeUdwdVA1?=
 =?utf-8?B?MGZwSnVBVEN4QVZXc3Y3eGhzQmJpT09Xejc3SDE3YklFWW1yRDRBa2dUNWRT?=
 =?utf-8?B?K1hOaUM0UXFTUXkwblJjQ1ErNHNLR0prY2dSSU83TjlkSWVRMUt4OXZNYkhU?=
 =?utf-8?B?bml2Ymt6SE9qclYvc05mZzRLY21ETDJ3Uk1lWXBleHFMb0wzVVhGZXZLVWtl?=
 =?utf-8?B?Ri80Y1YwNS9kRHRYOWNYYjFGN0hncEVCMFVaSXFDRHRXUkNIZFU3RnpMYkJs?=
 =?utf-8?B?SlRpY2pGRnlGVlFwUVJ6UEF2VlprcUxIWndQZDdFNDJjMmtUVEQxb2RXdk50?=
 =?utf-8?Q?cxnYk6dVNuAsyF4I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7c5022-2d7b-402c-c276-08de63f7fa60
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:16:24.6020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pKOIhADRGp5cU4am0iQTN34WvUSrUnZDWdq7TOQNJ/PLliVEpG+540pu5yNLdK27uznLFaMUXp/CBPggsQVOFYvo2UtJdsq/hAn1D382Jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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

This patch series continues the effort to reduce unnecessary build-time
and runtime dependencies in IGT tools by clearly separating a lightweight
core subset from the full IGT library and by making tool dependencies
explicit in Meson.

The primary motivation is to allow simple utilities (such as lsgpu) to
build and run without pulling in heavyweight graphical dependencies
(Cairo, Pixman, X11, etc.), while improving maintainability and clarity
of the Meson build files.

Cc: krzysztof.karas@intel.com
Cc: kamil.konieczny@linux.intel.com

Sebastian Brzezinka (6):
  tools/meson: make per-tool dependencies instead of using global deps
  tools/meson: sort tools_progs entries
  tools/meson: normalize tool dependencies and executable definitions
  tools/lsgpu: drop cairo and switch to igt_core
  lib/igt_tools_stub: Add igt_load_igtrc() stub implementation
  lib/meson: build core sources as per-file static libs with minimal
    deps

 lib/igt_tools_stub.c |  43 +++++++++++++
 lib/meson.build      |  42 ++++++++++++
 tools/lsgpu.c        |   3 +-
 tools/meson.build    | 150 ++++++++++++++++++++-----------------------
 4 files changed, 157 insertions(+), 81 deletions(-)

-- 
2.52.0

