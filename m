Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973D7C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 18:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577AD10E28A;
	Tue,  2 Jul 2024 18:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhBfkpsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C91610E2C8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719944344; x=1751480344;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ArrpOQwtPPArYxwfe1Utu/RoORT+BsGkdEGJltEWjns=;
 b=IhBfkpsA2S/Z+TIPJPYR53OUTKs/gMQYr6txTBPkakdXMVjoHuwc65xr
 A8jSKW0OvVwTu50JUe/g8XFyQiV5gtOlD4imsw+UE0lRmCOHnnDQIXrmg
 Z1+0uEURi3vK7XpB3zaOHK9h92+C1wB0vgvaJh+tyrtlBBJYhqnYmG3cJ
 9rywNr6rVPNXJAtbhCOt/lSL4sEH9s1cjic8Kk0qYDhppD1+f9BZKb2rR
 sosMD+4HLmDHSe4de78X6mWhd3fxAJ/y1V1846KOK9kLgvsJutAZnR+qt
 2RAjpjhma8GfvCVBBCTZsWVnt6ayv8+id/OvIamt4TrXR0/PXcCd/Gl8g g==;
X-CSE-ConnectionGUID: GsKmKjmiTuu9Qs2VYIRcxw==
X-CSE-MsgGUID: OYePtyzKRvGCoLwYN34GxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16966132"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="16966132"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:19:02 -0700
X-CSE-ConnectionGUID: hTUbKvf3Rci149YsP4BVzg==
X-CSE-MsgGUID: jK59+5DzSFGB4HyacbIENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="50324701"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 11:18:51 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 11:18:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 11:18:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 11:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STsn3gQ0GPQ33/HKokRk99nFlFlvZnzXm+ITY11S/cO2cTHGkIobTCtZE7bpKmYOO8wBr8Z5nfLD+fN6clPY+BySdtBqd61DJjQ/92FIb43cuiq/8XCNiuvtsn7LO9Qep+LK/AIoDrqklOm6b3Md8nfJnGmRXyZu5vlxUmqFUH3yGVEb7Y4CjMSZHAcB4ZlEO9gyRnnk3WwE73Harjuw+JRugNEqjSIZkG6b9dqGbUB1//z1q+iEDSfu6W1g2Ry7FifD/+dvO56NQEC7eWo4chUuZZHb0AzlaDP14kJ7WrRdQaqUPy5y9ESRVzZ6a2/mr83TIiGfKXySTSgkPYDZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odXfCHRUeC5mgjmZ9vORrFl79VvNOMjkEUhxQL/ZaTQ=;
 b=QLqqfLoW7+0SXumwe4bqZNCF2yt1xLFXdHyCSvMpj5w3B0biqggLYjTdictv93OJH3A2dQBSrYhw6lI7d7hNCRXVzw0+87IFAslWa9JNWk8gWzNjjY1/mgBPI0byQHoxOruAg7P6lCa0P+G62PLYwqGJI+QmUQSqHVu6dmaA+6L9mBcKNJ1kncOr12DPtEOBKos5BKB1Hy+8OYrvJAR3oSIgA6s6eBPSJb/9zwsuJg1/99zzYu/pr61HnTjqtSk6waHAIPXdRxmzRkfFmsEjAMXahKdgvbj0RBwZ1L/63IGtbCFiSsTVHzGTuB8jLWuCxrI7NoSIZqWIXM+NspTN2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 18:18:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 18:18:49 +0000
Date: Tue, 2 Jul 2024 11:18:48 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/8] tests/intel/xe_drm_fdinfo: Add single engine
 tests
Message-ID: <ZoREiBXWJethW5kO@orsosgc001>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-5-umesh.nerlige.ramappa@intel.com>
 <hbv7noflzphd4rlkfqbpqfwqaygqfezuavd7p7ovddvm3y4vl5@445l423pjo3n>
 <ZoL009g5Pd+J8XDw@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZoL009g5Pd+J8XDw@orsosgc001>
