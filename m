Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8EAE6F086
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 21:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC86610E0BA;
	Tue, 23 Dec 2025 21:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjP88cSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A547D10E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766523644; x=1798059644;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+DU+BIB2mHMMQtkdiGeKnZDKpWyyLakLxC7DN3fB5xs=;
 b=WjP88cSK0IbcHnmTgUr2toWK3y9QczAlGR2q0YB7nwQeI5bCt3oukeDK
 goopS+/wiaCW9U5OsQiAubJPnT6cjknIqEJAXioBwvg5r7okxKsrIUFL3
 LRYXpPUu9f2784MMpR+vM+ESRU0+LsB23YD+0sk7ITlyYbdrn7a00Q3LC
 6Cm00C8fYtzLipnHE93BLQWNJ+GQjhOGjoFR2jSUeja1fBBGIj5xnI5w+
 zOo0/fOBLLKhQWO2oxtqy2k7da0e8HcEG8XVcN+jh6X+hxRuxnok9sCsw
 twH4U0u+jn7cjOaz6sZQLyrJPvrVaKGg2CcuhpRJDd2pkFhZdAAFdnhwh w==;
X-CSE-ConnectionGUID: Y8wV2h3DSryTYzsqx8skNg==
X-CSE-MsgGUID: ohTtPihPTH+M+j3YdJA+AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68445938"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="68445938"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:00:43 -0800
X-CSE-ConnectionGUID: r6DPYXDLTXmeo5C0KYydzg==
X-CSE-MsgGUID: X8DXKKTvT9ucbD/qaFu/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="200159923"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 13:00:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:00:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 13:00:42 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 13:00:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlGqvxQ9fUCtu/BIQns7XMT06Wpo7RPbPjukMRHAekxjVqtPUAVViGNPLSulAFlF2wUK3RNAmHVJy3YiUVkeRF44pK8uyKxWbi4+zfCcGuld8aTbfO2Xrf022gp0eaQQL8BESJFos2Yb0hLw9nf7cR8QNp6R62ap/kSNssMgTyjtj1z+7EhxyASNWaPqDtb//mC/LPdUarOsDN5cmqztXKp2o30v3l7iElrrNeW2kPdwaKxqlXZx5/hkGtH6ZWB8HKVkTXWz6LLNbb9jxUBUIche9g5x9zM8o7S8l1nqEkKd4JLcnZTU0Q99WiHa3PYqCPTY8QFHCvOb2a0ZEzfByw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1eDd3d6AjVTAQZXvvw6QN5jkgWboSq1UJyizpfKYfo=;
 b=ac9zWa3aqE6krQUisloO0DK9oUmNlEPgtRHWpYSomofVtP9rIUo69ArO5pQDiIKOSJPmgJEb/Cy4NKkl/Vdn/z95Jsf26D5wR/o0C3gCr6bH8IDtIz6CqGqxtzt1OEj2StKp+lyWbKQhO1lWT/s6UEXYN5z8byQr3qzkBHX03HedE3UGLELfJzrdmg4hE6iEvU+PywmqYWUE66dRWrShFGeNVMXByfAHV+jIimJm4nL7KudQz/FMyUeknLqTKIkxvokHG/QXEs9Hzz60kaprWx8znhaEaWLRaJLz34N63je9o6BpWaTpThU9nnedFguV90oRogHZJha+AgPaNG2Dmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7804.namprd11.prod.outlook.com (2603:10b6:8:f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 21:00:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 21:00:40 +0000
Date: Tue, 23 Dec 2025 13:00:37 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>,
 <zbigniew.kempczynski@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v8 1/2] lib/intel_pat: add pat_sw_config debugfs parser
