Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CDAE8382F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 20:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE99310E0D8;
	Mon, 16 Feb 2026 20:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKl7ichR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC9110E0D8
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771274933; x=1802810933;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=faaS6o8BIr+KknF8tyMmNkBlcOkf4ozyx434T/w/Ec4=;
 b=WKl7ichRbfTY/IzgWGQW+Gr1wZ3MynffbaIHIFcpyUoEDKMtJOcfIW0o
 hH1O9P5AgORJwWJ0LxHpviZOjPteoXv413BPu38SqlqwOPSM+h7Lhlu2x
 uR9JHEIfaX4v8q3M6ODKM4qK3E9yZDeqnZ6NyOcEf+0I35PANjdbSq2Ja
 f2F98ZuXo6q+N2W16Iizjsfh478NlVuXsyxQ+mfreyt1uEqKGblnR31DW
 oLYsb9Gm9b5KaMXE0DWaylJJRlVnsn+3E3Tf6YJOq2OFPbXzVwhJJyRyx
 VF28Wg3vQrj5IY6HubEBwJctVzomqNMyhaJDHArwOPStHTKDdM6eBXlGc Q==;
X-CSE-ConnectionGUID: qQI4OEuDTH2QdiLIiPyaRA==
X-CSE-MsgGUID: 2JwBGVumTSGPYYKPAVKTPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72246361"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72246361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 12:48:52 -0800
X-CSE-ConnectionGUID: creP+ULDTnK6so79mYBsvQ==
X-CSE-MsgGUID: kMz6kl6+Q7KjSYvQ0zIwOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="217671027"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 12:48:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 12:48:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 12:48:51 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 12:48:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7KNHdDO7PKdMrA8OXvczVkVG85v0pZqwFGx3eBtHc8v8WNzHS3PkucXWc342oFclAO4oQFsZk5RcbX3yAd80pu8Cr6bM+GLgFui+yAgiPeazT4k4T09+8FdnwTmxr//l1Pm8BMNnm3dNAWSiC2Nf9/kfxz8JN8RTV3s6bPBu08vfQPcKryO4F5hGGsBZ+rACHf0A6xT0YRd9O8ZQ7NR6JHM4Qb2/Q8zheJ3ZEe1mp+J6LWGNv8ovM0a15vODZYBIR1xarP76/LjquOCZXen3KXu9wEBdyyUp2bHqdUt8tbO8CX28SGZ/qu14ZDOXngsQeSS3AmIGcVkKDH1gLeDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrKHQUW1CpdWbSXVQ9xuljgcVFVrsqoOGEu/imjvQfE=;
 b=EDtIq8mX4ZQkqKD2yUpAKFLudq0h+0bH5evlw/d48uexi0bm8RXNotQj9CzGSeu4eDA8yZqhDbw3FSLmZKK6gWOJyRNGR6YNPa83Oo+CQ3XjyrJJ6q6ptAHNlFl1BF4U88WTi/C9Cmg6I8ygcleJvIrkmhu73+vqz0uW/N/aLQwfaBXZF7+vXVxly9aNKiiET3Jn2WVVkYKjzJl6nFuz5H0PT1QsB6xyx7lxEQVkhVvk90w4AxwZMSGNvwk88Dekct8ZE65EdOROhY/cMTZn9XYFpkhwKi5GYovKnAkjRli+Q1g5TGPYVYOVEEBOToKbyVOFIcOx9ItJ0LQAqV51sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW4PR11MB6810.namprd11.prod.outlook.com (2603:10b6:303:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 20:48:49 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 20:48:48 +0000
Message-ID: <50051edf-337c-4cf4-9d2f-4bea28b5477b@intel.com>
Date: Tue, 17 Feb 2026 02:18:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/kms_color_pipeline: collect reference CRC
 once per pipe
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
 <20260202060415.2680288-4-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260202060415.2680288-4-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW4PR11MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 889f7f1b-bb6c-4a15-dcd8-08de6d9cc8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWxhVTA1MXRiN1poUUt3RWFRcWFJUkx4NjFDYVNrQkVrWWpwT2JETzFjRUpr?=
 =?utf-8?B?S0NCeUxKSUdqM1ROdkF3UXROVnJNVjJxeG5zK2xJNWpNd0dweFN0MXJHOWhh?=
 =?utf-8?B?NHpQWWJpeHNMNjRZUmQ0N1JSQTBhQy9jcWxLcVBQTzFKamV0d1IyQjh1eXFq?=
 =?utf-8?B?bFhRVWRneFlVWXRnT24zSGs0TmVLL3hXUTN2am05ZUJLakkzVER5eXZjaUFh?=
 =?utf-8?B?UXg4R0tGUnJWemE0ZExqd3FRVFVjcHJZQmR4a3dFYmR0MmtCSVZVMSsySGth?=
 =?utf-8?B?Y2dtd20vU1g4Q3RZTXZod1lnVjFHck9pVE9WU1poY2VuVjRERHVSNG9wd2o4?=
 =?utf-8?B?L2lRRzdPSzNucUVVa2FzRXZKcnNsRUhnRHZZbFdJdkJzbE1XK1R2eHJXc3A0?=
 =?utf-8?B?VllwVlI3TU5qUjg4d1lyZ0NncmxWNUptZktOcEd4d2diUXJJbndvd1JTL0RD?=
 =?utf-8?B?KzNzZDNIQjEzRFV4cnhXZDI3YUJlR1dvUkt2V0NuaFlsZzhtUFYvajBia2hR?=
 =?utf-8?B?ZHNMbWZjNGhWbHlsRldTMFFuN0RsamxsK0VpYWdYcjE4SVRUZjhtdjlnamVY?=
 =?utf-8?B?WExQWGM1ZzFkeEErajZMMWhlN3FrbEEzYTJ1ZVAxdUQvSmtxQnNyRFVtY1J3?=
 =?utf-8?B?VjJKK1MxSUlsSnZOc3crSVp1Y2FEWDBTamwxeFZubFlWc0VrRUJKd2ROVzdT?=
 =?utf-8?B?OTBSbmhLWWFvbXR4ZkRSOGRoakZqL1hxdXNXS04zSVRjNUxqK2s0WW5UTmoz?=
 =?utf-8?B?bURSM3FxQ2hqT1dibHREbHhuY3hwcDcwNU1pbWhjNDFZSlUxTGlFa3dEcWRu?=
 =?utf-8?B?TlczeERiS1hTaW9aQVVqV3oyV25mU29vdis1VWNNSWFCV3R6bTc1OGtuNCt6?=
 =?utf-8?B?Um14UnJEcVNyZEcwTmdKaFNpUWp3K05EU2dJaGpWV1lwMkdzZkpCdThBTHRZ?=
 =?utf-8?B?VS9zSHJmREFycUZxMVh2VjlERGpLOFppNnplSzM2VmsweGNPUXVjVHRJcUJk?=
 =?utf-8?B?UGh3aDFTa0pySEU3REM3VVd2Qm9tZjlSK3JZdW1lR3doWXJQRTBoUWFQcE8y?=
 =?utf-8?B?Q2VHUkw2V0lVeGcxeVF1YVJHRkIvSE9UbVNaNyt0d2hDbGVNL2NoMUQrblNH?=
 =?utf-8?B?bVpwb1FxNlFka1ZQdTA1WmFGamxxZTN3TFZoVG1yNFRielB6Vm16Y0Y2elVB?=
 =?utf-8?B?T1pTWDdONjNwRHZEeVQ2Sy9lL3FBNHE3ZFlXQzdlWTdFRzFodXdSdnZ2MEYz?=
 =?utf-8?B?SFBCZTZzMndPbjF3amRBOFV2R2xSN3JTeWdoOWRMOXlXSjUyVnFkZHJlL0VU?=
 =?utf-8?B?bThwVkpTWjF5YTROVWFOTFVKaCtOZnhNVWY0a2JxNUI0SENKOFFGSm1kd2lW?=
 =?utf-8?B?ZEh0dG5LejZsak9pdEd6WU1tcVhlbG4wSXJLZVk2bTlMQ1VLcnRZb0Rpdmhh?=
 =?utf-8?B?RlNLN2drMUpHZC9FY0RKZjBuRGhTL09kVHdNQ1lObG9POG1aNmx1ajlCU1NL?=
 =?utf-8?B?MzFrVmxhVnM2TzBwdGw4UXBtNm1zM2xLWlNMYm9wa0hqNGRTQVl2QTgwbGRI?=
 =?utf-8?B?ZXBGcXVYbHRtTk9nUlhvdnhuS3E3NUgzTWoybmVoZ05sdjE2OWZ5UGRzQ2U4?=
 =?utf-8?B?SExlazZSU0wwb244MHhveGFrd0NPcXg1b0R0VEFvWW9JL2ZMSHBqUUEyMlJF?=
 =?utf-8?B?cDVjc29yNnBNSEFwdC9UN3pDdHBTTC8xTVFLejgyeTdLdWFJcFhadWVsNzRu?=
 =?utf-8?B?TzFLNEx0OGN6TVVMVTZRM2tYZFFtaEFWRkJMMi9jME43YUQ2VWorUExOcjRB?=
 =?utf-8?B?R0pWOXJDUE1DWng2TmcrY3lDNGpONnlxOWRYelYvZ21WRTVjWlNVRmt4elVp?=
 =?utf-8?B?a3Rha0liVUFnd1BNVU5lOHpVT21RdDJKTTFVZURWU0hNa1NwRHF1ZXpwek1N?=
 =?utf-8?B?cEJvV0Uvd3NXZEpFbnRuR05DRFRxOFFIdFRLNnZBQTd5cU5zSjBTSjZyc2Y3?=
 =?utf-8?B?ZjZ3aGE4R1lKWTJnenlua2U3S05TQzczVFNIWStOcDZ5NWJiVzdiVzNiSXg1?=
 =?utf-8?B?ZnpvSFA3V25lVyt1bm5uNExnQ3pYNk12VEFxOUROeVZwRFNoUGtsbTRyNjhv?=
 =?utf-8?Q?muD4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFdlWmZzaEljVk9ZKzZrZEJIUXM4OFA4K00zTHJabFZURXNVc2ZhZmVMVVJh?=
 =?utf-8?B?cUhaTG9MYm5aUy9Qc3phV3JDck1UWXF1bXl1QlVpTWxRSng4clRhSGV0SDRp?=
 =?utf-8?B?WUpheTdXN0xYTlhyd0dwY3NXeWFwTkJaeHZ2S3Uwd2x2R0tvWm5wNDJJTXpM?=
 =?utf-8?B?a0haMmYvTEtMcEJxUTJZVFZkVzA5UWppcXdlRk81MWQrQjlLSm56Skk3dzZq?=
 =?utf-8?B?dHptaXhrSU1qM1EyMTh1SUd6bkI2KzNhYUwxQThqNFNUV2NZSTlPQ3ZMVHBw?=
 =?utf-8?B?UisyUkRCZDBmeUh2OGJZNWZ5dVllT21PazNhRTJzWCsxbjV3ejZCeFpCZzZZ?=
 =?utf-8?B?YUZYSjdEanNDOXZFZmZ4b0ZrdUh4TFN6aWg5a0VOd0plSTNtR0YwNjNZUExP?=
 =?utf-8?B?THhQaituRU41UWlpWnh5V21oQW5URnZQaVRscUlvK0F2V0crSW5mMk1ORWdk?=
 =?utf-8?B?ZDNaUTBCMFpXQzdNTjVXQmdBWUdONjNVTDZnSjQ5WG0vNXBuY1RqVVVWQTZ5?=
 =?utf-8?B?amM1R242dmNObEduMHp5aWYveC9hSEFPQjFUY0dqYnpnUndNN1NrcW52c2g2?=
 =?utf-8?B?VVlieXYvdzlGTktvTStxSkZzUE9IWjJUeUp2V2lpUTc0Y1ZFUUMxK3ZOTEpp?=
 =?utf-8?B?L0x4M0hOZlpzTTdnU015YjZyeGpNN09ZQTR3VE95VGxia3B1Q2ZKSFgxNHh6?=
 =?utf-8?B?bHZWVm5IRUZBZXRScDRSRHpRTldWLy9SanhTWi9BcU83OVJQZWlNTWRKRGdW?=
 =?utf-8?B?NE1Oa0JXYW93WHJOZlV3TFhNeFNaNnhSVU9FeUM3Q1l0Szc3S0hndVBIbnhR?=
 =?utf-8?B?bmNTZHdWQWVwQ2xwK0VsVWtqcEc1NnZTd2dnUHNGVmlKQXd6dzQ5UGptaVNP?=
 =?utf-8?B?M2hYVGV5SUpoRWhDckc1MlpLRjhaYmhoVU96WDJTdHVpMEVYQkRCM1ZodXI3?=
 =?utf-8?B?Y3JST0RyWElMV2dsMGVqcFg4WmxUZ1p4T1NqUkZXOGVnVFMxNCtZcXhtL2kx?=
 =?utf-8?B?YlhrOFU5V1psVzhvdDU0ek1GbGxSelVJWXJtSDNkTmJ6MGlJREJwQWxGY090?=
 =?utf-8?B?QUZQc05MZTZBQjlIY29KN013UzR3ckJyYnNOM1BvSEZTT1RPbys5UUZyd01I?=
 =?utf-8?B?Rmlhd2o5Z1NPVWRUM3pFZlFzQTNuYUVqV3kvcVA1TFFqYmZZV0NVNm5NSXpa?=
 =?utf-8?B?RytqVmhoNHFVSWN3U0tWSVRZdlRTNDlYOFFLd1ZVRnp3K3Z6c0FOZXFCWGtu?=
 =?utf-8?B?TTBxZHErNFF4MWl6ZC82VHpKZEVqdWpaTFRDVmR3d0JVRzdDQ0owaHNMVHJ1?=
 =?utf-8?B?WXA5M0NMdVRMcFR0NVdOUklXb2FydUhTazhQcUhKdEgzVDc1ekcwVGFKSmx2?=
 =?utf-8?B?NTQzeGNPYkZxK0plMnJQcDd6U2o0Skdiais3dldwa2daSGNUMXYrekRsTEZ2?=
 =?utf-8?B?TTVNQUtOK0NTUmQ5M3J1K2pyN2JYRXF6TTQvdTNZdUlCSFF2N2RiRU1IbFZI?=
 =?utf-8?B?dWlTamRQM2hkMGVCMzc0bW9zNVFMcmJEYVBMVzVSMllzRUxUdmRQRlJra2JF?=
 =?utf-8?B?cnBOZlEwREdHM0F4TU54UTFkZmhFQTY4a1k0V1lYcEZ3Zzd1d0lxZzhtb0E3?=
 =?utf-8?B?TjNEemdsMzZIMHhCdUk3S1dVOHN3MXkyNGxxd2FhcVY4QXhNVVI5VVptcm5n?=
 =?utf-8?B?bnhYTVBHMjV6WEoyZGJYSS92TGpacElQNmk1NzhuY2xFcHhKVi9XTzdidkFn?=
 =?utf-8?B?VkUwdXhscWpONXEwZk5iV0dRS2RDS0I1aDJKK1Iwb0NHYVF6cDN6MnU5Z3da?=
 =?utf-8?B?U1FXc2laUDlBNEFOVS8zdlNqRTc0MzdpeUgya3hITEU3KzNiSjE2a2NMZWhE?=
 =?utf-8?B?ZVIwV1lIM3dqMjVWL0tUcndKTEkxVXBCSEw3NWZURGJUVFpya1BIU0t3M3hk?=
 =?utf-8?B?QTBPSzdwR0I0NmViSFBzSlVFRGlka3hMbWtqb2ordjYyQUV3RDZJcy8vdTBJ?=
 =?utf-8?B?b3cyaEU4ZmVaTDVyNEJRMjNIMVEzNkw1N1IzVVhpVVFlUmxMQjZWckdmVEhr?=
 =?utf-8?B?SGFXN2t1MGhTRnFBVDl6YnFsWEdMMUNNcVUva25KOERQR2ZlckJ5Y1BCSUVX?=
 =?utf-8?B?UWEvY1lYZzcvYVN5cWlJQVpiZ2ZrVTIyUUhFa3RhdTFiMkVUaXkyWFBnYVBW?=
 =?utf-8?B?U1EwVmVrUTM0aDJUWERFcVRtdjRFOGFGT0VvZjA1Qkl3bGF5WkREbGpINWxn?=
 =?utf-8?B?UTY3Y09wUStLWnpkVEY1cGl0RGc0cUJBelNmemo1eUFtL0ZSZUl5ZUxHeVlC?=
 =?utf-8?B?MUkyeGxkOFNFYXpKazFJanlxTzVtbXVuWUF6N05xendlSS9jTVpyQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 889f7f1b-bb6c-4a15-dcd8-08de6d9cc8bd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 20:48:48.7307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUDewPbEl3sbZT4gJvEl3V5ibBzukR51nQaQ4JiCJH4LtZPxRqiLxkYhOg5/bMaC+ithKZ4n1xC7wSjKAuNvHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6810
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

Hi Chaitanya

On 02-02-2026 11:34 am, Chaitanya Kumar Borah wrote:
> The reference (software-equivalent) CRC was being recomputed
s/was/is
> for every plane even though it is identical across planes for
> a given test configuration. Refactor the test to collect the
> reference CRC once per pipe and reuse it for all planes.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_color_pipeline.c | 60 ++++++++++++++++++++++++++++----------
>   1 file changed, 44 insertions(+), 16 deletions(-)
>
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index e15f4d79a..8cc055591 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -88,16 +88,52 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
>   	return true;
>   }
>   
> +static void
> +test_grab_crc(data_t *data, igt_output_t *output,
> +	      const color_t *fb_color, igt_crc_t *crc /* out */)
Function to be renamed to capture_ref_crc() ?

