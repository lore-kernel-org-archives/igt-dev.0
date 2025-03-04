Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63555C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 07:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC7210E237;
	Tue,  4 Mar 2025 07:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+JaEioB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE68610E237
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741073082; x=1772609082;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=873xcqR/dBWm10aS0sSTLAAj2Nq7Agi3OGvnXuULcTA=;
 b=d+JaEioB5+rOrZjiLyxrQkeKkmZ3c2qXMaagF/GMBtZAjOqJq6TY8f07
 b4IvjzoiTiKtUk6EEd7KaZ6prtwrUs2sLLTlpjiagtcFFLiZYl6nYuZOm
 AMRuqWekFMYiNQw/arZC3ULGWjUCIvIVUEXMljYrh/mBwXlMQx+Z5msj1
 uytW5ImU1JyOXUOdamskOhW7x9mQX+DaYd4rgTDx82B8GLjazIiDW1TDx
 qfHoJato8VS3jn584UbgsllUfFywcvdVN5m/rvDehs8H1X8TuIYldH11Z
 laxneJE/MNj3MR2IAz6Lzf3wmtTtCHbLS+2sMW/w90uuHBs/V8lokGvfv w==;
X-CSE-ConnectionGUID: bI6VLgkTTN+97I/t/lMPcA==
X-CSE-MsgGUID: m3JmSHTWRXO/okxDQWGemw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41871384"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="41871384"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 23:24:38 -0800
X-CSE-ConnectionGUID: bueYxC40Teao6n6FHYSq/w==
X-CSE-MsgGUID: 5rg6Gu4STBGXhzNSclapIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118975731"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 23:24:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Mar 2025 23:24:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 23:24:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 23:24:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awy6VunBv23uo2GP71NTJgYpFgUzRFjo/r/mlJYuSXXi00AXSISHZtOgpsCsK8DXQC/0FSWX1T7nlFXU6n4aqmOO7UrdpntWXVxnMoiHYRNUwXvtWJa6ztKsr1/cJZYnejpKOagTO7/ok3WkwItYmpEhZ/xBcfzQSmM6yjHUblJE4+oVi9hWdA1X4uVDvMX2ATyB/7aVPNTlg9NHNI8HXTrUDTxyxUqeduxh7nLuXyLXzKcKS/233Z8AeWRXwAZwQ7VGI3tkEhf+4e13Tp0gcylcdRNWeNTECZP59e7N1ZI3nPJaT/M1dOop8I3o2tAFwzOgJbelySNeL5Ulbawo9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QBkn+eMr5WdVM3IsgSaMn/iP5ialjZJlg3kIquR4WU=;
 b=Am/Uc2IHDQhYlxPM7pNePakPkmOpZ9nSxFukSQT4tQS4za05dLN+FYys5UUTuVps6otdAlmOtQLNzaUTtJTWAKtS+B85sZo1QpKFZBeAO8mLNVt+NSMYfoQD9htDTuPy+mSw0lxg7AOxYIIxQN4Fo/WroCE1DU7hZD1oREjTzVttZ6iRQOoXKZTgv1qUTG27XGzrt6q55MrU+rxN7F8cnHJ+OG3bHZDHsqMEXeuCOWOhIez8gVrEe2shibn6pMXGyBV7tx7M2JocPk9ZeYN63fUEkIn0E9KMOyKvtqnjWkq2ad5p/KeWMSqwjA+6f7ZyyLRpgpa1/5F2onBqZeshxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CY5PR11MB6234.namprd11.prod.outlook.com (2603:10b6:930:25::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 07:24:35 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 07:24:35 +0000
Message-ID: <30934360-442a-47c1-a8b9-3e5446f99a0c@intel.com>
Date: Tue, 4 Mar 2025 08:24:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_sriov_device: Add intel_is_vf_device
 helper
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
 <20250219115314.180382-2-marcin.bernatowicz@linux.intel.com>
 <316c9106-cecf-4682-a28d-64951be3dde4@intel.com>
 <3bb27413-e2c5-4553-9992-f2505ec5c2ad@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <3bb27413-e2c5-4553-9992-f2505ec5c2ad@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0050.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::39) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CY5PR11MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e73faf-be73-4dc8-402e-08dd5aed9d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXFKL0NmbDhoVFpCZi9FK3NoN2xKNDdJNmRxb0V1NVYvVmJaWTZTR3Q3Skti?=
 =?utf-8?B?SUFOb0VSL0NVdVUvYnp2cWdMc3ZGNTZZVWk0bTVkbnJhZkR5LytrelAxL1Vp?=
 =?utf-8?B?UXpFOHhWWUlmRm8rdWFHVmFHeXFOWGw0UCs5ZDRuRHVkZ1RxNklvVUhzMHB5?=
 =?utf-8?B?blVCTjhWdDh1Ym04SThYZWV2RngwaHIyY1VQa1p3ZE9oWXUvalFaYTcwcFBX?=
 =?utf-8?B?b3U5dHUrUGhQM2wwVHF2cXNicjFXREM1Mnl6bnQzaVV6U0dQeHJWVGV6TEhi?=
 =?utf-8?B?VWltTmRRVVliUFZpWVhWTjRxN0JpK1hMejhlRTgyVjRnUkRobTJ5YWtNK1dm?=
 =?utf-8?B?RFQ4cW5UL3RaMGRJcC9jS09ZMEpEdVFhbTRwQ2RtdWJhK1ptU0tmeEtNM1pV?=
 =?utf-8?B?TkFCOFkzV3pDakNBYTVnK2NEWFFwNzUxcWxUYnNncE5CVllVQXlncjljY2c5?=
 =?utf-8?B?aFlMSnp3anpBSmhaUGViazdNSjZqeExNdytacFI4S1QyczJMWDNkTUxtQ1E4?=
 =?utf-8?B?Tm5mYUJaNkJITzVqcklRRmdaMi9PWEFBZkttb0dFNHdFdE1aYWpSWElYSHly?=
 =?utf-8?B?WGtCcExBMGZ3cGtCc2hCei9KYUwybzBzNlROSTBwNk93MHB0T3dMdGlvNG92?=
 =?utf-8?B?NVFWc3YxNHNRYm5ORk4vcDNKaFVOUnRWdzJmQ2s1ZXhSVmp0NG9CTkY5VmRX?=
 =?utf-8?B?RktrOHNzZkxEQWxlNzluaURXdG1WVy9lUm1NbVVnWmtMVXlHYUhVUnUrQU8w?=
 =?utf-8?B?bHVldTBVaUVxWitERU5wdDc4SlFyU0g3YnZWNkpRaVFxRWZGM0xUcGJQdkFk?=
 =?utf-8?B?NGFzNTdXMStFb01aL29MS3RSL3pVb2wxc1RlWXUzU29WTjY1cklZeURYSzkw?=
 =?utf-8?B?SHEwakUxcGllTkR3SjZDUXVsY2x6cWRIWGFCSGpmTGJDK25qQWt4cXNPc1Rs?=
 =?utf-8?B?eVpPV3RsbGFMVE1RWkJSekkwMmdieENWOVRNNjRXV043OHlRYm1VdG1uMjJQ?=
 =?utf-8?B?RnE3UDZUV2JYOE5DVWVaYyt0WGF6ZWt3eHJxc0JUZERWOWQ3ZXI4RjVIYkh0?=
 =?utf-8?B?VlBKRURLYXVNUXR5SE4xdTZlMzJEaFNGVTUvcDVBSTNibUhzcDZoTGRZWVRy?=
 =?utf-8?B?aHNlMnRTK0RWTzRhWnFRYVhyMExPclhxM0krZk1MaTRXM1M4UzFWd0ZmK0o3?=
 =?utf-8?B?RmdjeE9rdEs4UkgyaXgrVk5GK29PWU1FRUl6K0dWRXZ5VEhCYncramJwZDlk?=
 =?utf-8?B?TGRGWVN6Yk8xQTFjc0ZjMGF2ZmZnQzgySEd1Ym1sZUNhdkdkUkZiemZ3QjVY?=
 =?utf-8?B?KzRZdVgvK056QlhNc21aRmkyM0Q2V21TOC8yUFZWNWpXOU5CaHExUlpvOTAz?=
 =?utf-8?B?UGxUT0h5VnYwSVV6eFJvM1drWEZLRXJNbCtTN0p5NzMvd29IUmNPdlU1bkJr?=
 =?utf-8?B?U3BsK1ZHSkQ5OUl0TGpzQndqTWxJSm9LenlFRWxGWjh0S1pZMGIrclRET0ow?=
 =?utf-8?B?WG9FczBJRDVCZmQwak9kU3YvNkorMnRiL241SVlxNUpnOXMvd2IzRmo2NVhG?=
 =?utf-8?B?THFzVHJScU5zeTQ4aEZxU0RRK0VaV3lxK2VJRWNsQkloeDlyWFRUTVFyZWlv?=
 =?utf-8?B?aUFybk4rVEdRY3gxSm5Pc0g4OFdKL3NGdWxsSGtlOFdsN1JqL0YrNTNTVlcz?=
 =?utf-8?B?aXBoaWFOSXdyNC8rRkJ2NURrZ3lzRjhzVjlvVkR6UVlpclhPajFiRUpBY1B6?=
 =?utf-8?B?VlQzSEV3bE5QSkFhWjBCYVRlVnhNL1FHNDVaOWwwdlhRV0pNN2crR1lIMVVj?=
 =?utf-8?B?VkJlcUhxMGw2Y3pWRlJFZ09LWVREcTh5dnk3MWhvczh4cUova3kydC9wcnhQ?=
 =?utf-8?Q?CP78DfwGvAx3u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUNDdGMySm13eXhJcTZUaUJhL3h4Ly9SRERNQk9BWm14blVaSUo3QVUvZ2xh?=
 =?utf-8?B?SDJYcFdsc25HYytsTWd2TnFDbFpIOWdIa1J4ZFJxcW5RMEVHY1Z5eDdoZHkx?=
 =?utf-8?B?S0ZsSThKUGtuYnJwdWY0UEpEVVNFQlMydFF6dUZrNk5oVGxvNHhBNjlveCsw?=
 =?utf-8?B?NVhXVEgvcEc5UzNHU1hJNmxoMUlQQnVHNnVYYnJxLzcweU5RQ0crQXdTZzlq?=
 =?utf-8?B?VVpBTFRsSGZVZ0pTbkhuVUJla0pVZTYwbUdaVWR4LzVMWU9ERnVZUklNODkr?=
 =?utf-8?B?VG5QVHNNMXY5bnhSSlJWZm1GdnRiWDFRQjdTUndMSEllSDNGSWFRZTNxWkVx?=
 =?utf-8?B?RTJha25Ya2Z0WnFpOTZCL1VEZHN6MEI2TWh1NUxtd3htMlZJTHJxekJsbEV4?=
 =?utf-8?B?bnJERHQ4TVFOSlFtWkV1R3pJako5cDNWRVc4ckJTOXFGelRsLzdOb011WkdK?=
 =?utf-8?B?eDU4V2dSMmZ4R1UrbUE0c2x0cW9mM1VGeUNPQ0pRQktiOUNuMkxSdWllZ1lL?=
 =?utf-8?B?QWxOR2pQTUlyOVNKdUNVWTJacHYrajBENEVvL0ZKWEtKT0M4OHFsalJKU3Uw?=
 =?utf-8?B?MVJ5VWczc0dZbUx5bldwdWU3aUo5bVQvblZNMEtiTkZ6UENxQmo1aEl6c1V1?=
 =?utf-8?B?T3BMeHM1NEY0ZjB3VTdhVHRtcEozRUhacmlYbjlKeEdIeUJRZG4rNHpGMC9j?=
 =?utf-8?B?UzREdkhJYlMyUXpTdUkxS1JFNWI5ckVESi83d2R2QUVrQXp1U3RCejZhWHN1?=
 =?utf-8?B?bXR1OEpGSjdCa0NyaW93dHRPTnRLd3dxbHhNR2dTMmF4SDJOdlRjd3pCbkxQ?=
 =?utf-8?B?cVh1dDZrbnVYeW5pWUJYQUdoeTl1Y096Q2dPem5IRmZ6UGRUNmhzTFZ3UE95?=
 =?utf-8?B?S25teVFqUjB1TUVlcHUvd0hrN1VnMkRqZEtXbkJZOHNsZ0xWak13YjlkSGN6?=
 =?utf-8?B?ZkJseGd2ZlRLcStYRWhqWlRENGZKZ2lNZHJ6N1hyQXFIVmsvOE1lQkFZVDhZ?=
 =?utf-8?B?cmcxRGxhSDVxcTJWK3VnSGErMzJsVXVNR3ArUTFndi9NTmEvL0tRc0M4dE10?=
 =?utf-8?B?ZEYyZEtLTjlkMkl4cS85UHNsMEE3LzdGcEJHZWsxOFEvWDdCcy9iTjNnOFRG?=
 =?utf-8?B?WjFkbERiQzZnTHB6RFgyR1VDMXYrTi9zOXh3MkRnWTQ2WUJ6TUdzWFE0Nkln?=
 =?utf-8?B?akNyR3VnU2lHdW10YzBBTlg3S243Uk5sY3ZUeFlreFNJVTJMeVM5Y0JUNVZk?=
 =?utf-8?B?dU5oMkEwcnNUU1JXOXdXL2R0dWEyUDBodHhSRDhBcVh5Q291anVQS3lVQmMv?=
 =?utf-8?B?aGJuTVB6RnRTdnJac3pmY1dRbnRNNGIzMldpTVVXQW56SllhcXRwSGJBa21v?=
 =?utf-8?B?NTdZMElNYnpnQVRIWHF6QjRoWExuYjhjZkN6bWxWMzF2Unp1RkQxVU90NllB?=
 =?utf-8?B?SVRJOVVCeTVTUThGYno0T1FLajBiM2NRQlJVcHZCYjd3cnh5R1Nyck1uSkEx?=
 =?utf-8?B?ck96OWpTV2I0WXBIaFlCSkNwVjZHNlRqNjVOZkkzU3ZZUmpKaHRIQ0ZGZ1Vh?=
 =?utf-8?B?dDNaWHhjZ1VSdDhQTzJ6dThaTVFpbE9FVTRwU3lTODZPcmtiWnNaR1R6Qi9X?=
 =?utf-8?B?dGZQeUNTdXordmMzR1lQZ0xueWxuZnlMSDA2UzhUZ2R3UndZbnpVcjhBcU9r?=
 =?utf-8?B?MEh4SE10c2dSczVKRVdrLzZzN2piM3Y0SElUYkY2UVRkOHBLWTFKWVNXMjRV?=
 =?utf-8?B?bmIxU0Y5SnZHME1YRzNNS3YyazdVd0FUVjdLNzgrak9XTkNaQkpEWVBOR3Z2?=
 =?utf-8?B?Y1hQaXdCVzhpYzlWMXM4THhoLzBDNlRXRExsSlJONGl5Z1VaTWxOZERVVlVa?=
 =?utf-8?B?TEc1aWdvelE0NHFzbUhGWmtldHRtUWZlREVJVStMT01yam1leENBT21meXBL?=
 =?utf-8?B?R0I0SzZ1dGw0SjMycFozTjJaUGdxTmRWRGx2NUt4WXJyK1o0NDQ0Wm5GMlND?=
 =?utf-8?B?Z24ydDRKczY4ZGs1NGQrMEVJbkt4RlRyS09YQkVJOFdRSit4T29NcHJrY3ZJ?=
 =?utf-8?B?a2FISkVlWm1MVUNNUnJSTnV2b3NjSVZGbE1xMDBzWm9pK2RVamgrRVUyYksz?=
 =?utf-8?B?T3A5dy8yYktxVjdRQUJQdXlXSC9jbXRFUTVnK2lXMDFzS0FlRllwb1EwUzRk?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e73faf-be73-4dc8-402e-08dd5aed9d7c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 07:24:35.5189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmCm/i2uftJ6EDVkW5HiZO7x9z+Hd0jZURwtGu4iBZTbGGvRTVxMf5B+pPYI3sw3OeL3rnRXInGWQMX7EeI/Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6234
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


