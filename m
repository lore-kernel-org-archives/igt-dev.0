Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352EFCED266
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 04:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC73F10E04F;
	Tue,  8 Oct 2024 04:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OvCnvzCR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9464610E04F
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 04:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728362892; x=1759898892;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LEeE193Hq9hKXPjCX2yuSije7x1VRViQ0w4x5XBV8qo=;
 b=OvCnvzCR8yGWuRFhsWs7VcHn05nOEe/wOMm4hdM3z6oizwUfyER4Nb5s
 wn+RbpiMJSHktDZi2UMx1qgz3qJmELXcF4WwSlL7N0YNOuBiA0L1+zZfO
 E071Oi5YQmz/i1F4rNsgJFi1LfOJjB3LwU55fvosf842SrBn4DGNqmFlN
 xv1s/sr5ixgXZnYDyF3PxXmalqvvG7QwvbB6rbHV5lJ+7Aj/QOqB9hlFT
 1PcudSUE+T43fAuEit5dCKXKb1j/YV/cWlrbcLusCFtXzKgPwkL1uno8a
 zMOE5Y87othzKtUD6eZAxSix6MjSViUIvXrR9fTW9O6qSNY5OE5gbfO75 w==;
X-CSE-ConnectionGUID: G6a0lKXDTTCweHc1YYHqrA==
X-CSE-MsgGUID: gihSY75BToa7nfqMq1zqrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38925536"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38925536"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 21:48:12 -0700
X-CSE-ConnectionGUID: rcDOITSlSnGqVd5frIMR1A==
X-CSE-MsgGUID: WEWsitnfTSGFNtaH964TUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="75809303"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 21:48:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 21:48:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 21:48:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 21:48:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 21:47:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIKCxZLJI1dfwZJ50nkjfrnS+S28/WoCh+v3X/9m2deyRtUx8L6xoRFHmw4yEE2lOrNZMr1IvOqt2aPHIwS6y73eH7jOki6Zx73thlJW0Fmbd+fb26lWcGCDwLfX+9ytabRG7fWl9DPRGtPMyuZ329RDTbe28tU+oLRuScWiCokUsA7WmNVxEAL0DWyCHpjT1ubrgaKp3Fr1BlnDyI6mD538epHIv7sStEqDt+/+necFYpFjFzzyZYBABbraHrREj7cA1GGx/fzSekZpJVVG8v0UDPgSUAgX/SLUxqmsZIMVFD5nl+HxW13gBukVDfbs5ZojHmZxv+CPtxYgB98p9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyW/Afugr7T9XYAmrhZslAx0yGjLfA5MnOK7TjvfYAM=;
 b=ml4bBkRdJS0ubxYgX1p8XlYdr81JPAbxmFTR//y8RtfruzidHvU62CikuvUOzoFB6TYknWc8m9D40OqF3Rc0NRGAKKlKmOc0oiFfagDl7t0zhKMpBq44eY2FSIi5+upbNYcOWsbWcapk0oCWIqcrPXz1YzP46fPf8fAkUqk+03cY9IHgarIbEYOn51WYnaWnwk7I27pJIu4akDtuYqjAgvS2oH0tw5SPnqbmv7x0xrdgYXJrcnruTdjiJbmubImTovpK5OCCp8p9C+JyP8QC1IGP2PUizzh3Tpjvi2HFBZ4JWV43ghBq1xB0LlS91zCsyTGmWrLEziK3AUDAtOWWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Tue, 8 Oct 2024 04:47:51 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 04:47:51 +0000
