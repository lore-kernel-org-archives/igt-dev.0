Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAE1CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6E410E5C1;
	Tue, 28 Oct 2025 08:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsfgR6Vl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431DA10E5C1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761641945; x=1793177945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8kyUpUz7/YxEhy1L0yWLl3PyZeHNm9/fZE2QWV2E9tg=;
 b=BsfgR6VlYNx8qkuwSnN/AQVL1E3wD1AVyv/YAyAJO9ZuNmrwh1npJ2qm
 nDVE8dtkliWhUJzVaAMnflDo//Wsjcp5wB3AG7dQAHqmAhoj22aHlthmI
 DwdeQ5hrM5MTPc/dNTKzp6F9Gsue1C6GjyU0SoGM/rqmoan/i13e0DxGC
 WO60abzE+d3qpLuIcK/QQalDi0qVxIQtRv1He2VW8wbtJSJuov5lWLxj1
 YfRrVgVqlQOifz46LPntAaah8gF6aMHFJnboPxaESRWngxRcF6bYNPM04
 oIGbSB8wsNmODEB0rKfNw6f0WYdZiino/G//LYYbAMxB1dlJr9nYeI8NG Q==;
X-CSE-ConnectionGUID: U2Yrdml5RmCvzJZ+UnvNnw==
X-CSE-MsgGUID: QgUJgnRnQxCunZVivaXGpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63438266"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63438266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:59:04 -0700
X-CSE-ConnectionGUID: xvGn4D3cTE2pPcwUARyKMg==
X-CSE-MsgGUID: YDFDv6k4SX2d2zrzgMugwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184988549"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:59:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:59:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:59:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:59:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mT3b0Nu06c8PQE+6UegwEpn22CgLY29lPr2mvgFJ7//b54Xbaw86ivwSlr/9XBchDe4iXqLF9cS14LBZcNwNcC6A5SnkC6scXBFpx5//ANfBC8E41Q+xMp/dgsgtjhug9oLQwQQaPzWiZlFuGxlORt+mRerJpMYE+REEVj5DsH+CwJKYo30v3H01IniBIaBDup85PSKouapAC/wRbq20qO8dAiY44bp1dDiSk5pWklW6ptKn8zTt4NNDYVxfmnf8pkEUfQ1Rk5Lo5NxAY6Y49UILNPs7HROjQEaSFL7vrPFK+Eva8deejtbpW0Jg+l5X8Yls+8dWWy5MYsZcZOHVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0rv/C91yLNqkxJNjCjXTs6rcRNpbLjptoJazYOGSi0=;
 b=cDjPVz/39Fy2UIGleJbXWZLfL+57SYR3F+XUxeCCVzP9+BLwzSqLHRml9Gp/yG5D8oc3g7mywvs4qMXabr/KmFZsnhvSRLU0yvvWfynGhjVWZM1DBRN08TSODyezzAvPin3AGIHvqUaUa/wUYZoGvYE6d4qGiQa57UGrUMes8/RJctS/tIO3wGeWk74yaCbI6NO+1c7PJJzZbzpcYsXcYdJhd8bulXG23xmOPumTKSTkI8uopcdOxqRFIxfS7knp25a7wfR5tDMEEsCDZ+9/YF9KOdOouoI7Df9x2Si+Ddnq/urlpdod3lDXpYTbhV/tkWJzN/UW8EFSL3ho6ea+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB8552.namprd11.prod.outlook.com (2603:10b6:510:2fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 08:59:00 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 08:59:00 +0000
Date: Tue, 28 Oct 2025 08:58:50 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <zbigniew.kempczynski@intel.com>, <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t] RFC: tools/gputop: Add GPU frequencies to the
 client headers