Also, shall we add some comment stating why we are capturing CRC of 
primary plane as ref and not current plane?

> +{
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	char *crc_str;
> +	int ret;
> +
> +	primary = igt_output_get_plane(output, 0);
Instead of 0, use DRM_PLANE_TYPE_PRIMARY
> +
> +	mode = igt_output_get_mode(output);
> +	igt_assert_fd(igt_create_fb(data->drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    &fb));
> +
> +	paint_rectangles(data, mode, fb_color, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	igt_skip_on(ret != 0);
Shouldn't we have assert here instead?
> +
> +	igt_pipe_crc_collect_crc(data->pipe_crc, crc);
Initially before collecting CRC, we were waiting for vblank, shouldn't 
we add same?
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +
> +	crc_str = igt_crc_to_string(crc);
> +	igt_debug("CRC for reference fb: %s\n", crc_str);
> +	free(crc_str);
> +}
> +
>   static void _test_plane_colorops(data_t *data, enum pipe pipe,
>   				 igt_plane_t *plane,
>   				 const color_t *fb_colors,
> -				 const color_t *exp_colors,
> +				 igt_crc_t *crc_ref,
>   				 kms_colorop_t *colorops[])
>   {
>   	igt_display_t *display = &data->display;
>   	drmModeModeInfo *mode = data->mode;
>   	igt_colorop_t *color_pipeline;
> -	igt_crc_t crc_ref, crc_pipe;
> +	igt_crc_t crc_pipe;
>   	struct igt_fb fb;
>   
>   	color_pipeline = get_color_pipeline(display, plane, colorops);
> @@ -110,18 +146,6 @@ static void _test_plane_colorops(data_t *data, enum pipe pipe,
>   				 DRM_FORMAT_XRGB8888,
>   				 DRM_FORMAT_MOD_LINEAR,
>   				 &fb));
> -	igt_plane_set_fb(plane, &fb);
> -
> -	igt_display_commit_atomic(&data->display, 0, NULL);
> -
> -	/* Reference (software-equivalent) CRC */
> -	set_color_pipeline_bypass(plane);
> -	paint_rectangles(data, mode, exp_colors, &fb);
> -
> -	igt_plane_set_fb(plane, &fb);
> -	igt_display_commit_atomic(&data->display, 0, NULL);
> -	igt_wait_for_vblank(plane->crtc);
> -	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>   
>   	/* Hardware pipeline CRC */
>   	set_color_pipeline(display, plane, colorops, color_pipeline);
> @@ -139,7 +163,7 @@ static void _test_plane_colorops(data_t *data, enum pipe pipe,
>   	igt_wait_for_vblank(plane->crtc);
>   	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
>   
> -	igt_assert_crc_equal(&crc_ref, &crc_pipe);
> +	igt_assert_crc_equal(crc_ref, &crc_pipe);
>   
>   	/* Cleanup per-test state */
>   	set_color_pipeline_bypass(plane);
> @@ -158,6 +182,9 @@ static void test_plane_colorops(data_t *data, enum pipe pipe,
>   	int n_planes = igt_crtc_for_pipe(&data->display, pipe)->n_planes;
>   	igt_output_t *output = data->output;
>   	igt_plane_t *plane;
> +	igt_crc_t reference_crc;
Can we make this as ref_crc?
> +
> +	test_grab_crc(data, output, exp_colors, &reference_crc);
>   
>   	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
>   		plane = igt_output_get_plane(output, plane_id);
> @@ -166,7 +193,8 @@ static void test_plane_colorops(data_t *data, enum pipe pipe,
>   			continue;
>   
>   		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane_id)
> -			_test_plane_colorops(data, pipe, plane, fb_colors, exp_colors, colorops);
> +			_test_plane_colorops(data, pipe, plane, fb_colors,
> +					     &reference_crc, colorops);
>   	}
>   }
>   