Message-ID: <20251223210037.GT4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251219234615.90213-1-x.wang@intel.com>
 <20251219234615.90213-2-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219234615.90213-2-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: bf34f0c8-6826-4e03-8fd0-08de426653ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWdkcThneHZkRFUyNkxBeC9kbVVhSzFoUk0xVjZ5QW1NUzhQUFBoY0FNNkZN?=
 =?utf-8?B?cTk0R083V3VOWStZNDM4Y0p4UFY5d1VXVFowbjBPdW5ENmEzeW5nWXhiaDhw?=
 =?utf-8?B?SVRoaVIrdWJOaWpyNHNzR05qbUZWVG5DQjBsdllsL2t2bkorYmpyWlRmeDR6?=
 =?utf-8?B?eWVISzhwVk5LQnpwaHZFbzRJeW5kdkVhSWhxVGhkVE4zZUU1anVwd05qT0Zo?=
 =?utf-8?B?azNDWnEwQ2hwV1hyelhWenJNNTdoSDVaRW5hc3hWcTFaS2RRWlJmNVd0SWdY?=
 =?utf-8?B?R040dkozZnplbVFtNnREMXZnSWxYUTBadWZVNUdmWDNUM3FwaFJOTHJhdWpO?=
 =?utf-8?B?S3NkM1BFajQyMDA1eS9vTndja1YzWkUxdEFZbFVKcGI1eEpPYWZOeGwwWTRt?=
 =?utf-8?B?MHprTE5JdVhiaFVRRWlicUllQ08zMjdybVZYcGgwdTRoU1FaTnZJZVRNV24z?=
 =?utf-8?B?OEtxZ3RGa21jZXFSUFNJcWc4RUd5REU3WnpoRG5iTEFNNXgrZWhBQWpWU292?=
 =?utf-8?B?OVBsV0dObzlkci9xbHRvU1NNQ2V3YXlLWk9DTHdvZThQdFRWR2FZY1VtV2dU?=
 =?utf-8?B?QVN3OUliOU1Vek1mRXQ4Mjl1cHZ6ZWYxSEUweWdzd283OEdTaGxRaG81R1Fl?=
 =?utf-8?B?bEJ0emVnK0ZtazdMSFNHeTRSZDdpREM2emUrbWcya2VzT0RvUlNscVZsVkRq?=
 =?utf-8?B?VFFJUGNlYlByN1g5RFJlSXRMTkp2V0NXTXE0SHhvUXZmT0haYUErZ1RZMXdy?=
 =?utf-8?B?V3pjTHIvSDRSWEFLM09iS2ZEV2U3UkxUZGt6dVdBclZDdGt4Yk5ScmU2RkJN?=
 =?utf-8?B?YWZvcnJFVy82TThTL1BvNnVsakRLd1ZrZE0yb0dYWWFjd2w5a1NiU0crZmFu?=
 =?utf-8?B?SVNTNXVnT1ZwTEdTMHNiZWt6MjkwRFJ5ZDNCZk1RL1FzTXoyTFF6WjdQTEQ0?=
 =?utf-8?B?elNvVDNyWTdtWW1Ubnl3OHZxak1zanJydWF6MVUwNHJoMnhodFh4Y05OZDlL?=
 =?utf-8?B?Qk1pazV0VENqQVdqMlN1SmNIMFpOQ0VXOThMUzJVbWVvZk9zMFRSeG5IMm55?=
 =?utf-8?B?TDlaeWszOHQ1NWRFeGQ4dTROS1EyM3hTN0wva21ML2dUZ211eCsyQmJTYTlD?=
 =?utf-8?B?ZkZ0Z3pmRzBkanpKZU92VnFNNTAzQlltbko3aFhpbTVxL1RleHM2K2RaSFE3?=
 =?utf-8?B?ZXFucTBhc3Y2VXBJZldKYWR3cVE5ZkRWd0tnY0dmeXhBbHlnR29mcnRUM2Vu?=
 =?utf-8?B?dG1wZEtwSGxhSnhlTDA5VHdmSDFYYVlxTUMwS1p3OWZ4T3ZCRmg4MUxkU0Nw?=
 =?utf-8?B?LzhkRVVuZ2pyL1Mxak9UZ3VuYnFqTEhrRDBXUm1LbzBETmlKV3hqZjJCTFVx?=
 =?utf-8?B?VzNXdEh3VFNjMFZtTHJqRVNkV0JsU20rU2FtOU1SbmpGZ1NQY2ViV3c2R2lR?=
 =?utf-8?B?bjZyeEhSM1A4aUtBbUUzTm1pT1FsclF4Zzhaa0l6VnYrcUZ5VnkwVmMweG9G?=
 =?utf-8?B?cnJZZWJibVBPQWFtNE5MY1N1K0pEVU5SVkpjakw5bmNqRlJ5MXRYZWVNYnF5?=
 =?utf-8?B?bWhEYy8zR1BzTVFrU3pjRlpBYkxRMWZ2dE1kY2szTUxzZnpnY1gyNmphK2xQ?=
 =?utf-8?B?dTc4VUdwTngxOFRQejFJcjk5U1VWNHFxTjVnMWhrZWZncXAvVXRoTThxN1Nw?=
 =?utf-8?B?REtFOWcvSTZCZVNOMTlrRUc4OTFyRkRxZzlhcDlnZlB4dEI5cldJK1ZyYnJC?=
 =?utf-8?B?U2FsbHJVZDhWTEk3SnB5VzF5Z0NPU2U0OUgvaEJKZ2wrU0NTUlFZLzFBVXZR?=
 =?utf-8?B?QVN2eFVZZXROT2dnS3Y1YjlFY0ZzWDZrSUxlK003Q0ZxYUUrMkdKMjhEQzc3?=
 =?utf-8?B?ZlZLOE1HVDNNSjR2MkVPeVBlYWFleXAwUmZqSE1HL1VlNG9MQWk5cVRIMVB2?=
 =?utf-8?Q?HFAA1dl+RC6d/FPgMtqOCBYXsWxlI/fJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlBvK0FFa1RhTVVmSE5ON0l5UTF1MFRDSEl2ODBzd3FyYXB2RGNhcDg2eXp6?=
 =?utf-8?B?bHgxZWNxd3ltRHFNUzNITmZETjlpNzdHcG5qaCt4TkN2UXZma0Z3WktYUWZQ?=
 =?utf-8?B?c0dyNXc5Nk41c2xjeWVyNTNjL1ExT0ZLZFJtMDh2L2JHenR3dzZsU2lSSU04?=
 =?utf-8?B?dHhIWDdiQ3A4UkFzMW5CN09YSVlIb1hubHB5MllWN3NXYTVEOHdKMDBQUVNF?=
 =?utf-8?B?bWFDelhSMnF0TndtUmx5bVNwWHBQbUpwcllsOVhtZXIya3ZnMjRreCs2MUtT?=
 =?utf-8?B?MElaNVVyZjBMS1B0TnUrdkxibzFBWndHM1dOa2dFNlE4SmF4aW1vakxnNy8w?=
 =?utf-8?B?UG53WW1CTklnL25wSk05WTIzVGp6c0ZNTEtrUWl3TytOQ1lPdDlKZGFWeTJW?=
 =?utf-8?B?VFlvcm1NTDMrU2ZVWFdYdEg3VVIyQXVPM0pnTzFVNjFzRXNoQ0Y2RkZGUTFM?=
 =?utf-8?B?T0NtNm0yUzBRS3B5RUE2Vis3TjlmVDE1VEVHbTdxUW1Gd2k1Z05TRm1GOFRy?=
 =?utf-8?B?RkhaUFlVZzVlMTY4cHVQU2p3dkJOZGdpU0VVZkh6M3M2TWh0a0NQcDJ3RFZy?=
 =?utf-8?B?NkMxWTdidllrd1M0WWdGa1F1QUs2UkNQcmRZbnFwMmo0ekt4WXZQdkJQYU43?=
 =?utf-8?B?ejFaemh1WlBndnZ6SkFZR3ZkWFRqdk1UdWpaWTcvRHdRa2xOclpxaERsaFh4?=
 =?utf-8?B?NWRadnNUZWNhekdQUTFaOFJvZzZKSS9PQkkwc2JxNEs3YmE2MjFjbmMrSnJQ?=
 =?utf-8?B?VldBTXpmU0p3Tk4xaUlRN0FpRStUbkozY2Y4cmpVR0pyWUVWUUtCdmdMUG1q?=
 =?utf-8?B?WWhmNGFwTXZnSU5ndnd4TTZoaU1ZYUt2TXRtVGJQTDZrc1p6K2RoYnBRVXc1?=
 =?utf-8?B?QXhCT2w5Y1M5SFJEdVNab1VxbTJhTnBnaC9FRHlJZ0doY0dSVUtCbkZnd0tC?=
 =?utf-8?B?N1FZQzVQcVpkYSsxUGwxaDZBNmppcEV4ZjZhdW85QThHaFVvTXVMZTVyemJl?=
 =?utf-8?B?TnVzWS9GWjZ5bFIwLzZ1WnFQcEdDazIwWlEwZ0Vhd29UOEtmM3gyQmREd2dY?=
 =?utf-8?B?aTBGbFhucFVGS0NOMkQwZjhZbG9xMlJpR3AyaExCUXFDUFlHb3FvRFFIMSs1?=
 =?utf-8?B?Zm1pQlRjdnYrbnBDeWtQVXlLRGh2VEhmVGVoWmp4d3RNdVJnalVkZHRWa3lZ?=
 =?utf-8?B?Lzc3RCtLVWt4bEo5UmV2MzlvdmdVa0RCREhNUXVsR0NzU2ovZG9WWkorcUJF?=
 =?utf-8?B?YjE3eHZ2M0htNDZuUzZKQ3kvc2xCUWwzZG9zYjhPcXM1Zy80VGk1NmNtaEpK?=
 =?utf-8?B?a3M1cGhPSkJ3ejJQZUJKdHR2RnRldU5ML3lIMEM1L1ZWMjVqQW1Vc2dlcHBY?=
 =?utf-8?B?QkdSVDJ2SFJmLzBCcDIzTjVIbzVZM0tJTzFsd1dxWGlOcVpVcml0WGs3REJ5?=
 =?utf-8?B?b25vMTR6SERFVEJOdEhvQUNVSU1Gdi9lV0tobmU3SkxLVkJqb25EaDJ5V2x0?=
 =?utf-8?B?TVZPVUVaYmRocGhuVHliNmFhM0pCaHo0MFFRSUZQR3QrZjdsMnovd1RSKzE5?=
 =?utf-8?B?amdwZEZCT2VLU1ltSnhyR09qMUE5cTFMWUh4TTBPV2YydDFid2tGQnRBOHMv?=
 =?utf-8?B?N05abGJXMnF0QUFJV2VadGQyN3BsalNhcUJhQ3lKdGtPWlhVM1BGU3dPOWJs?=
 =?utf-8?B?S3hRNm4ycTluMFg5bW5hM1pUWjFheEtvWXc2NkEwQ3dmU3NLbEtXbHExLzBG?=
 =?utf-8?B?OWFIMXU0SjdpZy9maEFwOUFsZm5tMWVrTXQ4eEY4eVA5R3o5U0RPTkdpaG1J?=
 =?utf-8?B?YWVwUE80UVlnVzNxb2MrYk5lS1pBSC9qMzVUL1cxSHhlbnlkU0l4d0ZHc2d6?=
 =?utf-8?B?ZFVzNU5BUkZ6TjB6R0hmN3d1dGtiMzVFK2txYmJuZ1pHbDcxZEdENHZwRTRG?=
 =?utf-8?B?OElReHh2N1dlaEJOSjJkYUZlbHpnWDN3YldTa25LdktLMy95eDQrSHQwdnpi?=
 =?utf-8?B?NXJmdTByTHVzblhDSkQwT1ZUYVBWbk9pajhxT3l4cXgwM3MyZVM1UTBET0Uw?=
 =?utf-8?B?Z0w4MW9tVjVCMW13dlNLUE01eVFpWmx5QUI3cGtjK2FtVHRJUENraG9RSkNV?=
 =?utf-8?B?eVY4L25uU1lZVU9uZlJmOFY3NFNFL2NGVmdjZGYwSk5CZUFuUThpS2ttd0JI?=
 =?utf-8?B?S3BNQVlKbUFNMUN2Z1BMTEwwdHRIOHhYNzdnZWdkanZDREh5SnMrNmd1QUM4?=
 =?utf-8?B?Q0lGTjZpeElSM285OXhPZkszUklnZFlHTjZkZ2dhRzlNMDZETC9NSUxXVEpJ?=
 =?utf-8?B?ZHd4dkdaT0lSclIxSDZKUFRQcnNML3E4R0phVENMQnhmSnJKT0R6eHUwemhJ?=
 =?utf-8?Q?NeOr+nwZHNREZ1w4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf34f0c8-6826-4e03-8fd0-08de426653ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 21:00:39.9055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ovOYgIZ3Zlbhe/w/VM901dLSvsWF43udTdSa//7wqhQ902SNqEXng02a+rJmv4EyiL+WgmZsC/4GWxOmV8D/4ESCxr1i10D/Ex+4Qfdax4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7804
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