Message-ID: <34395871-0f43-4ffd-8a1b-a077994dfcee@intel.com>
Date: Tue, 8 Oct 2024 10:17:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
Content-Language: en-GB
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <CY5PR11MB62119CD942646EABA7CA5D91957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <cc7c6fab-6310-438d-90aa-d7509f06192f@intel.com>
 <CY5PR11MB6211966D197F77629AC4C209957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <5f774c6f-e9bd-4c71-9606-bd2ff0117873@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <5f774c6f-e9bd-4c71-9606-bd2ff0117873@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ee904c-ba62-4ce1-1078-08dce7545d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVRodGQvcVB6cjlrYlRRRDhVTytOWmRxSlpYNEM2RDN3SDhuc3p4V2pKc1N4?=
 =?utf-8?B?emlnU0xlNWVJT3VVdlB6cVozTnBoM1pOSnAxZ1pNd2tLWkZJOE55WmFjNzNL?=
 =?utf-8?B?UGhoc2QzTHljRGUzR2kxWTZrcGU5TUdhbTEyczFmd0xIYVBDNXFVd3lkeTk3?=
 =?utf-8?B?YUZBaWJJajdjUHAwZGpWTC9icnRrR0VzWlJGdnZnQUhtUml2bkZWT1pQL04x?=
 =?utf-8?B?YnFYNU5mT0x6VHRtQmNGenJKQ09UUEdIU013ZE43OUF0SlZUMXZwM2p5aCtP?=
 =?utf-8?B?aXdQOUx2Rm56dW4zWG4xYzIxVGt4S3c0Yzd0NDRKL1lzSXNaNUl6ZXEvNmtT?=
 =?utf-8?B?OXoxTzBCZUpwZ3NRendLQldzYW1rcDh5VHBuQzlST2VEN2JhTUt2ZHBSckZt?=
 =?utf-8?B?eWVVbDFIQ3hWWkFPN0dSaWdsN09DVEcyM3BOMFhGN1F0S1NPSFBaY1JFTFM5?=
 =?utf-8?B?RWhHdDZSRTdTaG14ejcxaGJpcFZKRzZDeTJHaWptU3YzY0ZodUc5T0Z3bzBN?=
 =?utf-8?B?azNGQkRJUzNHTm9YQ0NSaFN0dzdnZjV1ekNBMm55UGZSOW80N2cwblhHbkZR?=
 =?utf-8?B?ME1FaXNjMURVSm10WUNodlJCaDBXYUt6TGdRTXFRMGpvVkJ4Yloxa04rNjcw?=
 =?utf-8?B?a1NjMWs1NVBWRGZMUXViamhvdldHeDJQSDhXZlhodC9HS3loa2xHNTN2MXlC?=
 =?utf-8?B?eUJob3dnUEIvbkpBc01zZWhCMitDNkgyeGlGeHdPRnIrNU93WUVEWkxHUDNx?=
 =?utf-8?B?RWRvZml5OXIyZk9kZVRKMlBTRzR4U1pkRlUyVG85bnk0c1V6WlRzelYwZWsw?=
 =?utf-8?B?QkkxTDROV0xMN2I2RTB5R0Q3SDZVS0V6ZHYwZ2IrK1FTQ0llZTJwM05xQ1Bh?=
 =?utf-8?B?R3ZuMnA0RzdDdURSUUJXUzQ4ZFhJcDhQNFBsc0QwemFNdXcyNTRqNkdjRTJB?=
 =?utf-8?B?YWZQYkx5am01OTAybVVkdXNRQVlIUWJ1V2U3czNmL3pMK0JRSWhQS3BtK29U?=
 =?utf-8?B?bnMvQnpBdzNXNGZFY0tmN01YV1hFUzVZclNoSUxZWC9qMWVZZVBrTlA4RllS?=
 =?utf-8?B?NThNakRtVUpxM1dFdCt2YkdjMHRyOGpXUitQZzNNWlVtcGJkNFNJNlQxZ1Jr?=
 =?utf-8?B?MVYwQ0J4TUNSSlpRd1NjdnpVMTBOdHhhck1NbUVBZWtnSFp6djBDQ1VuODM1?=
 =?utf-8?B?SVlCbndWVHk3Mys5ekRsLzRuQ2NSbWtVUTRzc0hDMkgrbU5jVFlkR0IyUUty?=
 =?utf-8?B?Vm9Rc3htYWhZaFJqdFJRNnl3bWVvRk5qSncwM29CZVljUlpWWkg3SlJTbysx?=
 =?utf-8?B?YVp2TkZRbk5UaGRFZzgyUHlPa2VnaThNY2MzOURqeUFlVVB1Y0xrZ1BKWDBU?=
 =?utf-8?B?UzVGblY4ajl5eUY1TGNkUG9ZaTFVZXljVG8veEtOVWNwdm8wSDRpQ0txekJM?=
 =?utf-8?B?SUtOL0htb0N1c1BOZ3haL2VTS2VGMFNHQWUzMXhuNkdJQWRSWWhNNTRjSGov?=
 =?utf-8?B?TzJiSlpmd3FmQWFHUHE5ODZEeXp3OW4ySGo4ZzZhQVI0NlNncER4azBXRFRC?=
 =?utf-8?B?THo0T0R4M3B6RE9wd3VhMTQxakZLQU4yVUJ6V0FhbEpJSmFmQkpuaGV6VEFT?=
 =?utf-8?Q?f0IhwZpgSCZinQ5Htox3XRyrZb4z5EFBWn6ER1blXJ9w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWlHTWRWTUZGc0JGL2pUeE8reW5zbWI3U3FtOHlSVkVWRlVLVmV6RWRjTS9m?=
 =?utf-8?B?YXVWSWh6MXg1bWhqdEV3YzRCb3VxVjY0ejNhdG11dWVYU0U3QnFpd0NrbjRx?=
 =?utf-8?B?TksydElKUndoUmJyOHRTN2pvK3ordGNESUFrVDJVRlpIeERVT2d1UDA3VEJ4?=
 =?utf-8?B?R2ZTYzU5RENIbkVERkliQWRxZ010ajJkUTlPZk03MS8vTEdLdmZPbVlSR1ox?=
 =?utf-8?B?bHA0b0FQcXlxeUJRdHVyMWFGcG8vMUNiNHJ4NkN6TUJ4WmRUbk9ZekFkcU5y?=
 =?utf-8?B?R0hsRmora3dmQ2g4NDNncktWejVpY2htNGFaWWN3dHNIckUrcy9jYURPbFph?=
 =?utf-8?B?VFJvUDFEVE5iV1hqNXJhUzFzUUkyYmlnMkJxVFc4NjRhRE1Ma2pVU0NaUWtQ?=
 =?utf-8?B?cFRvelFkZkZLRTRiMGdaV250MnZXSHUrM1lwYXg2SkJDdjBUNXEvVGVOc3hK?=
 =?utf-8?B?ajV1OVF5Y3N4alIvbTV3MUx6M0VGb0hrMUovQUltc25oUzFmZmk4RDRLUlFV?=
 =?utf-8?B?UUtlajFXWEVWUS90dFJORlA2UDFyUjg0b202R0VzTzVnaEJzSTYzaGZOUXZS?=
 =?utf-8?B?WG1TaFVnbkI4YkpPWm1HR3dCUXhTMWd6T0JyWjJFT2srWjUzN3JLdTVwUzZy?=
 =?utf-8?B?TUMxQWpkdUtFbyt5QTRNcjBkRWxsY2R3TjNvUmh1L0ZabmkwVXlGVEpaWjBP?=
 =?utf-8?B?N3BHaVl4emJqZmpXcDBCcVdRMFdQa3JWTXdhWFhUaElRaVRqKzhEYlBnR0Ru?=
 =?utf-8?B?TktkWmFuVjR4V01FL3B5aEZxSytuelZwYUFFMk5CRGtzZ0NiNHFBQktnZ3lw?=
 =?utf-8?B?aHh6QTdxd3NlUjhmcHlrdDM5b3krL3I0UFZMVkptQ2o2NWxBd09MejcxaElZ?=
 =?utf-8?B?THhidWl4YkY0ejM2NVAybmFuRG9LTnFYdWljNEFMUWYzQmpXT1hwc3FhR2xn?=
 =?utf-8?B?S0pkU0MySmNwZ01BSFI4WTZkZ0RiNVQ4UTdnSk81VVdkVTByb3FhVTd2M2hV?=
 =?utf-8?B?OGMxeFoweTAyVEJkK0JhWWJJMG85aTQrRWlxbU92M29vMXIzSldOQmUvb0gz?=
 =?utf-8?B?M0V0VlZkbGlqZGFmNnJYMHdIS3ZTM2dzcmN0R1RpTXNtTW00SEcxN082dUx0?=
 =?utf-8?B?dlhpWEpLVXZ0L2xVaHlUS3htdUtUTndjVnVNV3U3OTRiSTdpTkxNS1NWOWZD?=
 =?utf-8?B?c0RTRkp2RGUvcVg4VXRNUEhkUDJQRWlBV29rVUM0MkVPM1plVCtwQ0Y4VFhs?=
 =?utf-8?B?NEVtVVRxVlBGc2N5Q1VHeWV2NnVQejBJQ2xGS2lmY09OSm1WWXR1d3F1RHZ3?=
 =?utf-8?B?K3Y4TDRTOWxVMndLV2xRWkZVNE9TUmxXUnhraEJZcS9zMmRMKzFRR2JsdVE0?=
 =?utf-8?B?NGZEU1FyaUpqUHNUdlZwVHR3b0dYUXRFZXJKazJHQWl6OFR2UTlIZVhOL1VZ?=
 =?utf-8?B?aUZ4dUYrcnYzcUZkUkZVSGU0NUhuck0wRXJCYjE2NnlUZUJZclh0bk54QjB2?=
 =?utf-8?B?S2JVczRQcE1NM0FEVStDSElvb2llZ09OMnpQckpBL1ErSVhRTjZSc0VFZUxK?=
 =?utf-8?B?bzdFRlJ1Q1VZcmFidG5GcUtuNXM5UllxMEZZSCszUzhvTFdTcHE2UlUxVFZh?=
 =?utf-8?B?R3A5SldSZzlUWEM4K1hvRGFpN254c2N4dGsyVU10MitmUXY0bDlxbDNJWnFT?=
 =?utf-8?B?Uks3VzlId3cyMmpFVjdsUUV2MnpOUmpPRlBOUUYvYnpiVlN0R1FJOXA4WE9H?=
 =?utf-8?B?bXQzT3l5VG5UaytEaHA4MjNJV01SKzNkOXg0TlE5and4THZNeFlnZmNhblBU?=
 =?utf-8?B?R1lrL0w5eGJySGJKSG5ZME5uNWo3cVUxLzRrRXVSRmg2b0lvaXpzM3k0ek12?=
 =?utf-8?B?RlRxOWNjaEt3YUFmRDkwS2xCTDVUcHkwN2RuV3Qyc3RXd2FIaEt2QVB4L3RR?=
 =?utf-8?B?NUlmSU9jcUlOMEZ5L3ROS0J1eHYrK2pDa1lBTEZQWmxzZlBVR2J3eW5KaHNt?=
 =?utf-8?B?bGZTcDhGTWRyaWdyalRsRlVpaUZTUkdGWUxlMnZRdCtIZzh0ejl6U3FSckEv?=
 =?utf-8?B?NWF4VEdvOG4zZlpXMHovcFhsbHBmNkFwT0JrYUhrdDRIOUVWeUViTENhNUFi?=
 =?utf-8?B?c2c4ZmlOQU9pTTd0a2lKWXQzU0svWm13N3laWG90NE5UL09CUGlJOTJwMERo?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ee904c-ba62-4ce1-1078-08dce7545d37
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 04:47:51.0089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAoknl6oBpjVjYAxZHVtwXqn0jkyLGTwvWnJYazsA4e8mS3oQLCZCBk0wqI7pYS1WJqPUAlaSJqNCvtKqz66Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
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