X-ClientProxiedBy: MW3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:303:2b::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL3PR11MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: f24f85d7-c8bf-4b3f-d567-08dc9ac36bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjlCOVg3ZlNnWkNDZUsrTlBmbXdMMXBuRVc1RWd6Z1Q5bVJwaVlldjZXRU10?=
 =?utf-8?B?Tlpha2M1TFgxU1BMdXBPNUdNdjJ0cHZML25IVGl3Q1pUcURHOFVLcTVlWlIx?=
 =?utf-8?B?Q052bEEzdHNVcFFSZXZwN1JQWGw1Z0RaR3ltSGFsbmk5eGVCblpQMUpETkh0?=
 =?utf-8?B?OU83OGNqbTYyaDFEMitNL0ZReXpjaXFRRUV5ZjAzcC9TVm5YbTA5cVV0YVdX?=
 =?utf-8?B?V2k2MWpLaTlwRHE3NVgzNlNReklXYWRKYTY2NnJZd01lbUk5eEJvb0Y1NlI3?=
 =?utf-8?B?QytZanF2L253bjZOZFphNzQ3cDFBck5rcTRYTzRzOXFHdUhYdVlSbCtVeUl5?=
 =?utf-8?B?VXFZcGNxbVp0TjFZL1pEdjNiblkvVWdOcDJDSmNRbDFGYjVmSEpGdS9SUDM1?=
 =?utf-8?B?N2hJS1FiRjZTT255bll3V0Z3S1FHZjFIQjVQWFBSN3htcDc5R3Y0SklLSjVz?=
 =?utf-8?B?UUVycFg2eE9nL3p0aDhRYnQxNkZRMnRXUzVEUmlnR1YxU0JlMitWcjhMWWRU?=
 =?utf-8?B?bnFmZUo5MTRMQXFQSUVvSkxhUTU4dGRoUjIzTGloc1FJWGpTb2I2c0x5MHZk?=
 =?utf-8?B?Vm9pMjZDWDM5enFrbVNvTXpqRGpKY0pqYjBKRWFmeUtvVlEzeWtkVVVkTWtY?=
 =?utf-8?B?RVpmMjJObFhMTlJ1VHp3T2N1bHFkQkxOdW1zQzdzR2FKaDFubXpIRmtZeVRE?=
 =?utf-8?B?b2VkemRjSU8yZkN4WklGd05VMk9IZDBHR216WldrQjZ1VlZIQkhDWVJQV0V0?=
 =?utf-8?B?bm5wblgvQ1E0Rk1ldkR6dHZtVmpnTGdUMFRnVlYwNFZkaStwRGdOU1grQ0U3?=
 =?utf-8?B?SE51c2RVTFBoS1pVL1VxYjdVU1N2OWRJV1BjRWJZQzA2ZVV2bG0rRGJYdUZP?=
 =?utf-8?B?ZmNYMVJJczlYbXQ0MWNFVkFuQmgzQnl4Q0ltUkJjc3pkUWlrd05wZG10R1Rs?=
 =?utf-8?B?RUcvZS91ekJTNXkrNmZZenJJZDJQSDI4VWFUQ093eENQSTBoNFBiWjAzYUMw?=
 =?utf-8?B?eHBNc3lORDlZUGtKTzFmNWxsd2JoYWFtYkpzVnlmOWpkRDZjbHJRYi9nK0Y0?=
 =?utf-8?B?aFlZOU5Nb3lYY3dLNjdQK3l1R2ZVR1pjRWFQNTJ1cm9hTHFGV1lNUk9xMGNm?=
 =?utf-8?B?bThJcjI2TmEzYmhKVnAzS1pTWEFIRmV5eUhVRFo5TG1WWkZzRG9iNzllaDh1?=
 =?utf-8?B?dEV6aHVHV1o3OCtQUWZyRDF4M2ZQSy91NWNTRERDNkhFbDlGcUhMZklXeWkw?=
 =?utf-8?B?eWxxQUJWVFJWMDAvZ204OVFLbmo1SnRGYXM3d1oxQVR4Y29uL2s0aEpLUkI1?=
 =?utf-8?B?aDNaWnlQajliVGVVNzhGak9LT2pheENuQUVPcXdabGxsR3I0MExnS1Npa2VD?=
 =?utf-8?B?Ui9yM3FBamhuL2laQkxTSDNuNzJCM0xKa2NlZ2ROOGJoUHYxWGNlVVZvT3k4?=
 =?utf-8?B?VzlZanEwZkcxVkRPM2p6YzFETngyNFJtWlhCcm1FcnlYTEJ4eVVTK3IycHND?=
 =?utf-8?B?ckVueWFNWnlWM2hXV2VQa3ZRRXFHTnRzcTRSdDhQZ1krMk95a0oyUkhuWHB2?=
 =?utf-8?B?VVU2M2J4VUEvUnRLTjZkUUxKTDJ1cDlKdFBjbnlhTWhIMk5GK1I3MWthRTZL?=
 =?utf-8?B?cG9SdnpaRDJYVTRKVmlQVUkraE0zZjJESXRyR0wrQis0OVc5c1AwczVUT1hV?=
 =?utf-8?B?K2FGb1VnVWhKa01UTmNDWDFSZU1uVHEyekllNjB4U29SSjVYODZPZS9vUFZs?=
 =?utf-8?B?WUdCU2lPMUUyZzJ6L1R4RU80V3dCTDBzWlFGQVhDM0NMbmxDTm5ieXk2NHRh?=
 =?utf-8?B?eTVscDRGclMyeFF6b3lWZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXMyYnlQWnJZeXB3MzVlQTRDVWNHNUdaemQ5MTNsYmNMazNwYzNpdCtUeTB3?=
 =?utf-8?B?YXQ2akNXMmtlZU01ckorQmJrN1lMWVF6N0hqcWgxUi9LSCtid1VGNDlrT1V2?=
 =?utf-8?B?OWRsUnZoUHliZXUrK1BRVTY2UEZYQkdXUkFvck4zQyt4ZWlLNFc0SkhIS1hy?=
 =?utf-8?B?VEhJWlFjaTRpWWtxZkowSXQ5c2czMmtGR3NHbE5mMDVIZ1JnbHI3akRMKzZ4?=
 =?utf-8?B?RGdTY05DWWNoODZ6YzlRVEk3ZktJYnFRUFpEVE9sTndVd3B4Wk1ON3ROdEgz?=
 =?utf-8?B?aTRRaGtmcDFiK0VCZmMwazRaaEs0eEZYSUNtN2s3dlZCeC96YjN4V0JYQzRB?=
 =?utf-8?B?cGdNRGUwV3dKT1JySy9NZDlVUnVZN2E5QmxsOTlndVVCdnhZUktvR0RaMUhQ?=
 =?utf-8?B?R0dRbEc0TVdKWloxT1M3Um5nWURuL2YrbFZNNnpza0J4R2E1emE3Wm5VNnhm?=
 =?utf-8?B?eGFhU3h3TEJmZy9tbE9ENTh0Q05QSjkyL1FUa1o0RGQzU1FYRkVnQllsSVY0?=
 =?utf-8?B?UVVkelZFQ21rdVh6VjlEZldlby9oUUlPdzhyOFdNK1Y1Zno3VHBiTVdiUlhI?=
 =?utf-8?B?RnNCdy83UDFINFBtQ0dCeThvRHcvWjBKVDU0ODJZc1FlVXhYZWpYOFJEMFl4?=
 =?utf-8?B?a1h4WUQya0ZoMEV5ZEoxQXo1TzZaN0xicTNIZ01UZnRvbVJ2TXJyeForWXhR?=
 =?utf-8?B?Q0l1QVM4a3drV0FrWU4zMDUvQzNhOFkyYmVQc3dETGFaQlVBOVdQMXI2WE91?=
 =?utf-8?B?RTJ0S1Z4N20vMnVQWmQxV3ZYdSs3d0J6UlkrRVNRN0xzWWdsTjUzVXp3MjdX?=
 =?utf-8?B?NjBCWlYra0J3bGYva3UweWFjTGd3SWJKbTRxSWZlN1F2NCt0dWt6Zk1kK1ZZ?=
 =?utf-8?B?dEFwR3Z6Y0VRL2pLaG8rakErbllIME5PdDBvbGlsNTJEaHlGTnZDV21LWktB?=
 =?utf-8?B?bVpOMGEzNlU3M0N3OUtlZWhEZElDOVVCTWh4Tml0OUFmSUJSS1dnZjJ2YmhV?=
 =?utf-8?B?UGVoODJ4Vk5UTFYyd0YycTBvVE0zTWVyZHZoYm9VTWFMTUhnQnRTYzQwcm9O?=
 =?utf-8?B?bFRndjdwamh3YUxPVWRhNVZDRElxck13YXRmVm9tVmxyUGpGWkVTTWVFZFVE?=
 =?utf-8?B?Y2k3TUhIRWp2aEdpekQyMFNWb29scDU2T2NNNVNLKytzbE1yZHVUeFNGeW9K?=
 =?utf-8?B?MFpTZUh4ZG1KdCt0clJTcURIZVRPNlhaYkxYQ3BxRmFhTTZEMXpwWHZVbUFs?=
 =?utf-8?B?ZnBCdy9xZkVDTHp2RkFwUVErcG9IK0UvZ3pPRHA3M3FZSHFJNjh5ZGVDMFVR?=
 =?utf-8?B?N2xsOEpTNkpBelRtekFNdmUrZjQ4c0xQWCtWNHpEZWowQjRsOUVJM2hDL3J2?=
 =?utf-8?B?MFJ1N1BrV2dZZGhVSHBoS09UOEQwRC9NYlRvcTk0VWVMaGgrMEVEbU1xbTMx?=
 =?utf-8?B?Tkp2UmhXUTRhZ1daQUFVVlU5dHVmcTdjK2ZDTnhhWHcyZCtYKzJZdUJ2VC85?=
 =?utf-8?B?Sm41TU5pL1Z4dUNGTWlSRWp1VGhKT1owNFFwRTZzRXh1MDM5WEV3QWYrVE5k?=
 =?utf-8?B?TFVrVmNaek5oVGg5RDFOUXpOYlhpa2dYQ3c3OFNwVTBrZ0Fuc1FlWmRaMm9U?=
 =?utf-8?B?eTFHNEdjZDFGaW9CWWJqZHl1dmRsYmJrUWN3SHJseU5GV1FwNWpud0QyY1Ay?=
 =?utf-8?B?azBXUmVsaDAxcGdzVEZyekpsOTVua05zT0laWitvU2ZEQ0RBRE9McmhJcFht?=
 =?utf-8?B?ZGprV1krMndKT3RQRjlieDZKQmt1bVhSM3Rzd0d3S2pjSnJVSnV0T0F4cGxl?=
 =?utf-8?B?TTZVRVZaTjBzY1BEbkdkZjlyOGl3VXFlUHkzZHJ3RkRPd3I3RUZvbDBYRVBS?=
 =?utf-8?B?OWRjLzArbU81YVF4cDRoeEgrY3lTblNVK09CNHhnSlpxcVhMd2JVbVA5eE54?=
 =?utf-8?B?WWh3L2p5WERmT3lDaDNRRElyaFk5Z2xIQ0ZOeENCaU1QU3BieERKT014aklX?=
 =?utf-8?B?RGZGVlJGbXZBWFpSMjJ5b2lIcGlLbXlmOWttc0d0QzBLbHNvVFk2OVVzNTU0?=
 =?utf-8?B?bzNLcmFsK294cXRjYVdJekVRV3hkRTlqemJpaStzejgyV3U0SkhBUWFFWUNZ?=
 =?utf-8?B?YVlGaVFiNjdXVzJsbDFPQ21iOEVKZ3d3eFZKOWhNeUVTV0FqMURKdnhEK2xp?=
 =?utf-8?Q?JJ7/kGrNZfc/wYRj4tSPQZ4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f24f85d7-c8bf-4b3f-d567-08dc9ac36bc0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 18:18:49.9002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UmlVWwT2P+Cc+CfmF/0gg64ujqMsr6jBKK2tjhHbCtm0tQ1is99AN0AJE6uD+TYfzG95MwN0swyUISQ6DXQKzZeFsv17fOYWSQ2o/ayavE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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

