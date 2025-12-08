Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F268AD3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 13:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A840310E455;
	Mon,  8 Dec 2025 13:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwGCh0ud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C52410E474
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765201848; x=1796737848;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0V856h/RGqnXqJkAT05jyRMJAtk6y2h8qbkuaqmn44A=;
 b=iwGCh0udqAa/qXSvggNCYN5omvF+ZfLeWEcUgm4X9Ux3IByEGPuunguu
 eMHYhSNqHW6ehc3XfHrfCNl4WdRyhQ9VIMHmZ1ijIj0prK7gRLdi+zbUB
 27S+OwaIcbzX/982882aCcn6hX3eSFu8CMp8TJZ2dNeeskIu0TOf6jANs
 MpZJJtbi6BHuq1TqlZcySlyw4b4No0rJB08bb3Pw9eoJZpnbc0JUYGklH
 AA3yaGVAkByKh1R/m2Ltxm9cEt/HFP/izYqsNyN5UCB1e/B2vJ3Je/Fqy
 t8haMSom3Enws2wPNfMQ0rbUE2lc8GU60KWEhKLTUJerqrVJq+/54HfV+ A==;
X-CSE-ConnectionGUID: F8V8UQHYQ7KEosSWdKKodQ==
X-CSE-MsgGUID: zV3xv1XwTo+KV8+GKffTHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66864483"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="66864483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:50:48 -0800
X-CSE-ConnectionGUID: sEzZBo2sRhCdiQRvC0DUUQ==
X-CSE-MsgGUID: fnH/I7h/S2C2vYKaBf01ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="196402467"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:50:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:50:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 05:50:45 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:50:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7ShuzPNYy8G18DFrsYiFUfo2IN9J9MVB/dtT1vAF7ujN0lFnBA7u1oW2gWqVl6OrnlA0+daqbl/il+Onz9sUCJXPAQUU/wPe7lciwijAYNWSEBtLWtfUQv2ZW4smXyB/ZnqUYzoRz1m7EkKqaQAKi+mpzp9FLpo/O+bc4FjHNQNpMtHmb7G2aV2HI8pUzg95YdK7fCP6FsdJjwqicK1fWPqSE+cEiQTQrS+9xV6uu7T9kUT3BgC4NRPqcP5hjXQVJlSp6Jn5FoL4ym63bA6wPjj+NX5RdLkn3QEOVkNDv/epn2scTi2wfim7gTntadSmMlAfJNIC3fJVHoNLPME+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkMfGe3KeiQsqAfYuKzGkmX4vrxtEQvGMnKfbXyVRYo=;
 b=S8n+1RHaIsGDf8zkeayzOCxh5/Kh+TrKfguzpYQl37DpRBPxzwCCW/B2OKakD3m2+RwMkfdY++uGuvM553Uc4al6BqUTawfgp/s/CincMctcDW0Mc2g7XbHd5U5MbhUrCAXWs0PvuwBeFeGGmP4aZQJGuOSRUAsGNxKfDddYHbgttwYPaKM7wJfAvSmP6N7zsqX23IchxsjpR1pE5jetXRA2XpCtLVdWkpRdPHLfHTcOx4KHI4ciYIDvBF4LdiQ//mKEs3RcbKDTgxIUJSUdK21QcGLJ18GiGtbbjwBnFwZenrI6db8xpUXYSq/XTcdVOhmhQpiVoZ3Cy5atpG5dTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS4PPFA08475C7D.namprd11.prod.outlook.com (2603:10b6:f:fc02::3f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:50:42 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:50:42 +0000