On Fri, Dec 19, 2025 at 11:46:13PM +0000, Xin Wang wrote:
> Add xe_get_pat_sw_config() to parse the Xe PAT software configuration
> from debugfs (gt0/pat_sw_config). This is intended for test-only use
> to validate the kernel-exposed PAT layout against IGT's predefined
> UC/WT/WB/UC_COMP mapping.
> 
> The intel_get_pat_idx_*() helpers continue to use a predefined per-devid
> mapping, keeping them usable from unprivileged users. This avoids
> introducing a debugfs dependency in the common library path while still
> allowing tests to detect PAT table drift as new platforms are added.
> 
> V2: (Kamil)
> - Show a detailed skip info when opening the debugfs file fails.
> V3:
> - Save the Xe PAT software configuration into the xe_dev structure
>   to prevent scenarios where certain test cases drop root privileges
>   after execution begins, which could block access to debugfs.
> V4:
> - Cache the parsed PAT table the first time we read pat_sw_config
>   and reuse it for subsequent calls. This avoids repeated debugfs
>   opens (and failures) in tests that drop root between steps, while
>   still returning the correct PAT layout.
> V5:
> - Make PAT debugfs parsing lazy: avoid requiring debugfs from
>   xe_device_get(), so tests that don't need PAT won't be skipped.
> - If PAT info isn't available at device init, keep pat_sw_config empty
>   and only require debugfs when PAT indices are requested.
> - Add xe_get_pat_entries() helper to expose the parsed PAT entry table.
> V6:
> - code optimization
> V7:
> - Keep intel_get_pat_*() usable for unprivileged users by switching back
> to the predefined per-devid UC/WT/WB/UC_COMP mapping (no debugfs required).
> - Stop reading pat_sw_config from the common device setup path: remove the
> PAT debugfs fetch from xe_device_get() (and drop the cached field in the
> xe device struct), avoiding a global debugfs dependency in lib code paths.
> - Treat PAT parsing as test-only plumbing: make xe_get_pat_sw_config()
> explicitly root-gated.
> 
> CC: Shuicheng Lin <shuicheng.lin@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: Matthew Auld <matthew.auld@intel.com>
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-----
>  lib/intel_pat.h | 20 +++++++++++
>  2 files changed, 108 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index e3588110a..fcab5e145 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -3,17 +3,97 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include "igt.h"
>  #include "intel_pat.h"
>  
> -#include "igt.h"
> +/**
> + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
> + * from debugfs
> + *
> + * @drm_fd: DRM device fd to use with igt_debugfs_open
> + * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
> + *
> + * Returns: The number of PAT entries successfully read on success, or a negative error
> + *          code on failure (-ENOENT if debugfs is missing, -errno otherwise)
> + */
> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
> +{
> +	char *line = NULL;
> +	size_t line_len = 0;
> +	ssize_t nread;
> +	int32_t parsed = 0;
> +	int dbgfs_fd;
> +	FILE *dbgfs_file = NULL;
> +
> +	igt_require_f(getgid() == 0, "Must be root to read PAT configuration\n");

igt_require causes a test to skip if the condition isn't met; that's
generally used for cases where we detect that a test just isn't relevant
to the platform/environment that it's being executed in.
But if the caller of this function has already dropped root by the time
it gets here, that's programmer-error, so "skip" probably isn't the
right behavior.  I'd either use an igt_assert here so that we explicitly
fail (rather than skip) in this case, or leave this line out entirely
(since the debugfs open below should fail and we'll return an error code
to the caller where it will presumably be handled properly).

> +
> +	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
> +	if (dbgfs_fd < 0)
> +		return -ENOENT;

Why not just return dbgfs_fd directly here?  Then it will be the actual
error code returned (ENOENT, EPERM, etc.).

> +	dbgfs_file = fdopen(dbgfs_fd, "r");
> +	if (!dbgfs_file) {
> +		close(dbgfs_fd);
> +		return -errno;
> +	}
>  
> -struct intel_pat_cache {
> -	uint8_t uc; /* UC + COH_NONE */
> -	uint8_t wt; /* WT + COH_NONE */
> -	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> -	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> -	uint8_t max_index;
> -};
> +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> +	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
> +		uint32_t value = 0;
> +		char *p = NULL;
> +
> +		/* Expect patterns like: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
> +		if (strncmp(line, "PAT[", 4) == 0) {
> +			bool is_reserved;
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1) {
> +				if (parsed < XE_PAT_MAX_ENTRIES) {
> +					is_reserved = strchr(line, '*') != NULL;
> +					xe_pat_cache->entries[parsed].pat = value;
> +					xe_pat_cache->entries[parsed].rsvd = is_reserved;
> +					xe_pat_cache->max_index = parsed;
> +					parsed++;
> +
> +					igt_debug("Parsed PAT entry %d: 0x%08x%s\n",
> +						  parsed - 1, value,
> +						  is_reserved ? " (reserved)" : "");
> +				} else {
> +					igt_warn("Too many PAT entries, line ignored: %s\n", line);
> +				}
> +			} else {
> +				igt_warn("Failed to parse PAT entry line: %s\n", line);
> +			}
> +		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1)
> +				xe_pat_cache->pat_mode = value;
> +		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1)
> +				xe_pat_cache->pat_ats = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->uc = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->wt = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->wb = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE_COMPRESSION]", 28) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->uc_comp = value;
> +		}
> +	}

I wonder if any of this string parsing could be simplified using regular
expressions (i.e., regex.h)?  Maybe we can look at that as a follow-up
(and maybe create an IGT helper that can be used elsewhere in the code
base as well if it makes sense).


Matt

> +
> +	free(line);
> +	fclose(dbgfs_file);
> +
> +	return parsed;
> +}
>  
>  static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  {
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index eb48cbc65..e9ade2e2e 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -6,9 +6,27 @@
>  #ifndef INTEL_PAT_H
>  #define INTEL_PAT_H
>  
> +#include <stdbool.h>
>  #include <stdint.h>
>  
>  #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
> +#define XE_PAT_MAX_ENTRIES 32
> +
> +struct xe_pat_entry {
> +	uint32_t pat;
> +	bool rsvd;
> +};
> +
> +struct intel_pat_cache {
> +	uint8_t uc; /* UC + COH_NONE */
> +	uint8_t wt; /* WT + COH_NONE */
> +	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> +	uint8_t max_index;
> +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> +	uint32_t pat_mode;
> +	uint32_t pat_ats;
> +};
>  
>  uint8_t intel_get_max_pat_index(int fd);
>  
> @@ -18,4 +36,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
>  
>  uint8_t intel_get_pat_idx_uc_comp(int fd);
>  
> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
> +
>  #endif /* INTEL_PAT_H */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
