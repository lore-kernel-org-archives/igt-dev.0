Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F267D3568D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 08:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F4C10E624;
	Wed, 28 Jan 2026 08:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnaAA32P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DADE10E624
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 08:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769587790; x=1801123790;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jTuYphLpCMqxAy8UWiTiOdF4EEzU/TmGswbq1OEXWlM=;
 b=bnaAA32PDPX8KJHnva++oa/ebh4ZqUBkFRRir8ziHMI91VdgjwGAVvRV
 iKYoYCvFI+Mok52b/uv3jR4CrLWZOcx3/jJuBJP6vLva8g8sQ+U4cTICG
 wntFYDK9Iw3Mx3Pd/fs4bmrMzqNEODgR/Ascu6PhSRjeJGvypKOcSeAE7
 gN//QmaMG9zjyZawJ6aNzCE+A8b1KA0+DP7/EvbeBfWe5fOAreh7xeY4L
 3xMbuhwvbjmKrsT4B2ENXlcaEKT7soEH8Y4BxLF5rsB6MWJ0I1fVdhNjm
 rkw7qIwz51Wno6HH/CNe2zhKnLyQuVVMl6wlRy8JlpOJMEXo6eXFe/He0 Q==;
X-CSE-ConnectionGUID: e6pJL1g9Qs+a4qarvNzrUg==
X-CSE-MsgGUID: JecEwtB6R/ObQcKCWLWNjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81108233"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81108233"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:09:50 -0800
X-CSE-ConnectionGUID: sZJ6a+wlQau0D1NHRXGcFw==
X-CSE-MsgGUID: XyMs7nyPTFGcz5FVarHR0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207340323"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:09:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 00:09:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 00:09:49 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 00:09:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWVA/f7dOX5xZ4x+jWe6cdOaCqSA1TNyHI+hsRwuJAAtgJelTsamABKbp/MzFd2mfd7ewnYlZDDZ/c45WcvXfopMs7q5LLi3FAsG/eX2RRFns9dKQDkHZtUZBNFSBx9HiOQLhzDqNvI9yZ2P9ctDbc/ZqjmE5pwG7rJwoBZxGbNgq54hGcTsFuSS88vZdHCu5RMT8S9WBIeFvte2r5pxSWBgSJRTC5d+B2NtYGmIQ5f3xcCeHnWAbZXx2e22aJp0gsj4KG93+mLNV/SFcB8Jwn2A7dofFR6MAoDUeixi1riwt6OsHlTHGZe22Ha4RUuDz7RXU0tb7jDep89m/hxJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLx6bQZ55hMxQ8asoR1vrZl1W064fva8jBrLV84gyps=;
 b=Qw6Hy3cqRj8Ep/7KFUkb+omJDXILvB0gY5tOhXTTB5ndcUw6hArgwAmkb5DaaCJs+Er6QfFi4exV3C/50AkBibkArl75G1+F/NWsrMUzg4fSC3kgBfXLK5YyAB1+l3VuwAjjjOKC9uKOEI1mMadTWJV7Qcs04Si46MxpEHVFWhYIUHo98rata1WsTV1uT1s+oWUArZAHqjvS2dYMkVzEmKqDzlpYq4Cs7M+IXoCAqEH6Yd38HDK4sVETfnIEmbIwo+Y8w20XaUHMOBc2hbp6hYC9taGcY6dLb5Ff3rVC41DDkLpq3rTLhIagdK15NTi+cfbKaSLdWZ/Av4xt9ljNPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 08:09:41 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 08:09:41 +0000
Message-ID: <c7b304cf-4f8c-41dd-98eb-6532ced609f7@intel.com>
Date: Wed, 28 Jan 2026 09:09:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] lib/igt_kmod: Fix PCI bind/unbind for
 module/driver name mismatch
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.winiarski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Francois Dugast
 <francois.dugast@intel.com>
