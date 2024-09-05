Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D84CD5BC0
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 12:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202A010E891;
	Thu,  5 Sep 2024 12:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cvpvu/tP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F7110E891
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725540920; x=1757076920;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iDvCGEPkXUR8xeibNSkbrDO3CZtBymKKTKiZGyfOwnw=;
 b=Cvpvu/tPoRy+OR711sBkJ5Eg5+o+ojJgqumaSdfWg2CjTOSLOHZ5aM3d
 ob79c2woQGpII+D8xMHQD7OHve1XFUWuv9wuWgXJ8HNBIQtUdVurReAvp
 xH/8BAqFUgxRNai2axT8WDnpjJO3JywNxfo8lwvlkVnEouJuzh6EfDlWZ
 F0DQEvySG+BnbPpfD/s5Ay0ODw+pTVBUkj/xfk2hs0Qm7PY7zr1DjaqSq
 ZrVuzTCi0TLmBksvFZCGl3b3X2aRpDBTbGsyOgqzQD0c2gXoACQInnzyX
 WI1Yr6gcErskX4XK3lsqFyIv1Olmu/mUlUOCTSMbHVHiaKgw3WpIMagQp A==;
X-CSE-ConnectionGUID: 9Er/Wx6DQyuxjT4joc7tFw==
X-CSE-MsgGUID: BmhYav22Q9S6OuJAuquE5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="13386797"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="13386797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 05:55:20 -0700
X-CSE-ConnectionGUID: 9waHBKmBSv6xDmYANaCGag==
X-CSE-MsgGUID: a1bH4nqhR7qMEReMPn57SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65650691"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 05:55:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 05:55:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 05:55:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 05:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpY9wUEH8x04uVn8g/gNf3g4iDlxr/ZFSs7XQD2mt0+HorrX9ULEUiROu28ozITJ8wxspHZFA7r2yL8u/5ycIM3JsyvfuQzCYa+sirQwWl6YeBF1lV/2YX/p7+e0jlshCpQ2UGqLB/TZPFFFCstZ4MGdXtfZYmIRmJReuWj7+ZK/8jXNwDWQqom5DkL+2k1KeCnks/DSEjDzPhzwDMKOwVbk/dqhFJZeJ1c3Bj/eKEgScAI1vKvDH6T0tNARg+2sJUy+jkxO2J2571q0QEfA0btXN96JugFbUR1rhkUw0u5oYxQbU1aNoDTaJgZmZaCUCnXDL+xq1v/Bs7X+pPheNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T9eAgs6lvyoXcGwQnZ31K06q0LOH4toguRhurI11HY=;
 b=EpPlMU6rZtlJaIHuAnvN1Iy9dTHnzD2KSwccqP0FLJClc2/nSz4dAcAMGvjRfU5pbnRHvCwbNYrcQBrI5qn7d7DXMUI4vYv19syNj1lPe723AvShcevT47PKNSBGGqJJH/MNyHbPxxnmEcg2ZMc+sTI49i9CYKXx8d7EjBEDCAEFIIA5Um4Hn1kv9P3SO1YEAh5VxH3Nrr/MciyAdUDkzXirqcbF9mNZC9VfSr3gX8cw5o2LPjtR/Q7p42/dJaGb6ZmuYZZrihslhqCD5Ky9NtpR9ysGjphNSrt/vTJI9MihOIX8b+s35GalwptIWAyYMAi7MNMnfGPY4Z9U1B42XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5295.namprd11.prod.outlook.com (2603:10b6:5:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 12:55:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 12:55:17 +0000
Date: Thu, 5 Sep 2024 07:55:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Rob Clark
 <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle (somewhat) amdgpu
 memory stats
Message-ID: <g4g7g32mqlhpz34j3u4mztsdjgmimne3srcwipw72y542mkweu@44rhdzyauoxa>
References: <20240904155919.74744-1-tursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240904155919.74744-1-tursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:303:b5::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: fae872b3-7be8-461c-79ff-08dccda9fdab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SCX6Jg5MdU5dhoiEEIYYxB0iAVAfb+P7slxYIw7Qxw1CxDu4e7V/6UK3ly?=
 =?iso-8859-1?Q?pnXu1fcd+r6FSS7giD8h6YTka5Pw3dWbm+UdGdlHDglTPSVCMWyF4YHyKU?=
 =?iso-8859-1?Q?XYEQUSiZU12sBP4cMDyNwxtmPYF0WXLS+wwrC2RmbPPFoVI8kqOqWPBX2b?=
 =?iso-8859-1?Q?ZaCQX0Ba2sjnjl0Rm9Nek4JUOGtPIGaEX9teYqQRul7LSq8h8CQay2GGH0?=
 =?iso-8859-1?Q?5DYGC33xN7bl4Cm9yrjmz59GGYvP0ySuemmsHUb6fFN4NettHzr1zMdAct?=
 =?iso-8859-1?Q?xRetKdSM8EPFSNzwd4L2ZcKpr5V9I96osOF+3l/OxJ7y5NilaOhTh+XOgY?=
 =?iso-8859-1?Q?ag+JvqYgtJ3ZW+W3X+nFlgUWOWgnii3jmlh0SiPTVpQ8no+44P82nVRnbf?=
 =?iso-8859-1?Q?JAknZvHp5tKLEcovEm3Bq62xdzhoz8of8YoNG+IWAQYWYY8MskcSUcFDgi?=
 =?iso-8859-1?Q?KWT7/dmNct7AqVxARQZzi5N4yzDW2lK5YVnykDKJyqsaLdbfRL4LC8yQYw?=
 =?iso-8859-1?Q?Sf+uIRnmP27c536+Yl+bn0GZumkUo0jtDTxR+aW7YxvgyTL6NApTdUw1yW?=
 =?iso-8859-1?Q?zArSO4N6LlslzDSkb1vJ+bXj+xO16TZMJ7DpmtX/Dj4ogXo6BIx5WNV+rt?=
 =?iso-8859-1?Q?4+97AQSzLpuK8v+wmMW+1qz+NkO0QctWa7awSCfbVcbkmh3zEe8Zr49Yx/?=
 =?iso-8859-1?Q?NB8Cj3tOJbOcAc2rEsPZceVrxDUAKvXlAhRur8f3N0dn/tf/FCSA1xF1yH?=
 =?iso-8859-1?Q?r1NiXbN8kEoe1XrqcnfcqYuvn1mAbPrfKES9EWOu3Nd1jnTrDwznuhxTc6?=
 =?iso-8859-1?Q?WFStQ/CleOyVvOFL6ukx7AxRkVzpGphEnY5A09hhbWew5YeiJ2WwcEx+uN?=
 =?iso-8859-1?Q?bWtt2AYWXxMsQELwcuLiNxC0glNIJ7hOchOQintJ9XqZ6Ml4zt33RHvuft?=
 =?iso-8859-1?Q?P2vDUzuK4oZJ4Zlj+uoDoo5/SwThCr+PZH24YxkkAbHAWqvrq28rgDHfIP?=
 =?iso-8859-1?Q?elUaUNST+1LzR0r6sYrmNY6Khi5EaV2h/8gDsnyUwLShJweMFEXSQRqvqV?=
 =?iso-8859-1?Q?iqNhzIyEV0N8DvKQuukThTI23HVdAjBIZXD1Q+yK/HQfcO6zZ8Ai/n0Tjm?=
 =?iso-8859-1?Q?Yo5gmmbH1VJkIqZFqH69+8lvnj65CEa2t9gLRI3nwOHdWOiyKd/Ue4AOQZ?=
 =?iso-8859-1?Q?EvYBT45g44rK/EyQXHl3bZKJJ8ectcRS5S8kzo0xaKLQbyXUcPgo2UarUR?=
 =?iso-8859-1?Q?kOS5v/IzJgOozaubGC+HPFK3tN5eipRc/CMXaNd85DqdQ4odBGSbovtTUE?=
 =?iso-8859-1?Q?KAT0UMtuPRL99jod+KTzsa4idEmD9LsjyVZKZJ0d7cmPPiXTsj+jEf8qi1?=
 =?iso-8859-1?Q?w00wNQQRb8kKa7CGI1LE9V3NU/zauTjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TuQznOCsAGKJcCgTkqqxYqYujqk+fW1xjoAsN3KVdG+wC2b2jVMdhO7u/a?=
 =?iso-8859-1?Q?ohGITHKuEfRLNL0LnHOZnEPQG+23N5weoPRDYf0cPNdiPf+mU7l6Lhkbx/?=
 =?iso-8859-1?Q?2w4Lr9Tozl8N2IrSw25gRc6Ptm8jYR4ASunDTQ53O8d8vc7RVkk4pQ1IUP?=
 =?iso-8859-1?Q?NMlLzkCZvXCDoLNhsflm1Ms2s4czX0BSzSHSWnse+UYhfqoQe6Nk2Eqxbq?=
 =?iso-8859-1?Q?6bIBZ6lG8Qx4Jnu14m0OQ1XGTfvNCDaeVrfmWMI6oq8w42+3NLsu9CF1s7?=
 =?iso-8859-1?Q?Ggngaq9FY8a+a81Gw0Pm04MhCOlufH55C2qTXZIwIG+09gPCtR159AecDF?=
 =?iso-8859-1?Q?8/RVvq01wejL01g0BvBeu59hC7iDHkpBgSmVLaKr7e2xyPeVEBisrBzek7?=
 =?iso-8859-1?Q?Y8Rb5A4ven/aMjRML+ooYYesIvd74ZWJXuGS39G9clhZ4ejw0i4zYkjdIL?=
 =?iso-8859-1?Q?sqD3zDCd9Qnqmx14z6wV2LD6qu5eaazmvCF8YvF0DS99BqOD5WQhdf9k7a?=
 =?iso-8859-1?Q?tysI106MWwR0S9cPexXxe4jcioTU9haJWu/JDzD6pTy1G8StEnJ8EOFYPc?=
 =?iso-8859-1?Q?Lo/492Gisqd/jmvti+bog/w/mQ/FSDZarFOvK1GzwmTO/Gvlzj3322Qjrg?=
 =?iso-8859-1?Q?HN0cMU7YngewWcJEf5HOjh/P1HHnbEazAu/pN3S9hpX2snDP5zAMvVMIOL?=
 =?iso-8859-1?Q?rdVjHqGTYTXyD4fK/tr8XjAGbuMYh6wElzJ5AAAQbKqX5K7zgVXCcz5nIE?=
 =?iso-8859-1?Q?WPih5V0f82BAbnswBolQ8OlGHR/4YFC154I+MQVoaNSAISjKEFTBiZSypN?=
 =?iso-8859-1?Q?pf88Yd5V2+NwT+MYkxCylqMjjCwTonHh4+P1r4mAEI2Jr/QdxpjjJGRBG/?=
 =?iso-8859-1?Q?mizD+YfFhZtDTTbzk+fDlgKA1ZSzIuYNkzBnA8OZS/3L6GTQgIMGFaugZA?=
 =?iso-8859-1?Q?po7ctVO6s4sAi7Zs1P5vQvpJpCafhY28Pik4CeOiWFSmc++on7I0ThJ1z8?=
 =?iso-8859-1?Q?lq5378IQFMgJw0benGoWaEd4vvlIRYUAh1T5d20jTvLYgBFVpAciE2xkNc?=
 =?iso-8859-1?Q?q0TUvc1FbA0syDzHbMcIgFfGYWqDSAFY8f/+Vuscf+rdKphnYumBJpyGRo?=
 =?iso-8859-1?Q?Y2xpInbU+8qSHlYC0CrJjoq1gbGGDjJuum4FIMgysMa7YrJveYLOCih87+?=
 =?iso-8859-1?Q?PT/x8F0PdOw2vPziRMnuiCUDuHPxXdkrWQ7jpItJLl2k+wX+2mY+OxqI03?=
 =?iso-8859-1?Q?6tp5rzOsWo0fKd86nUgaTr+2+8GMFNJuSPrmzV4Q9/HdWsJX6avOhix/YV?=
 =?iso-8859-1?Q?IMJg7K/EjwwtLf1T2tw4q/P2ltVr1bSo58XMvvjxox2mwoA0YhfqeJpBfk?=
 =?iso-8859-1?Q?7Xs6fm8hdaifIpYDkLKNqdZxg/UlnCLivZaOh51k81T/wdXkpTMyC4OpXO?=
 =?iso-8859-1?Q?es7nSyMOCD6aJu4efiMmbr/5U5QJnEfuITl1BxDWIVb0M7p4IUWX/CGzeT?=
 =?iso-8859-1?Q?8nsABZTWKxHZRIT6nYtE9H8brHKMjdJd/PuJITeyEjG8VEURTHt3V6YXpC?=
 =?iso-8859-1?Q?yqZMChLMJ78sS7hbzWzqtLMWLw8YxUywk7rM8gpnBnSZuSPS2+V1fdQaOv?=
 =?iso-8859-1?Q?n2NEvNxIvUeMHOCby7+UVtZk0LErZHzvVEQM2pB7trXCkcFecsiioOOg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fae872b3-7be8-461c-79ff-08dccda9fdab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 12:55:16.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqELB5ffKR+RC0htQEW/CvKoIHJ0YL61539NFWsvOTR81gg6cSsGMJtTAOBkocU59pWHNzaQLcig8OIGP50THGDKi+lWZiMpEvpDnCmXzlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5295
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

On Wed, Sep 04, 2024 at 04:59:19PM GMT, Tvrtko Ursulin wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
>Code so far only handles the clients using the common DRM helper.
>
>Handle the amdgpu driver which uses a slightly different set of keys. More
>specifically, outputs drm-memory-<region> instead of drm-resident-<region>.
>
>With this added gputop starts showing resident memory usage for amdgpu.
>
>v2:
> * Semantics of amdgpu drm-memory- are like resident, not total.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Alex Deucher <alexander.deucher@amd.com>
>Cc: Christian König <christian.koenig@amd.com>
>Cc: Rob Clark <robdclark@chromium.org>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> # v1

my r-b stands.

Lucas De Marchi