Message-ID: <a684a11a-e724-4a99-83fd-903d6e74d917@intel.com>
Date: Mon, 8 Dec 2025 19:20:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 07/13] tests/kms_color: Add helper to check if
 pipeline contains only CTM colorop
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <alex.hung@amd.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
 <20251205195312.1234330-8-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251205195312.1234330-8-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::16) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS4PPFA08475C7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d5437b-3144-4a7e-8859-08de3660c77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0NsWDI0NTZqM1Q2eG5WaDRpOVE4cUlVUUxoMEx4cUMxN2xyZkJaMHlkYThI?=
 =?utf-8?B?Zi8zS1psckpBbWxaR0pYNW1qU3lMY2RPdEFxa1dPOWs0VmNnc0dvbEIyNlZ0?=
 =?utf-8?B?RnhTK0F5dGVDaEFKcHBVOEw0VjJWdm1zYVY5RHA1clBwOFN3Z0NrcTdjTDFh?=
 =?utf-8?B?R0xnMHhqYmNpMUFWZHE1VTBNbE5qTnFwaDdTa1VXK3VETUk1VlBwL0RaRXJj?=
 =?utf-8?B?TGc5Tk5WaHovV09LYzJYa2xndzdjZ0ZpM1dsK2Zhd2dQVHdPbzBHYmNJMEFs?=
 =?utf-8?B?bzh1bU12MCtNVXZ5MXR5dzdBOTM0TnFJOEFmVE9aTXAyNXdQL3pmdzV4Q1pE?=
 =?utf-8?B?ZGgxYTA4aFdUV2pCalI2dTE1YjNLMFp4b0pOanI4SFR5OXhRZHI0TEVDY1JU?=
 =?utf-8?B?R1hMakxsbUc4OUt6RlBXdWNrRGNKLzhzZGlEZWR1Q2dGaWM0OVlONDc2WHdh?=
 =?utf-8?B?NW9rTi9UVWVsQThnZ0tLSmhIOEFrc0U4Qit5T1MxYlpBNmllUHNhcFVFYmdP?=
 =?utf-8?B?ZCtqdmpkNHFEYjBDeS90WnFCdE02TWY4b0dPQVFxWUU1VzVuMUx0cUhUY3p2?=
 =?utf-8?B?SVJOazdSVXVia2w3SXl5VDVvOHNDQ05NbStSbTRMMVlsblo5TnFJeTNsdG5N?=
 =?utf-8?B?TER3d3h6V1hVdU5qS2RHZnljV05qUnB2UVlEcTFPZS9JQTNpamFqWEhZYXZy?=
 =?utf-8?B?Z0Nia04vU3htTmZ2WERCZUlaQW9FWktLVDJWTSszV2dTMlpxUzg5cnNSR1gy?=
 =?utf-8?B?N3BiVTFPU1UxT09PQ0JEYmY1eUR2N202WDVtS3A0VEtyQ3o1UmdaRCs3SUVE?=
 =?utf-8?B?bnl0RVdHNjZyNVVvazU1MlpLeFduTVV1WHFmMHJ1UlhIcVNCb053RnIzNE9C?=
 =?utf-8?B?Qjg1eVNlT1VWZlcwaDlrblpsYmVHdmlLbTQ0blBkNEVxbWpjS0UyNE1SQ3J2?=
 =?utf-8?B?NFRkNEtLNU5yK29CVGQxOUZVWDRKcmo4Y0RZdFI2ZDlKQk9wYUxlajNqeVU0?=
 =?utf-8?B?VUI0UERqd1J0K1dzcEY2RDlvM2VQWE9PNU9wdGJMelZ2Zm9CbjMzYnFDV3Er?=
 =?utf-8?B?eEFYYXFBcVEybUE3cEZza2lFK0ZVcmlpOVFIMXJWa0V0RFcrcFcwOXVYMkdD?=
 =?utf-8?B?UE5BRTlkdTI0emlhdldIekFSYW1Rd1o3c2J4TGF4eEdPUlZmV2lhanFERCs0?=
 =?utf-8?B?N1hkWFdyOFVUVTNTT09Tano1V05FYXROUS9ua1dGbHZKOXY4d3pEVHpHWEJh?=
 =?utf-8?B?SnBEMHZGbEx5RVRMQjBBb1Q1ZFB1czdRNFJBQTFsS2NucitXRGxmdlk0VUk3?=
 =?utf-8?B?Z2xpNzd0bG9zR3ZSZEdiNXZsZmZHbUtiRWRWTVFwcithVm5TZ2w2cjdlOUpZ?=
 =?utf-8?B?NjkrQ1NOOWNMSllaSVR5WG1sU0J6OWp4QjN3eG40aVI4MThBUG5nMGwwbUth?=
 =?utf-8?B?SGRlTVJRQUx5YVp1a3I4c0pvVFA0TWFqNEg0UjFWZnZKYXNmbVNxUkZNdmFx?=
 =?utf-8?B?ckFqZWlLMysvL21LUjI1cXBMZ3J4a3VQYWIrOUdvNUNJaWJkdmV2czk1eE5q?=
 =?utf-8?B?c1plcUdTTDFYUTdRR09DaWtRU25NNit2aVJpcmJtQ2ZmM1RiRGIxWkZrb1pn?=
 =?utf-8?B?cWFkZlJsVWJSeGFRYi9JNzF4a0ZHeENMUW9oN0tYWkVLb1R6akJObDZDazJS?=
 =?utf-8?B?Y0JiNFJXdFN1bDFSK3RxZllVWUJqcGp5MHRVSWtZSkM3Y2hoSzJTMkU4cFE3?=
 =?utf-8?B?bnV3VUdGWmNDU0NObDU4MEphUDVaa29IbDF0TlBKK1VPUlh6OWpKMXE1OUFW?=
 =?utf-8?B?eHJEOHFVcGxsNHF6aG9mdEsycm5SV0V1eHZBby9meUkzMTBsdy81OUkwRHN1?=
 =?utf-8?B?KzFPcm5DT281VWVLdkN5VldHOWF1WjFGeVdOSFVWZ1FBZUtsU0lYMU1EV0lX?=
 =?utf-8?Q?K17BTZbCqlbWXNAHI1Ulrqf3ELmn1rjS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzlvRWdGQ3NFZlJ6WDY5eGtFL2M1WWFML3NiQlUwUmJtOXhGN0lmV285YXBR?=
 =?utf-8?B?VUQ4ZUhwamxRKzl1SDFkZmR6R1VTb2JjVG9oL0k4N1R0ek0yanFoZzY1MXBZ?=
 =?utf-8?B?WERiUXVJQ1pSdXRIRzlnakJzR25VRGZJQ3BmQWZhaDhvZkdVbm54MjB3d0d2?=
 =?utf-8?B?MnJNUWxqQ1FYS3M0ZFA5S2RJQzdzYmhwTlNjTGs1eERkSHJqNTJ5OVNuYllO?=
 =?utf-8?B?SjcycThpS0oxRFFILys2SFBBazYreXkwR2ZGUmt1Q0ZyckRXTVhLT0NySHB3?=
 =?utf-8?B?VGpIR2psQ0xRaE9GRThaVEdPQlhuQUxJcmpYQjhVSGtUa1FZV0pTOFNpRzVi?=
 =?utf-8?B?TUtKQXhEMEtDbFlIdXlGQStsbnRraS9SN1pYcWdpSWZpR2t3bDE2em95U2hh?=
 =?utf-8?B?MVVUYVp3b01iQk5vQkY1TkFzZ3RTcTEwc2xXeDJSQkQ3VVg2dW9KTEQvcUFh?=
 =?utf-8?B?ZFozb0F1SVh4dElUSEZvbUpPeGhzaTM4eEc2dEZhQk41WU4venVIVXBkOWIr?=
 =?utf-8?B?Yy9Ob3p2QnFhUzh2ZG5yOXpnOUdwRlJKbEI5aWJ2TytMWVNlWWFINHJuQy8x?=
 =?utf-8?B?c2M5T3lRbklpcWY4NjdvZWNybk1FaVBzSVBOR3V5aEYrNmVqS0t2V043OS9v?=
 =?utf-8?B?SXRMVjFLc3VDWk92N2dTMUViQTJ6NW9LZ0hSbThoZlhzU1ZFaFg0WW9GRTMy?=
 =?utf-8?B?ZjBOalgwakcvSU5nSGVJVnZGZXh1RGNENzc0cnlRZ3BYd2RUUG95ZXVrR0pC?=
 =?utf-8?B?TnQ4bENPZTB4UEdGTStOY2FLWTJXVjU5SEVKR3dtazgrYnhWQTQvZ1Q1L29B?=
 =?utf-8?B?aURhOHUzdTh2eEJDMy8vRjBaejU5VEw0cmFUVmtDcy9IcjRPN2VqWFhZNjlC?=
 =?utf-8?B?QkRoV2MyQXFhMlNoM1VYWUlTTmYweElRV2FaeENYSXpidS9KRkRPcUhlay9u?=
 =?utf-8?B?eUpUZVA1M1Z5TVRNWGpzYjJtRlhEUm5HVUcvMCtIYithWXZLbEk1VkllVXQz?=
 =?utf-8?B?bG5JaGxtRCtoZ3Y2NnFQZXZhTmxmRDVHVkhSV2ZJa0ZrVUhwUDQ3aVdVSnRO?=
 =?utf-8?B?cmNzUlUzb2F4WFlFazVxNEhtRDFRRXpDZ281OUpaV3UrZVU4MkhxT0dkd3FM?=
 =?utf-8?B?TW9GNC9OYUdaNmlqNVhoZEx3RDdidHBZa0QvaDNsdCtRY3c1YmxPMDFib1Zj?=
 =?utf-8?B?MHdLQURGay9TaXdjU2ZpcXExdlVkeVlOSjlpRmt1dWJGUmhCRWNERVozclUr?=
 =?utf-8?B?RlNrZ0ZNUE8rUHdzUlk4VUFxMHE1a1crZndmZUxXdDVRL0ZLRXVlOFNEQlNN?=
 =?utf-8?B?SWdsTE8xVUFPR1BXejI4bFdyV01uQzl6QzlDRDA3RzJqQ3dnYWRYZG5TbE5n?=
 =?utf-8?B?NWwvSDJUa21MbHN2YkxhOFZDRGlvNWRDdnpqazBiMXZMeVNPVTlKa3VLTWVF?=
 =?utf-8?B?OEtsVjlBa2s1VWkzd21lMzhEK24wWU5WbG00NHpTaU1pdjF5NU12eHpWYWVF?=
 =?utf-8?B?MWpmY3hRTjdQY1JFWU5sMnQ5NTJ5VlFDSnBiUzcwOVVudk0wSHp6aFBOUXFZ?=
 =?utf-8?B?bUhRRFd2QTE4V2w4WVVoMDE0R1ZWY2tpdVpVL0RCRTZCRFNncm5FbUJtTVZZ?=
 =?utf-8?B?bmhQRUNyd091cWpOR3B2bTBZN04vZFc0NDVRUlpRSEtQY0wyUTkrN3pXcGZz?=
 =?utf-8?B?U1FEVGI5MU9peTRMVmZHM3NmdUs0OFVZZFV1N08rOERaOURNNEliYjQzbjJj?=
 =?utf-8?B?Vk01UGJiNVl4YlZaQU1ucFl4UDNJU1FjZkVxWnNQSUdBVmJJNElEbnJXVWpX?=
 =?utf-8?B?VDBERGttaXFyY0dnU2IzY0kybFlzUE01YXBvVmpJWnJIYTJXODZkMFpGekRB?=
 =?utf-8?B?eTVpTXNuRzU3VEJtVWJNdXBVZUZhWUI0SWliNURBS3hOYnU3THlZeUFxU2Fv?=
 =?utf-8?B?Znl4eElwMGV4NlRUMUx6ZnIzbUJsbTdQRWk5a0d2SlRRaUcrc2xZYUZLeGhY?=
 =?utf-8?B?eCt4VEUzeTc0b2x1TzBpY2pmSlFJWUlCTTBROEl1cmN5MzNFSzFjUnlkN3Zq?=
 =?utf-8?B?a0ZGQ01nd0pITFZXdVgwTTE0R3ZXS2V4OGl1dzdyM3c3UmR4NlpXVHJ5b2lY?=
 =?utf-8?B?ZVhxWHN1bE9vWnEwYk5HU2h4cldPMkh2QzlyTXEyMUxYZHBQbTZISUUzclZs?=
 =?utf-8?Q?hUcOh8uYcXpTLhHSobZ1kuQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d5437b-3144-4a7e-8859-08de3660c77a
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:50:42.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2dMkXDTvcYaIdkjdgGyMpGvNqdIqP+taMv3zWNP2GbQDKrNZ+qZ0XCIA36Y9t4wwZkSd+CB9UKEEuaFTAzMpMqj1bidNUc5yCWpLpNuHJn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA08475C7D
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



On 12/6/2025 1:23 AM, Swati Sharma wrote:
> Add ctm_colorop_only() to determine if colorop in pipeline is
> of type KMS_COLOROP_CTM_3X4.
> 
> __maybe_unused prevents compiler warnings when the helper
> is not referenced, while keeping it available for future use in
> color pipeline validation.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_color.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index f8d74a92c..7c113de85 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -773,6 +773,17 @@ static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
>   	}
>   }
>   
> +__maybe_unused
> +static bool ctm_colorop_only(kms_colorop_t *colorops[])
> +{
> +	int i;
> +
> +	for (i = 0; colorops[i]; i++)
> +		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
> +			return false;
> +	return true;
> +}
> +

Please add how/why we plan to use this function in the commit message.

With that, LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


>   static void
>   prep_pipe(data_t *data, enum pipe p)
>   {