Message-ID: <zdvlybgrzi3beoy2shqg37t3basozuttp7gdmu5bmwxmt6ngq3@l7kxcnvnltn7>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251027164354.3546543-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251027164354.3546543-1-s.sebinraj@intel.com>
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: a340bfaf-6da3-415a-ae07-08de16003c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wlpua3lIWEVPZHUwbUdVMjBEY2k5M1NqYzdvVitUTzd3NTAwSVBRZXlFL1Qw?=
 =?utf-8?B?dVBVejQyQWZEbU5HM0orck1sZjJuTHo2Mm1iOWMzdjAvRGlPdEhHbXVOMEM0?=
 =?utf-8?B?czF3NFM0U2Q1anVmS1A4NzVtZWRCWktGOVpNRFNIcHMwSlY4NHJXNWZLcVMw?=
 =?utf-8?B?SkNodEhDUHJmOUJveGNWYkZQcVVyVHl6dy9hM1F3WTJZeTVDVmVHek9WcVhP?=
 =?utf-8?B?TVlvOURYZDgzUE9mS2pWZFVJK3JVcnFMNFpnSEtMQ3hjN1lMVStpUUFqMFdM?=
 =?utf-8?B?YkpQcjNLYmxKNU9tR3BCclJta1ZsanN1YTdGakVPU2N4eTdNZ2JJU2M0bEgv?=
 =?utf-8?B?VmFhZktJQWlOWUswSWlCMUpGSkxFNVpxdFNLTDIxbSt1TnE5cE4yUG04eFRs?=
 =?utf-8?B?NUlMVmpTSWNvK2xWRHlhdzRmKzNobzJXa1oyd1IxU0ZXZ3JzOXRxRjlvVENM?=
 =?utf-8?B?UEhyODJEdVhpK0FYeldjc2Fwb3RDdVk2MHFFKzVocDl4QmxVRjh4MDJWckdy?=
 =?utf-8?B?a0E0SktZemRiZDlzS3l6TitFNkJiSFEydnJyMmo3MDNNdEJQMlpQaVhnVHNo?=
 =?utf-8?B?dTRsbEVlOGVTT2JYMFV5U3A3aVB4UWFnblNvZEtsSStGaUc5eGtCT0UySXMw?=
 =?utf-8?B?RXFockFqbk8xYmFsTDdiSmZWYUJ4UnQwRDBmMENsNW1lZTZlTXU1VW9Qd3pU?=
 =?utf-8?B?YjZ6T2pqeWxQZ3hqTExoVmprMmZIZUh4a1pPRzJYUzZpaUViYjBLRHNOMTJR?=
 =?utf-8?B?SnVUcjFvSFJrVmVDLzVwb0FPTHlaOEMxMCtkbGQ3ZDVhWEF6bDRoM0pNWEFL?=
 =?utf-8?B?OG1iNnpZRW80Z3JTWTJqV3BsSTVZdG5janJkTVBrWVpCZmdrVExMdjBWZnh1?=
 =?utf-8?B?eE1lWE54eDVvL1orYS9HL0JPdXU0WGVDUFRPSTVJMndjVkkrVlhSanBJV2Fz?=
 =?utf-8?B?OEZ3cEhtcFRLbkdFc0pCZ0pzRkVVN0phTC9DdlB2dnVFTFRkeFh4cEM1bGVi?=
 =?utf-8?B?dHA0RVRubFluMlk4Y3JjZmhwODlOQk1YQnhXeXdyd1NKQjZ0alYwNHh2ZXhr?=
 =?utf-8?B?RGhweDhiSTlzOGpjVU9YUXNWVXZsYW5CQ2lGSW1yRGs0aDMweG1kcXdja3M1?=
 =?utf-8?B?b2xoVlN3MDZkTFJXWFJ2Nkc2dGp2V3JDRndQTndXdHZpNlNFVUVkTlFiMUNo?=
 =?utf-8?B?a2FWdm16a3dGQTdIdFlWa1R4eW9PVzBJOGxTY3RlWVVSOVVkbnloQnVlSkVJ?=
 =?utf-8?B?ZTFwWk93Q0U0ZERuZiszTVhZeTZsWENkY3ZCazVteVdrLzdRd0l4Tkx0dlVD?=
 =?utf-8?B?NzQ2c2NUVFdQZit1Y1BkV2k5eUJsTjVramE4TlZTOUM2N2Z0ejViSjJSc1Rr?=
 =?utf-8?B?TnJ6OUQ5dW9rNnpCY3FtUTMzRGpkY2ZkR21jSDdNN04rbnRFUGZaVUlDbjEx?=
 =?utf-8?B?RVdHN0ZieG85c1B3eGlJa2FKcUhvcXJUSVUwV3JMUHhtTHFpT1ZwKzc3cUJU?=
 =?utf-8?B?dWZyZnN6Smt5Tm04OWVoc09rRVYyQW4ydW81V2RWVzl5Y013UXBnY3kycDQ2?=
 =?utf-8?B?eHFGWE1DdjVLRFV1Y0RxSnp1TVpScW1acFRzTWVuUkFtZTAySjNiNFNUd0NB?=
 =?utf-8?B?bm0xenVXL3MyT3MxdjVGblRXbTI1V2g0WlNYeHNNOUJJazhpYXVLSXhuOXJh?=
 =?utf-8?B?WXJ4dk5nM0pHVHBUMTBVUlliYzBqMENSSTNGSnBnc01tRXBiVktBbS9jS0FM?=
 =?utf-8?B?SS90cXVPOSsxcGpIa3hJc2RQVldnby9UeUQwVFBRQmhmSHRIdGtaQzRTVlMz?=
 =?utf-8?B?MWtGR0tFdVRqVGs0Y0VjaW1qcnVUZDJPQ0ZzbVhXSWM3UHczSGdRL3lvaTFj?=
 =?utf-8?B?eVNjaDRLck9BYVBLOG9pZjY2MmhjOEVQT1FzZ2ZyNXp5NWJUUndJby96bTR6?=
 =?utf-8?Q?TEzdJwnAoRjquJd2ZmzL4po6vIs/DTCa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0ZxK1FaWjN1Z3hBMVJvSnB0d21NM1RqcHNNRG5Gb2wralRpSmdMeE83b21Y?=
 =?utf-8?B?Zkl5dWtuWWN2S2drckh2dUNTcW52clJoMEYwYklDU01KYXJLQ1NMdTVoZTJt?=
 =?utf-8?B?SmJCV0ZvSms3TEVJdi9Cdks0enVuT2RsRDQwK3djTEZJSDR0S2htYWZseEV2?=
 =?utf-8?B?RE42S21YaXRkNjU2STlBVnNnaHU4RlBlTkJDQ2dXT2NES3diMExNUFZVOFZZ?=
 =?utf-8?B?aWZIc2NBSXY1UEN0THpNV1l4Y1hZY2FMNlVxLzNMQVFEWjVHV0hJS2VsNnRU?=
 =?utf-8?B?Mng5d3NUcSs4WnAydVZIY01yL2Y5ZWsrMEdmcUV6T3lKVnBvb2FBalNhaUZW?=
 =?utf-8?B?TldtR1NOMWN5a2pmUTdLd0UrK0FMNm52a1ZLUkJ3QkZLYlJHcWhxQzIvUEhu?=
 =?utf-8?B?bVl1N2FIWlU0UUdOM2QycUZVNXNoZ09GTVFDYVV1cnRBREUyVnhKb0RTbEE2?=
 =?utf-8?B?SGhGZ3RiZTU1UU4xTUJsS1QrVUtOcS8rTGxBSllObkJFNWQ4bW9lOER0VWZ1?=
 =?utf-8?B?R28zZHpvUUxBeWhhMkpmYmhXZU5HTmF1QzJaRGtOVWZxL202OVJ2ZE5DcjZj?=
 =?utf-8?B?Y1NwdlUzVUp6cEdlaUM2SE5nbjRCYzBoRlpnTHM2N2NtTXE5c1hTWU5Tc0ZN?=
 =?utf-8?B?RjBaS3RwTEJQK2IxMzF3aVZxTjg0V29NVlZzMlBvYXRPTjVsa2phTHFOeWlr?=
 =?utf-8?B?aGl2L1ladE5qOXhKcDQ2dVRjMml1NWlVbFJjYUszaVpqNTJOaTJHSHF0WDl2?=
 =?utf-8?B?NDRybUdKbmFMdW15aFlGWmJWY1NyQ3pkNXBPdHdjQjdSZ1QxRWMydjJqcWY5?=
 =?utf-8?B?VWZ0VXZoUGdnV3lmZEQ3MU5mcFEwaVBYTnN4MDBIQU1qRmRYYnhCeTdML3R1?=
 =?utf-8?B?YW1KTmlZWjVxTXp2aVI2RDNEZUUrcGRZS05UajZDWlBMMmlvSDA5Z1N4Ym9q?=
 =?utf-8?B?alMxS241aXppVFdLSFhObGhBc3ZaRlZuZmNsYnVPblJNSklCQzVNZHo3Sjdl?=
 =?utf-8?B?c0FuNkVSQ0lFdDNKdW9QTFNkNUd1RUg3dzMwdGx3amo5R21oUyttanhESEVQ?=
 =?utf-8?B?S2I3dEx3VkNWb1Z5RXYydUJZRHZCL283ZkphMDE2QkY4QkZsUUdaZFhKN3Nu?=
 =?utf-8?B?M0xUVFMwK01jcXlZTXBJZXIwWFVWN2FHNytCT3BZOUQ5SlF5cjJDaldIQUZJ?=
 =?utf-8?B?ODF5ZEhVeTM0U0c5NDREK2F1Ny9hSDRUa2FIbmNneW9oUlBCS2wwL1RUSWhN?=
 =?utf-8?B?WStTOGtSODZYdkg3ME44d01EWENFS2l2MEpiaWhoU0RrVy9mWkhnaXZOcStq?=
 =?utf-8?B?VVE5VlQvS2xmL04xak1lc1BoTzVkNGpjWlRpNm9xQm1FbElzRWtlVGZidTZD?=
 =?utf-8?B?bUx0VW9MY3VTKzBFVDJOOHJsOUFGM1FHdmcxT0tFSktxK3JaL2F6KzlKZmty?=
 =?utf-8?B?ZmpEaGt6V1ZjeVczZFlwVjI2czl6OXErWG9aM3RaTTJsTWtOTXJsQmgzY2pP?=
 =?utf-8?B?RnR2S3JiMGhzWVE0Z1NrVjRyZXg3a3R2dUpqK3U4bFNITmROd2RUZ09mNlQ4?=
 =?utf-8?B?eGd5UW5tMUJ1MmdkU2ZJNVdqbEJ3Qjl0Q3N2ajJDTDRZbWdpOVZWUVZGaGg5?=
 =?utf-8?B?MDNHNWRTRmpqREJmcVBibGdtcDJEY3pjejBpMmt0S0JKUkRzajlTMzBmWjR4?=
 =?utf-8?B?RVFIL3BWYld0OGRmOUlMZVQzamRac016OFVwYWtlVGVWZDdtOXAzbHZ3Sk43?=
 =?utf-8?B?dzFLbmtTa3A2QUh5azJwczBMTDJvSUZZUWVUYUhVUkhmNU9pa1dhRXFaWGUr?=
 =?utf-8?B?Tk9tYklwZ2pCRXI5Nmc1Tnk3dllDdnVDSDRxY3loeDVsLzFvbkZvaSt3SXJr?=
 =?utf-8?B?QmRSWGtWU29BTDV6QkdjR0VjZDNYazBNQkpyS1R6cFNPUWdJMkRuRjF1S3BU?=
 =?utf-8?B?VHhTTklJcC9ZYTNnNk5rYVdkbkVMdUx6RVdweEdaZFFMZGt1bWcvbEl3S01G?=
 =?utf-8?B?WWdqYTA2UUR0dFFaMGtBZFFYVVBFN25XdUljTCtSVTc0MUgydmtqZkQvR2Jm?=
 =?utf-8?B?VVdrbmlaMWNwaXJCNitaZHVsL0RhMGhUbld1OE1RZWozT1JaNlhXd3N2UjNT?=
 =?utf-8?B?eTJabktuT1BwKzBEUGdMdG9wOGVNNlRmeVVYUURrMU9hdFNhdWVvdk1BT3Rl?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a340bfaf-6da3-415a-ae07-08de16003c72
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:59:00.4413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OTayGyWKIg857OB5oVPJ+0eMBWl5nnzGZ8Uru8s1o5yt1pTKAy6SUaPiYWkJ+j+CpbFQcBGfTWoa4fd7Pi4kppNZ9EqQR5WnKzI5HsC3/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8552
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