References: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
 <20260115131812.256678-5-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260115131812.256678-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::9) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA1PR11MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: c79959e9-22ab-4190-40cc-08de5e44969d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekU1WC9tUHYvQWVvejlYRmQxdmhWK1JhL0l4OFluaWpkUUtSRkl2cmhYcitT?=
 =?utf-8?B?UENiTzlEU1dGc2Y1ZjBjNWVsYXlpQWtJT3VvT2NwaXlMV3lqMGMvOWZUYVYr?=
 =?utf-8?B?dWt3RE5QYWMwejNTeG5qWGxJRDdTRmwvcWY5eStxNHdNUHNPTU5mRVJtcUUv?=
 =?utf-8?B?Ny92NEM0WjZ3aGVGalpRN3QzVi9vKzZYcWU3NG5kbVMyekl4cEU0OFE1RnJ2?=
 =?utf-8?B?MGZtaXBXemtGdGs0YWVGOTlyTE1rTkNjZldOZE1zZ2U2SmZXN1FMMzBEYlpL?=
 =?utf-8?B?cGJKc0syQlQxbTVMelRTSS9hdm9yR1M5RlhJcHJkZDU5Z2FML1d6dEhQQmZj?=
 =?utf-8?B?TW8xbXRzWUZ3TGh2eGllZTdDSThIbyt5cXVWak9ySmNjaXBxTXpUb0lGU2c4?=
 =?utf-8?B?c3NET2VMRWRHdVFFZ3JIYmRZTmdZbHJmdE1QT3F2S3N5WkVoU0hFSFZkNkd4?=
 =?utf-8?B?MzNLTXFlajA0TFFaV0syOEdqS1A4ZnJSdHltMSsxNTdLbktOTHpOcnJaNkpE?=
 =?utf-8?B?eDhlYjhYRVp1R1BCRUlVZVpwT0RDTU9IUzdtWXhMdk1GUW1Zd0YyVnp5bEZW?=
 =?utf-8?B?Nmx6d0RXLzN3WUNnWGgySDhzakhlU1g5Y1djbnhHT01EVk1aTW9MeHdVUGg2?=
 =?utf-8?B?Y2dpTDhtM05iY21qOXgxR0JQSGNPdjVlM0JpcFpETitnQlVqazBYUU1iZWJq?=
 =?utf-8?B?eFE3VXpSTEhkUEtwN0ZNeitMWjNLRjh6RnkwdFRDUi83YVFUdWVPcUcxeDBo?=
 =?utf-8?B?NjNNNGg0NG1OZkxTRkkwOHorMXNOUGRuSDU3aVdtU3pwSjM2VjRjZjJ3bkZU?=
 =?utf-8?B?ZDlFdnU2ejFhaHR5Y3k2SHJ5TXZYNFdQQ1k5aG5UeTlrUk5YZkZhUTJxaU1a?=
 =?utf-8?B?ZGU5YWNIQkFmejgzMTBGNTFwNnQ4SDNZRVRoZ1ZQb0xIQnVxK2NESWpTRXFI?=
 =?utf-8?B?YWZGWmh0bExxNFBmQnlXMm1xd2d5TGpwUjJJVmJ5SWZlb3ZVT3NHekFxaFRi?=
 =?utf-8?B?S29MY3hUdThUWExRWlN2ZGRSYlRVNE4vcHkwbm5YQ0pIaXN1WnZScXdibSsr?=
 =?utf-8?B?YjNzRkhacW9rb2tzWTU1M3hCT3FKWDZMVnFjNW5INzYwVUU1aVJOVGlUV0t0?=
 =?utf-8?B?MnlkYTgxRG9UeDJEL0NEY1dhU1BEeENLYUpGSnF2bGFHYi9Ha2czcjhDSjVr?=
 =?utf-8?B?OHdSU3oyTytpYXZ3NXJRa1I1UVE4d29wc1hBWS9DeW5OSUdKOFFWQWpvTERj?=
 =?utf-8?B?NmRTaGphdkRNSklnQnVxS3lJQ1kzeWhqWVNJU2tPeDd5WkFKaUtKNWFrVG1n?=
 =?utf-8?B?VTBaTXRtOURvckRVRFdtRjhPM3BMUzFDZHZJaUhCRUt5Mi80MDlvRHhTKzZW?=
 =?utf-8?B?OUE1UUNGSy8yVFhGQTQveG93bmdvRDUxQmNkbGdBRlJQeXhvaHlKMzlUVE5M?=
 =?utf-8?B?aGQ0YlBtZ0FqQThLYVYwcGxLc0ZKWjV6aXlucFpPczhMb2IzWnBkWFJvamIz?=
 =?utf-8?B?c25NL0ZmWlRzQWszYjJSa3JYdjdLcFBLWlB4QjJmQWZvYlZtbGs4NjZDeGNr?=
 =?utf-8?B?MHR6TDdKNlFwWklXcHVadTBvSFVVdzFSMm14SXMwUTV2RHR5L2hkY1FzOXQw?=
 =?utf-8?B?Y05VdGthZGk0UWlVaWtBcUJrTHZWN0YxOTJobzJGSXk0RGZQZVdmWnhzT2Rz?=
 =?utf-8?B?TDVGV0VLOU1ydzZkd1ZvWjBPT1ptUFBoYnRFVm1RcCtlQ3ZuWG5XbmZYbUhS?=
 =?utf-8?B?d0UyRTd4MDZKNnFNd1h6OW4vdStsNXpwc2pkaUJFM3o3VEZOd2c5RHc3c0Qy?=
 =?utf-8?B?MUl0VGR2dG1DeUFPaTFWbGk5aURrb1JNOE91M2duYWNCYU9pVDdETnp5S0dI?=
 =?utf-8?B?cU1jRkYwRFZjRTV3ZEdGVVY3ejdjS3BtWVBuRG41cElsU1dndHk2WVRraHVw?=
 =?utf-8?B?TDE1a2NOU3RwK1V0dDRsSWlaQkVHaDdlWXBuNm9LTVRERHFLN0h1T3VvN1NR?=
 =?utf-8?B?RG9vWFZCZGF0RElMM0NpK2JtQVBaNHZMWHpYdGdoWmdiWFlqUWdUTmJxdDZS?=
 =?utf-8?B?QThEekxXZGxzQmIxNVhqZUhXbEJFTFI4ay9lUXU3TTBZVVJQSXFrQWNtem9p?=
 =?utf-8?Q?vroI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWpFUE90Z2J4ZDNMTjlWU0RPaGtMRzNrT242ODZxOHA1UXZPa2laemtDRlBq?=
 =?utf-8?B?eGJMaUpKVDNVaTJ5cnZJZU5kNlRjL1FXTEZsV1dQdTZtZWVnTmt3TmV2Wkxw?=
 =?utf-8?B?YlRoUllTZzRnVDUyZjRYOGtQRUF2cTB2aVhPeWtTNVJXcXJIV0k4UWJNYXRm?=
 =?utf-8?B?b2F1UThGRCsraVdISVdhc1hUOTNCN0hpa254Vlg4d2ZCaWpHdWlXNldMYkpX?=
 =?utf-8?B?ZVBjMVNzM2VDR29NQjNybXk4aDlWdVVwSHdnZE00MzNqTWE3bGU0aHdITVNY?=
 =?utf-8?B?b2JuNGhVYVZFOE9IbzRzZjB2TG5LQksvZUdMekMyNGxvVG5IU3hmaFNhTFNW?=
 =?utf-8?B?eDcyWkQ0VldjSHY5YkVWQlV6N28vQUNXcWtqTVcyRDBLUHNBd0x3dFN0cXJv?=
 =?utf-8?B?V2RrcnZINkJNT3p1RzIzaHVTVTFzQ2c2ZXNIbERxMGx3SEJXKzZkb2Fxaito?=
 =?utf-8?B?bGRtb2Fnd29aTk5ScmdLT0R2Rm1ScU1wbjRVOGNjc1FtS29FMFYyb29sdWRm?=
 =?utf-8?B?akdFV0IzL0ZNYldmMFF4UVRSeEJHS2syR1hRMndSelRwS3VLMFdHakRiSnN3?=
 =?utf-8?B?Tkg2TGRoN04wL0t0QTM3cWJqY2VRNDg5SDF3M0hCYTUzbzVtemxZVVNlOXJP?=
 =?utf-8?B?cXF0V3FhL0RnNVJidisvYzlWQUhtQUcrQnRON1dicE9ZZllBbFkxaUJhOGkw?=
 =?utf-8?B?WFVXUUlLWDkxZ2lWejQwRGM5NzJjV2FoTmVFWnVxU0o0bzlOZW5NUXJaKzRF?=
 =?utf-8?B?MTlqUUFIZ2hHMHVQdzAwRnZDRHk2K1lsZXF1eHR5OEZBRG5DRW0yWit5RTVO?=
 =?utf-8?B?WE8rbDQxeW5JZm1xVnF4dkVpYktCWndNTFg0cXd5OXF3V1lUaXJnSEhKbkxX?=
 =?utf-8?B?WkJocWZvVCtTVitxYll6Z3JZUmY3K2VtcjcvZG1IbW5uZGpmYU55cjg5bEpS?=
 =?utf-8?B?aklRSWs0VklLWDlFWnVXb1pUSmJ1Q2YwaEk0dEIvOEhzcnIzSkxqUk43aVp4?=
 =?utf-8?B?aGhMbmsrSDVzMXFXanM0VzFNNmRjS0QyZnVlZ1o5ZnNUcDdvRXFpcENGcHRT?=
 =?utf-8?B?WkQyVGFad0d2VXdDNFdVSzJvSk9PcWtHOTFqU2pUOWt2MWNPYUU3dGVOTVNt?=
 =?utf-8?B?WkZJWVFYc1dzeWtka2F4UCtEMzZQZnIxWm1CVmsvWGdoTE96eVpjTHFTN1Zn?=
 =?utf-8?B?OEtrQktNbUF0RTVwWnE5aDRCNUpiK0ZLSUlZbXpKUVVHZncwdG95MU1hZWlH?=
 =?utf-8?B?ZXlzUVJSc2xkYmd2OWxFRDFJV1M3cWpSVEt6OVpQakIvUU8xQnB0aU9DUlZx?=
 =?utf-8?B?RUZ2WFJaMGsyeGRuNmNqL3dYeWNreTRzeGlyOEh6UVMrSGVQRUNtQ1R3NUYz?=
 =?utf-8?B?V2ROejVCZUYvcDBDYUV1cDlrNFBxZnhsU3pCWGY5Z3hNSjNKNWpQeExWRHkw?=
 =?utf-8?B?YUFWUC9NUmFERGtmdDFRTW03K3BBN3VmOXMwNTE1NWxNcDdWQ0FhSTV6UjdE?=
 =?utf-8?B?L2IrbDgwbDVYL2loeWdqSU9pK3ZEUWZuMkpTYjRXeWNlOU5kNVdicElYYm5N?=
 =?utf-8?B?V0pBM2RBdkZoVHphR1FFdHUyNlNSMENQbEtWMFA5VmpwUXRXNHN2OFE4VUFh?=
 =?utf-8?B?ZDBKYVVpYWJYeHBJYW1CWTJoNzhjZTRYNE9DRkxsV2hiM0pTNkFCWk9uVnlv?=
 =?utf-8?B?am1CU1hJdExIV3E1d05pN2x3eUhoYVNGZEJtWU5QRU9kZHNWVGdsT2JaNnZz?=
 =?utf-8?B?NDFSc2FnR2ZqaHkrZ0FEcm1OaDZlcVZ0ZU9nS0huZFJyVGx5QXNacmVsdWNn?=
 =?utf-8?B?WStDcTNtU0U5T2JvZVJGMWFnbktsRG5WblZEeU5GaENiOW9KTWVIbURReUhT?=
 =?utf-8?B?RVNMOTQ2U3JXa0dBQ2pEOHk5cG8rRmdWSHVMNHkxRFZ4eWNGd2hPK1EyakdU?=
 =?utf-8?B?a1dOR0VHVWFGQk9peHdLMXRZYmp1MGY2OXA4Zk84YWNMQ3l6aFZ6UmdhRXQ5?=
 =?utf-8?B?TzhUaFdCNi9Rdm91amg2cUx2alNSekNDRUNSL2RKUUtxSUh2anhwMmlVUWZK?=
 =?utf-8?B?ZnNiamhJKzlQTi9tMHJOTFI2V3ZOTnZEdFJPMUhtVXcrc1hYWTlZSGpnbFBE?=
 =?utf-8?B?QkZIbm16Qlc2cWhERk1QNjhwR1M5OXhycUxJRXdIN0FLMjU0WVAzZGc3MnBo?=
 =?utf-8?B?OW4vNy9pV3FKcjhZQjRUaG90MFhWSEZCNTZWT3dFTjBxcVRjNmlUT2VWelg3?=
 =?utf-8?B?VVZkRytvQXRNbDFZQnpaZGpzcHpFanZManZQSDlVRkYrZkZPa05VQUFFdUdB?=
 =?utf-8?B?QTVXYkxYMUI2SUowNHB4N292WWJERERMTTIzTXZMalpLcHBwSmczZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c79959e9-22ab-4190-40cc-08de5e44969d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:09:41.3723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMuNfXPaGVAlCMm4RYJxWgxNG6WdIr4q57ZNtTJNwl63TG9RQZsuUhwytHBmlAcj8Y1jKY9OoL1feRdFutAwIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7343
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