On 08-10-2024 09:17, Ghimiray, Himal Prasad wrote:
>
>
> On 08-10-2024 08:52, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>>> Sent: Tuesday, October 8, 2024 8:44 AM
>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; igt-
>>> dev@lists.freedesktop.org
>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Nilawar, Badal
>>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
>>> Karthik <karthik.poosa@intel.com>
>>> Subject: Re: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: 
>>> Add an
>>> assertion on MI_STORE execution time"
>>>
>>>
>>>
>>> On 08-10-2024 07:31, Gupta, Anshuman wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>>>>> Sent: Monday, October 7, 2024 10:54 PM
>>>>> To: igt-dev@lists.freedesktop.org
>>>>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
>>>>> Matthew <matthew.brost@intel.com>; Nilawar, Badal
>>>>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>;
>>>>> Gupta, Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
>>>>> <karthik.poosa@intel.com>
>>>>> Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add
>>>>> an assertion on MI_STORE execution time"
>>>>>
>>>>> The reported time does not reflect the completion time of
>>>>> MI_STORE_DWORD; instead, it accounts for the delay in the scheduler.
>>>>> Therefore, it represents the time taken between xe_exec and 
>>>>> syncobj_wait.
>>>>    igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>>>> elapsed = igt_nsec_elapsed(&tv); elapsed is taken right after the
>>>> syncobj_wait() therefore it represent the time taken by xe_exec +
>>> syncobj_wait, total time taken for completion of job.
>>>> Thanks,
>>>> Anshuman.
>>>
>>>
>>> That's true, while writing "time taken between xe_exec and 
>>> syncobj_wait"
>>> , I meant to convey in between start of xe_exec and syncobj_wait 
>>> completion.
>>> Will rephrase commit message before pushing.
>> Why do we want to remove assertion ? We don't want to write IGT to 
>> make CI happy it is to catch the bugs in KMD. Even in this case as 
>> well this is a bug from Linux Kernel.
>> I don't agree with removal of assertion.
>
> Few issues with this assertion.
>
> 1) IGT has --inactivity-timeout of 90 sec, which means you will not 
> hit this assertion ever and SIGQUIT will be called if time between 
> start of xe_exec and syncobj completion is ~0.9 sec.
>
> 2) Even 0.9 sec of delay is something huge for kernel. So why IGT 
> assumes anything less than 1.2 sec is safe. Isn't it just to make 99% 
> of idle time safe.
>
> This assertion solves no purpose, if IGT silently passes for anything 
> less than 1.2 sec, assume 1.1sec (Isn't it huge delay for wq submission).

This was added to assert on per-test timeout which can occur even 
without inactivity timeout.

See: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2484

You can reduce it to assert on inactivity also.

>
>
> BR
> Himal
>
>
>> Thanks,
>> Anshuman.
>>>
>>> Thanks for pointing this.
>>>
>>> Himal
>>>
>>>
>>>>>
>>>>> This reverts commit 92825ed72be61c5419d95db944fef1c9dda2215a.
>>>>>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>> Cc: Karthik Poosa <karthik.poosa@intel.com>
>>>>> Signed-off-by: Himal Prasad Ghimiray
>>>>> <himal.prasad.ghimiray@intel.com>
>>>>> ---
>>>>>    tests/intel/xe_pm_residency.c | 9 ---------
>>>>>    1 file changed, 9 deletions(-)
>>>>>
>>>>> diff --git a/tests/intel/xe_pm_residency.c
>>>>> b/tests/intel/xe_pm_residency.c index 772fe9b57..f4d05889c 100644
>>>>> --- a/tests/intel/xe_pm_residency.c
>>>>> +++ b/tests/intel/xe_pm_residency.c
>>>>> @@ -144,15 +144,6 @@ static void exec_load(int fd, struct
>>>>> drm_xe_engine_class_instance *hwe, unsigned
>>>>>                  1e-3 * submit,
>>>>>                  1e-3 * (elapsed - submit));
>>>>>
>>>>> -        /*
>>>>> -         * MI_STORE_DWORD generally completes within couple of
>>>>> ms.
>>>>> -         * Assert if it takes more than 1.2 seconds, as it will 
>>>>> cause
>>>>> -         * IGT test to timeout due to sleep of 120 seconds which is
>>>>> -         * the current per test timeout. Currently there is no 
>>>>> way to
>>>>> -         * read this timeout from IGT test.
>>>>> -         */
>>>>> -        igt_assert((uint64_t)elapsed < (uint64_t)(1.2 *
>>>>> NSEC_PER_SEC));
>>>>> -
>>>>>            syncobj_reset(fd, &syncobj, 1);
>>>>>
>>>>>            /*
>>>>> -- 
>>>>> 2.34.1
>>>>
>>
>