On 3/3/2025 16:44, Bernatowicz, Marcin wrote:
>
>
> On 3/3/2025 9:20 AM, Laguna, Lukasz wrote:
>>
>> On 2/19/2025 12:53, Marcin Bernatowicz wrote:
>>> Introduce intel_is_vf_device helper to determine whether a given device
>>> is a Virtual Function (VF). The function reads the 
>>> VF_CAPABILITY_REGISTER
>>> and checks if the least significant bit is set to identify VF device.
>>>
>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

>>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>>> ---
>>>   lib/igt_sriov_device.c | 26 ++++++++++++++++++++++++++
>>>   lib/igt_sriov_device.h |  1 +
>>>   2 files changed, 27 insertions(+)
>>>
>>> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
>>> index 2b83cd43c..ffa996d6b 100644
>>> --- a/lib/igt_sriov_device.c
>>> +++ b/lib/igt_sriov_device.c
>>> @@ -14,6 +14,7 @@
>>>   #include "igt_device.h"
>>>   #include "igt_sriov_device.h"
>>>   #include "igt_sysfs.h"
>>> +#include "intel_io.h"
>>>   #include "xe/xe_query.h"
>>>   /**
>>> @@ -464,3 +465,28 @@ bool igt_sriov_device_reset(int pf, unsigned 
>>> int vf_num)
>>>       return ret;
>>>   }
>>> +
>>> +/**
>>> + * intel_is_vf_device - Check if device is VF
>>> + * @device: device file descriptor
>>> + *
>>> + * Determines if a device is a Virtual Function (VF)
>>> + * by reading VF_CAPABILITY_REGISTER. If the least
>>> + * significant bit is set the device is VF.
>>> + *
>>> + * Return:
>>> + * True if device is VF, false otherwise.
>>> + */
>>> +bool intel_is_vf_device(int fd)
>>> +{
>>> +#define VF_CAP_REG        0x1901f8
>>> +    struct intel_mmio_data mmio_data;
>>> +    uint32_t value;
>>> +
>>> +    intel_register_access_init(&mmio_data, 
>>> igt_device_get_pci_device(fd), false);
>>> +    value = intel_register_read(&mmio_data, VF_CAP_REG);
>>> +    intel_register_access_fini(&mmio_data);
>>> +    igt_require((value & ~1) == 0);
>>
>> Is it really needed?
>
> This should protect against 0xFFFFFFFF reads.
>
>>
>>> +
>>> +    return (value & 1) != 0;
>>
>> just return value & 1 ?
>>
>>> +}
>>> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
>>> index 2b6acb6d7..912449086 100644
>>> --- a/lib/igt_sriov_device.h
>>> +++ b/lib/igt_sriov_device.h
>>> @@ -33,6 +33,7 @@ void igt_sriov_unbind_vf_drm_driver(int pf, 
>>> unsigned int vf_num);
>>>   int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
>>>   bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>>>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>>> +bool intel_is_vf_device(int device);
>>>   /**
>>>    * __is_valid_range - Helper to check VF range is valid
>