On Mon, Jul 01, 2024 at 11:26:27AM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Jul 01, 2024 at 12:35:24PM -0500, Lucas De Marchi wrote:
>>On Sat, Jun 22, 2024 at 07:00:58AM GMT, Umesh Nerlige Ramappa wrote:
>>>Add simple tests that submit work to one engine and measure utilization
>>>per class.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>tests/intel/xe_drm_fdinfo.c | 109 ++++++++++++++++++++++++++++++++++++
>>>1 file changed, 109 insertions(+)
>>>
>>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>>index 27459b7f1..852931d71 100644
>>>--- a/tests/intel/xe_drm_fdinfo.c
>>>+++ b/tests/intel/xe_drm_fdinfo.c
>>>@@ -25,6 +25,15 @@
>>>* SUBTEST: basic
>>>* Description: Check if basic fdinfo content is present
>>>*
>>>+ * SUBTEST: drm-idle
>>>+ * Description: Check that engines show no load when idle
>>>+ *
>>>+ * SUBTEST: drm-busy-idle
>>>+ * Description: Check that engines show load when idle after busy
>>>+ *
>>>+ * SUBTEST: drm-busy-idle-isolation
>>>+ * Description: Check that engine load does not spill over to other drm clients
>>>+ *
>>
>>can we split the mem-related basic check from the utilization-related
>>basic checks?
>
>will add a separate basic subtest for utilization.
>
>>
>>>* SUBTEST: drm-total-resident
>>>* Description: Create and compare total and resident memory consumption by client
>>>*
>>>@@ -39,11 +48,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
>>>
>>>#define BO_SIZE (65536)
>>>
>>>+/* flag masks */
>>>+#define TEST_BUSY		(1 << 0)
>>>+#define TEST_TRAILING_IDLE	(1 << 1)
>>>+#define TEST_ISOLATION		(1 << 2)
>>
>>shoud we document the mapping to the subtests?
>
>If you mean something like what the xe_exec_basic (below) is doing, 
>then I can try that.
>
>{ "basic", 0 },
>{ "basic-defer-mmap", DEFER_ALLOC },
>{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
>
>>
>>>+
>>>struct pceu_cycles {
>>>	uint64_t cycles;
>>>	uint64_t total_cycles;
>>>};
>>>
>>>+const unsigned long batch_duration_ns = 500e6;
>>
>>please use * NSEC_PER_SEC
>>
>>>+
>>>static const char *engine_map[] = {
>>>	"rcs",
>>>	"bcs",
>>>@@ -76,6 +92,27 @@ static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>>>		pceu[class].total_cycles = info.total_cycles[class];
>>>	}
>>>}
>>>+
>>>+/*
>>>+ * Helper for cases where we assert on time spent sleeping (directly or
>>>+ * indirectly), so make it more robust by ensuring the system sleep time
>>>+ * is within test tolerance to start with.
>>>+ */
>>>+static unsigned int measured_usleep(unsigned int usec)
>>>+{
>>>+	struct timespec ts = { };
>>>+	unsigned int slept;
>>>+
>>>+	slept = igt_nsec_elapsed(&ts);
>>>+	igt_assert(slept == 0);
>>>+	do {
>>>+		usleep(usec - slept);
>>
>>mismatch between usec and nsec here in the first sleep. I guess it's
>>easier to convert the arg to nsec and then always have the same unit
>>
>>>+		slept = igt_nsec_elapsed(&ts) / 1000;
>>
>>NSEC_PER_USEC
>>
>>>+	} while (slept < usec);
>>>+
>>>+	return igt_nsec_elapsed(&ts);
>>
>>wrong unit? you receive usec as arg and are supposed to return usec, but
>>rather return nsec.
>
>Hmm, there is a lot of unit mismatch in this helper. I think I will 
>just convert everything here to nsec.
>
>>
>>Also, I'm not sure why exactly this is needed. usleep() from the C
>>library already guarantees it's going to sleep for *at least* the
>>specified amount.
>>
>>usleep(3):
>>...
>>DESCRIPTION
>>      The usleep() function suspends execution of the calling thread
>>      for (at least) usec microseconds.  The sleep may be lengthened
>>      slightly by any system activity or by the time spent processing
>>      the call or by the granularity of system timers.
>>
>>RETURN VALUE
>>      The usleep() function returns 0 on success.  On error, -1 is
>>      returned, with errno set to indicate the error.
>>
>
>I think the requirement is to know how long the delay actually was  
>because the "sleep may be lengthened". All utilization/counter 
>comparisons will be against the actual delay.

Looks like I am not using the returned value from measured_usleep 
anyways, so will drop this helper.

Umesh

>
>>
>>>+}
>>>+
>>>/* Subtests */
>>>static void test_active(int fd, struct drm_xe_engine *engine)
>>>{
>>>@@ -451,6 +488,66 @@ xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
>>>	free(ctx);
>>>}
>>>
>>>+static void
>>>+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>>+	      int class, int width, unsigned int flags)
>>>+{
>>>+	double percent;
>>>+
>>>+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
>>>+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
>>>+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
>>>+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
>>>+
>>>+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
>>>+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
>>>+
>>>+	/* for parallel engines scale the busyness with width */
>>
>>s/parallel engines/parallel submission/ ?
>
>will change
>>
>>>+	percent = percent / width;
>>>+
>>>+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>>>+
>>>+	if (flags & TEST_BUSY)
>>>+		igt_assert(percent >= 95 && percent <= 105);
>>
>>percent should never be > 100.
>
>Yikes... that's a miss. I did see a couple >=100 though!! and modified 
>this to check how far it goes above 100, but completely forgot to 
>debug the issue itself. Will debug.
>
>>Also, for >= 95 to be true this needs to
>>be the only client.  Should we check for number of clients and skip if
>>we find others?
>
>Didn't think of that. Wondering if there is a way to enforce a single 
>client somehow in the test. If not, then I agree to skip if more 
>clients are present. Any idea how to check if there are other clients?
>
>>
>>>+	else
>>>+		igt_assert(!percent);
>>>+}
>>>+
>>>+static void
>>>+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
>>>+       unsigned int flags)
>>>+{
>>>+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>>+	struct xe_spin_ctx *ctx = NULL;
>>>+	int local_fd = fd;
>>>+	uint32_t vm;
>>>+
>>>+	if (flags & TEST_ISOLATION)
>>>+		local_fd = drm_reopen_driver(fd);
>>
>>so you have 2 clients in the same process... Maybe add this info to the
>>subtest description above.
>
>sure
>
>>
>>>+
>>>+	vm = xe_vm_create(local_fd, 0, 0);
>>>+	if (flags & TEST_BUSY) {
>>>+		ctx = xe_spin_ctx_init(local_fd, hwe, vm, width, count);
>>>+		xe_spin_sync_start(local_fd, ctx);
>>>+	}
>>>+
>>>+	read_engine_cycles(local_fd, pceu1);
>>>+	measured_usleep(batch_duration_ns / 1000);
>>>+	if (flags & TEST_TRAILING_IDLE)
>>>+		xe_spin_sync_end(local_fd, ctx);
>>>+	read_engine_cycles(local_fd, pceu2);
>>>+
>>>+	check_results(pceu1, pceu2, hwe->engine_class, width, flags);
>>>+
>>>+	xe_spin_sync_end(local_fd, ctx);
>>>+	xe_spin_ctx_destroy(local_fd, ctx);
>>>+	xe_vm_destroy(local_fd, vm);
>>>+
>>>+	if (flags & TEST_ISOLATION)
>>>+		close(local_fd);
>>
>>humn... it doesn't seem this is actually testing any isolation? It's
>>just reopening the fd and testing the same thing on the duplicated fd.
>>
>>what I'd expect of an isolation test is, e.g.:
>>
>>/proc/X/fdinfo/Y
>>	drm-client: A
>>	drm-rcs-cycles: 0
>>
>>when executing on another fd:
>>
>>/proc/X/fdinfo/Z
>>	drm-client: B
>>	drm-rcs-cyles: 10
>>
>>
>>so, check that read_engine_cycles() returns !0 for fd where you
>>submitted the spin and 0 for where you didn't.
>
>will do
>
>Thanks,
>Umesh
>>
>>Lucas De Marchi
>>
>>>+}
>>>+
>>>igt_main
>>>{
>>>	struct drm_xe_engine_class_instance *hwe;
>>>@@ -485,6 +582,18 @@ igt_main
>>>	igt_subtest("basic")
>>>		basic(xe, num_classes);
>>>
>>>+	igt_subtest("drm-idle")
>>>+		xe_for_each_engine(xe, hwe)
>>>+			single(xe, hwe, 1, 1, 0);
>>>+
>>>+	igt_subtest("drm-busy-idle")
>>>+		xe_for_each_engine(xe, hwe)
>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
>>>+
>>>+	igt_subtest("drm-busy-idle-isolation")
>>>+		xe_for_each_engine(xe, hwe)
>>>+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
>>>+
>>>	igt_describe("Create and compare total and resident memory consumption by client");
>>>	igt_subtest("drm-total-resident")
>>>		test_total_resident(xe);
>>>-- 
>>>2.34.1
>>>