On 1/15/2026 14:18, Marcin Bernatowicz wrote:
> igt_kmod_bind() and igt_kmod_unbind() assumed that the PCI
> driver name was identical to the module name, which is not true
> for drivers such as xe_vfio_pci (module) vs xe-vfio-pci (driver).
>
> Resolve the registered PCI driver name via
> /sys/module/<module>/drivers/pci:* and forward bind/unbind operations
> to the generic PCI driver helpers.
>
> Mark these helpers as deprecated, as bind/unbind are fundamentally
> driver-level operations. New code should prefer the igt_pci_driver_*
> APIs, while these wrappers remain for backwards compatibility and
> “unbind before module unload” workflows.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>   lib/igt_kmod.c | 90 ++++++++++++++++++++++++++++----------------------
>   1 file changed, 51 insertions(+), 39 deletions(-)
>
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index d1d7a3840..008752f29 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -44,6 +44,7 @@
>   #include "igt_hook.h"
>   #include "igt_kmod.h"
>   #include "igt_ktap.h"
> +#include "igt_pci.h"
>   #include "igt_sysfs.h"
>   #include "igt_taints.h"
>   
> @@ -598,43 +599,58 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>   	return 0;
>   }
>   
> +static char *kmod_pci_driver_from_module_alloc(const char *mod_name)
> +{
> +	char dirpath[PATH_MAX];
> +	struct dirent *de;
> +	DIR *d;
> +
> +	snprintf(dirpath, sizeof(dirpath), "/sys/module/%s/drivers", mod_name);
> +	d = opendir(dirpath);
> +	if (!d)
> +		return NULL;
> +
> +	while ((de = readdir(d))) {
> +		if (!strncmp(de->d_name, "pci:", 4)) {
> +			char *drv = strdup(de->d_name + 4);
> +
> +			closedir(d);
> +			return drv;
> +		}
> +	}
> +
> +	closedir(d);
> +	return NULL;
> +}
> +
>   /**
>    * igt_kmod_unbind: Unbind driver from devices. Currently supports only PCI bus
>    * @mod_name: name of the module to unbind
>    * @pci_device: if provided, unbind only this device, otherwise unbind all devices
> + *
> + * Deprecated: bind/unbind is a driver operation. Prefer using:
> + *   - igt_pci_driver_unbind()/igt_pci_driver_unbind_all()
> + *   - igt_pci_device_unbind()
> + *
> + * This helper remains for backwards compatibility and for “unbind before
> + * module unload” workflows.
>    */
>   int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>   {
>   	struct igt_hook *igt_hook = NULL;
> -	char path[PATH_MAX];
> -	struct dirent *de;
> -	int dirlen;
> -	DIR *dir;
> -
> -	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
> -			  mod_name, mod_name);
> -	igt_assert(dirlen < sizeof(path));
> -
> -	dir = opendir(path);
> -
> -	/* Module not loaded, nothing to unbind */
> -	if (!dir)
> -		return 0;
> -
> -	while ((de = readdir(dir))) {
> -		bool ret;
> -
> -		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
> -			continue;
> +	char *driver;
> +	int ret;
>   
> -		if (pci_device && strcmp(pci_device, de->d_name) != 0)
> -			continue;
> +	driver = kmod_pci_driver_from_module_alloc(mod_name);
> +	if (!driver)
> +		return 0; /* module not loaded / no pci driver */
>   
> -		ret = igt_sysfs_set(dirfd(dir), "unbind", de->d_name);
> -		igt_assert(ret);
> -	}
> +	if (pci_device)
> +		ret = igt_pci_driver_unbind(driver, pci_device);
> +	else
> +		ret = igt_pci_driver_unbind_all(driver);
>   
> -	closedir(dir);
> +	free(driver);
>   
>   	igt_hook = igt_core_get_igt_hook();
>   	igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
> @@ -642,7 +658,7 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>   		.target_name = mod_name,
>   	});
>   
> -	return 0;
> +	return ret;
>   }
>   
>   /**
> @@ -651,25 +667,21 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
>    * @pci_device: device to bind
>    *
>    * Module should already be loaded
> + *
> + * Deprecated: prefer igt_pci_driver_bind().
>    */
>   int igt_kmod_bind(const char *mod_name, const char *pci_device)
>   {
> -	char path[PATH_MAX];
> -	int dirlen, dirfd;
> +	char *driver;
>   	int ret;
>   
> -	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
> -			  mod_name, mod_name);
> -	igt_assert(dirlen < sizeof(path));
> -
> -	dirfd = open(path, O_RDONLY | O_CLOEXEC);
> -	if (dirfd < 0)
> -		return dirfd;
> -
> -	ret = igt_sysfs_set(dirfd, "bind", pci_device);
> +	driver = kmod_pci_driver_from_module_alloc(mod_name);
> +	if (!driver)
> +		return -ENOENT;
>   
> -	close(dirfd);
> +	ret = igt_pci_driver_bind(driver, pci_device);
>   
> +	free(driver);
>   	return ret;
>   }
>   

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