Hi,

> Enhance gputop to display GPU frequency information (current/actual)
> for each GT in the client header line alongside the DRM minor number.
> 
> Key changes:
> - Add get_gt_frequencies() function to read GT frequency values
> - Support both i915 and Xe drivers using appropriate sysfs paths
> - Display format: "DRM minor X  Freq(cur/act) GT0-freq/freq GT1-freq/freq"
> - Use IGT API functions (xe_sysfs_gt_path, igt_sysfs_gt_path) for
>   driver-agnostic sysfs access
> 
> The frequency information helps users monitor GPU performance states
> in real-time while observing client workload utilization.
> 
> Example output:
>   DRM minor 0          Freq(cur/act) GT0-1800/1800 GT1-400/400
>   DRM minor 128        Freq(cur/act) GT0-400/400 GT1-400/400
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tools/gputop.c    | 112 +++++++++++++++++++++++++++++++++++++++++++++-
>  tools/meson.build |   2 +-
>  2 files changed, 112 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index f577a1750..23df3b367 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -30,7 +30,9 @@
>  #include "igt_drm_clients.h"
>  #include "igt_drm_fdinfo.h"
>  #include "igt_profiling.h"
> +#include "igt_sysfs.h"
>  #include "drmtest.h"
> +#include "xe/xe_gt.h"
>  
>  enum utilization_type {
>  	UTILIZATION_TYPE_ENGINE_TIME,
> @@ -76,17 +78,125 @@ static void print_percentage_bar(double percent, int max_len)
>  	putchar('|');
>  }
>  
> +static char *get_gt_frequencies(void)
> +{
> +	char freq_str[512] = "";
> +	char gt_info[64];
> +	int fd = -1;
> +	int num_gts = 0;
> +	bool is_xe = false;
> +	int gt;
> +	bool first = true;
You could sort the variables' declarations by type here and
below as well.

> +
> +	fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
> +	if (fd < 0) {
> +		fprintf(stderr, "Failed to open DRM device\n");
> +		return NULL;
> +	}
> +
> +	/* Detect driver type and get GT count */
> +	is_xe = is_xe_device(fd);
> +	if (is_xe)
> +		num_gts = xe_number_gt(fd);
> +	else
> +		num_gts = igt_sysfs_get_num_gt(fd);
> +
> +	if (num_gts <= 0) {
> +		fprintf(stderr, "Failed to get GT count\n");
> +		close(fd);
> +		return NULL;
> +	}
> +
> +	/* Read frequencies for each GT */
> +	for (gt = 0; gt < num_gts; gt++) {
> +		char gt_path[96];
> +		char freq_path[128];
> +		char *path_ptr;
> +		FILE *fp;
> +		unsigned int cur_freq = 0, act_freq = 0;
> +		char freq_buf[32];
> +
> +		/* Get GT-specific sysfs path */
> +		if (is_xe)
> +			path_ptr = xe_sysfs_gt_path(fd, gt, gt_path, sizeof(gt_path));
> +		else
> +			path_ptr = igt_sysfs_gt_path(fd, gt, gt_path, sizeof(gt_path));
> +
> +		if (!path_ptr) {
> +			fprintf(stderr, "Failed to get sysfs path for GT%d\n", gt);
> +			continue;
> +		}
> +
> +		/* Read current/requested frequency */
> +		if (is_xe)
> +			snprintf(freq_path, sizeof(freq_path), "%s/freq0/cur_freq", gt_path);
These paths could be declared as #define I915/XE_FREQ_SUFFIX or something similar.
That way we do not need to search for them between the code lines in the future.

> +		else
> +			snprintf(freq_path, sizeof(freq_path), "%s/rps_cur_freq_mhz", gt_path);
> +
> +		fp = fopen(freq_path, "r");
> +		if (fp) {
> +			if (fgets(freq_buf, sizeof(freq_buf), fp))
> +				cur_freq = atoi(freq_buf);
> +			fclose(fp);
> +		} else {
> +			fprintf(stderr, "Failed to open %s\n", freq_path);
I think failures could skip this iteration of the loop, unless
you are adamant on writing empty strings.
You could also write ERR or N/A to the cur_freq/act_freq as
direct notification to the user that something went wrong.

-- 
Best Regards,
Krzysztof
