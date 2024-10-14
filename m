Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A07D16270
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 13:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD91910E2C6;
	Mon, 14 Oct 2024 13:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoYP/c9i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E1110E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728913776; x=1760449776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DdmqGi+na7RHlOfHGYobl5QYHtfo3TkdqlLd5hNBbH0=;
 b=NoYP/c9i3lGhuP313udUL/FxLoxEhGLpUP3w8ST70Dz0BV6NVqcAJqQF
 B3bcNAX33TbCHRCjcHV69XqP8y4TBLxROlGnz3nWOQxXv20WJntET5J7F
 F3RdxXr7xteTTEXml4SPdWwA2znsvK57WdmpH1TeTfqZJuQndXnq46Zf9
 2RlfOiE46+eMtCepYHH6gwxWws1G6cxOp6fiHgpHYouexe4gPFqYVi6bh
 dDqBO9XWBP2+rtB9wi6ipQ+BZaAz9tFqjC3HXD8w/4Cq/R4gX/XTJai4M
 DLqdhE8nTh2k7IOjL2US7JgP3HHu7VxSiNWtpz39OtrlZI8DhT8ndKuA7 Q==;
X-CSE-ConnectionGUID: 5jLEIjQdSbOwYn7O7UNsGQ==
X-CSE-MsgGUID: NkkDvq0WSfyVufpTtTQUuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="15890004"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="15890004"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 06:49:35 -0700
X-CSE-ConnectionGUID: 8K+kI03RRR+8cjHY9deoag==
X-CSE-MsgGUID: LIdpX219Q2+mGcfOFs6Vcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82342516"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 06:49:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 06:49:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 06:49:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 06:49:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 06:49:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 06:49:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxmd8bDIyXFAZAkRXBdgiJPknwmeQ1I0MyXsQaTLrzApwT8io0jTG8gCRb2CYlHPrbQEy2Ko/U9VzDoT49xWNLioKu3elFw6Tp+2sxpMIWoeSWNyrdzo8OwkY6YBArG06GwMrWRzW4+vNXWPiMAwfSncpZOvJV5RTvYUUWzXI6Kg+O/HGCwvlMqDagRqucXVGnV0VtKnAJneqzeF0CwVZcLnH0FxHA+m2HhZiZvxmTS7z2iQR5MiQqSLUPox1cDM/v1gFDH9gmBqVojkRMR8PN+x+pQCR2Hp/ta5UBEiBlYDXGOFe6j/5ZX/ES+XiFELUnajbri+JiL4aPj7O+6HVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWGLKO8mtH3YNqZ2HI6SzVd1BljYwXrQZSrAtqEyYzA=;
 b=EMHz5qNN2p980gWG040FKYcy/lViojixBAJ7Ag20WmPwdr9LYTuVYtQwLoJp4HJOruwPQYnVzHiM08bH42eFzXxIveYQoNZ93fkK3pnaBwbWXx5lO0nLfDYk9+X41yvDc4bzqbaJWhxw95j21MNor3b1UpZLwlQ8dXXOvQvgy/zY8rcYIrzuKNSiCdPPzVo4HQoFkZ27+ieUcmUopZO1Dzl40AtWLdOwNYhQYXociGgv3fKvLmYlVEjMj+aGY3AP2oZP/hc4XVWJcAzgcmu7Xa++5pS9kPIUdoeLgNLs3fZ3XqJLKvKujljxAbjDInDuTOZ34vUiZYIscRiqoX6ZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 13:49:31 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 13:49:31 +0000
Message-ID: <a3d7d480-3ef2-489e-89a3-79553dcdfcbb@intel.com>
Date: Mon, 14 Oct 2024 15:49:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/gpgpu_shader: Add x_offset parameter for
 gpgpu_shader__write_on_exception
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20240925133003.41959-1-christoph.manszewski@intel.com>
 <20240925133003.41959-2-christoph.manszewski@intel.com>
 <20241001150705.kysozwio55lgypsk@zkempczy-mobl2>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241001150705.kysozwio55lgypsk@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::10) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|CH3PR11MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: a54a60ba-000d-4419-15ee-08dcec570753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEFEMWhsQ1pOV3pmRWNqcU5pRkpJd3ZkNUpYV0NoM0JGUCtDSlhCWU53TVU0?=
 =?utf-8?B?NWROU2dNZWprOUV6Vkc4ZGNZbVRZa3lPRFB1bHFzcEcxL1dITHZoSGJzWWxD?=
 =?utf-8?B?UmZTNzc1aWdvMXVUOUJabS9SSkNrNVg2aDVhQUZMQ1NwL2FGNFlvM0ZDaGFj?=
 =?utf-8?B?MTdPMFRiUzZyLzNPaDBoNDVTQjZuV3I5azYramxNYlcwdTlCT0hwVE9yRmNO?=
 =?utf-8?B?VCtIMVI0VXhlbC9iY3RtSDAvTklmM1ZUOVRsbzV5WVVCU2hxcjZkZlBrYnZr?=
 =?utf-8?B?TGpXTnlrZEgrTGZrUGw2d3dad3VGVGRXT2NITWVRd05ZL2tYeFNvSmkzelhr?=
 =?utf-8?B?Si9WcVdxWkZuTEwwdmxYd1p2L3VuVlBNTFREbytrQjV1RVFCb0RZT0FtQVlM?=
 =?utf-8?B?N0lBTmlsVWNVaXBicTJnM0Irb0Z5SnI3ZHZocG9DRkk0Z0gyN2xLQlduSW0w?=
 =?utf-8?B?MnFKbDc5bVhrTkh6bmdHdXhxS1UwU09Ua3lHQm1zUU9zTmEvWlNKYnJQZjBW?=
 =?utf-8?B?WFBuajl0TmFWUllCTThnd3d4SG45U2tlMXdnK25peFNHTEptRGhXampZY29n?=
 =?utf-8?B?ZmVlcVhMMDNtZG1YNGx6aldwMmNGY0FhdDBFMC9ITy9kcGVpWENDQkZHYWZZ?=
 =?utf-8?B?UjFFd041dGRSQ1NmNVZZOGsyK1FkbEpJa01tekJlZ3dLL0k2YmJqcVFUVkI4?=
 =?utf-8?B?ckoyaDN2ZWpqUCszejBNb2RrL2NlbjJwOGJRY1lvdGREWEVpUE9kdUJZYlhw?=
 =?utf-8?B?M1Vxdm9xMWtiTitJL0F4STFCdTl4d1NTWmV5U1VuVUhJQVFYdGF5eTNjZ1c0?=
 =?utf-8?B?WTBmQlNjTk9Gcy9FVjJSbHBGSkV4cHQxaFVRWnhQK1NmeW9EN1A1UUZLcGd2?=
 =?utf-8?B?R1QvVVY3SmlOWXN2SnRTbWQ5dEZNd3YvUnhMckpaMjBhY2x5NUNDem50aUQ4?=
 =?utf-8?B?NjZuZ2RHR1JFdmFXMGtRSlNHa0tvQUYwSXZacUhGcCtrM3krK09sM08zbTVI?=
 =?utf-8?B?RE9UcDg3RW80WDdDeldyMWlRd0JiaXVEQnlJU2JiTHBaWTZjRGlNQ2xlUGlL?=
 =?utf-8?B?N3cxVm9Ld0tLY0Nxc05sajQwWnVPaDBWWHRWK2E2ZFFsbWFmRnN1bThOcm1r?=
 =?utf-8?B?SXpyMmwrVU1JdXVDY2xLR2s0LzZoVjR0UXFFOUdNd09UZVVRa2pONWlGTjJz?=
 =?utf-8?B?M1VFK3pNSFQ2YnhvNmlNMmczZ1EveDY1aS9IYkNWL2ZlQkw1cnYvTExRTkNI?=
 =?utf-8?B?SjVhVEVUT3g0RENuMytlQ0pOOTZPK2hXS2lPRWFKWWE4b05MZXlMeHdlNDF6?=
 =?utf-8?B?b1lNREpoUWNvaTJlWnpCVzR0OTFxdkpyMXJkaHZPa2VpQ1R4VnJ3UEQrS0kv?=
 =?utf-8?B?WEVhK0dQR3lTdVJQdGJVNlMwTXQ0VmgvTGZaVGFhVXRhUDZUMHZZTjdvd255?=
 =?utf-8?B?NEhrbHlJc05EZXdETk5UVUVBSkxVVWY5YWxXckNvMFJTOWVxSmFjeDl2dU9Z?=
 =?utf-8?B?RndUVHpLMmtsbTlPSm1xU3dtaVhITUVrWnQ3djRra3RWUUp0R1o0eGwwUnN6?=
 =?utf-8?B?MHNqUnBtNXBpTDFZNHlqamNpd2tvL3ZwbWp6cVU3WDQvL1RmNVd0bGUvWDUw?=
 =?utf-8?B?VlZ0emdERElNMmRIMHlCNWc0VDIwaFNQL0lZQVdZSlZrVkQ2UmRZNFFMS3hD?=
 =?utf-8?B?ek8zb0lHWEEya3VFdGVuS0ZYUjNZcWZpK05RNkpuVXpQQS9paUJDRW9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjhJaDFZQW96MkF4K1VDY014M1FDUmVBeUhhalF6MzlTNTVhSWpzRlAvRXdH?=
 =?utf-8?B?MnluY2FFSUpLNDg3OHFSbVBvMUhaQnVCYVFnSFE0b2dmRENsRy95WjV6bFg2?=
 =?utf-8?B?TTFMT202djFReDBOTjZLZmNJOVJWV1NmaTFZWkp3VStZYzZ3T05GOGxXNzIz?=
 =?utf-8?B?bnRaL29zbUtYR1NpYWsvbTVnWVZwOHUvZUdTUGV4Mm1PKzE5M2tacVpEcWZh?=
 =?utf-8?B?RGJuU2Z4ODZYaUY0eEtEV3kzVHU3aFJ0bUpxRitEakVSbEJVcmk3UGJjODY2?=
 =?utf-8?B?cDgxN2QrK1RwbDlwWFpUd3ZLbFRncVZwb3hrOVRyQ2NVbkVTVTZnL3U2TXhs?=
 =?utf-8?B?QUpnZHF1S3lWZHpCVVB2MUNQMDhodWtkZUN1ak9uaXJyNDlFZGFQaEh2VWhH?=
 =?utf-8?B?MFhmVjFMaE9YS3lSenorVERETkVxSmNibGxkcTRNN2ZLNldRQi96bEEyUk1o?=
 =?utf-8?B?aXpxOGxaeUVtQ1lhZUZNcklUTjB3eUtMQlZRREZyZXIrWlNXVkFkcGRNcnh3?=
 =?utf-8?B?bTl6MjRZTG1jcFEzQmsxaGpCOGQ0N0ltY0JKdjhDVys0Mk96Y2pTTEFDbUlh?=
 =?utf-8?B?QlhQV0prVmhHK0ZYT0lnelZyejcwcHQwZ1Z3Yk54MFYwVkZyQ1RVNVJKdVBn?=
 =?utf-8?B?MVpzeDhaVEhuWWxYbytwOUJyZDFBbHp4WGovdUVJRG4rR1FlekRJeXRCWVM0?=
 =?utf-8?B?NVlaZDg1NGZSYWtMeUNTUTQxWVZGRWZobHd0TXFlQVF1dXhnd1JEdHJSV1Az?=
 =?utf-8?B?aStVNFdqWUg1UWxoSU95Vk44YlpDQmtyNXJscHU0VHdDdWwvd3JKbWN1M1Vx?=
 =?utf-8?B?Zkh2QmUyS0JGUno4OUpQazdBZVp0dTVUdGIrY3h6cEprb250ckREZ2EzUGxN?=
 =?utf-8?B?SHprajhlL2s5bWNQWDhFa3dNZFFWU2JTRmNtV0tpZ3hHb2Z2c1hXMStJNWdj?=
 =?utf-8?B?S2IrNy9uL21odU1DV29jdDZvM0tOV1pIWXNjYWpOaXhzVDBoeVg4NHBvQ0dW?=
 =?utf-8?B?UGhuc3BLZWRaZkd0dExqUzhpdGQ0cU1xVTNSaEtxVEZialBrMFc5Q21rV3A4?=
 =?utf-8?B?NmFYODhxNVgrMUhUNGhxN2lQZGxKNmViajdXR3luaVNYZkVHeEVtRkVFc29v?=
 =?utf-8?B?ZjVyZ2Rlc3RPWHZVc1V1Mm5aUmdnQ05VRjd2dExZQ1Z0WmQzODVBcXEvc1VT?=
 =?utf-8?B?eDkvdTZiQjVod0VkRDdpOW5UaUdXSkt3SThkYTF5bzhPUHcwOURuNS9Xam0w?=
 =?utf-8?B?cHhkYi9ObXA5UmVOVVRrWXRvUCtQY2wrM1o0VEJvdlJpMjZYcnNrZGh6Qkx1?=
 =?utf-8?B?UWUwMkxCWWxsSExsbEpzM2pHTWRWTGo1VG9STnlIZGFNdkhQdVlKdnEyN0RS?=
 =?utf-8?B?dmdYa0xaNjBDOVNoU2N5YWhjREcwSzFiNTg0eWc2aDBpZDdZdTQrK1VFTWpq?=
 =?utf-8?B?K2NiazJoNEpQRWhoRnJOYXBnSkFlLy9ZV2ZaUnZhLzlNb1lPQkZFNEQxQVEv?=
 =?utf-8?B?OEtBdlU0eVlodXl2QXNaY2o4TlNTU0ZPcU1leHlsU1lCV3M3bTZaUVEyeW5v?=
 =?utf-8?B?cTNEMkh0ZFdEeDRreVF6S0kzRXV1V1ZoTC9IcUZWd0lKWnhxS1N4WWtKQ1p3?=
 =?utf-8?B?aGJvWjd2SkpuY20rd1hKbk15YjNCUnlBcEhrOEpQMFBsVGx6MXN2d2tTNXp4?=
 =?utf-8?B?eTVJdVFzNVloQko2eXJOcEZyVmdaNFJHYlY3TWJ0RlBwMmlpQ2FmZGF6endI?=
 =?utf-8?B?WWhFTEI2ODh1Z1I3WGlWNUg1dDErK05ZRFJZZUtrcm5TWXdGSFV4TWhYaUdN?=
 =?utf-8?B?YVFsdTRsbUViai9ERHpQZCtYVE5RcmtyWkMrS0FPcFlPdFVPYmNheU9HcGk5?=
 =?utf-8?B?QW9HRWhMb0VUTEJXTTRJU2p3eFN0d3U3OXJzWVhFZUxVY2M0VlJMVHk4WVVz?=
 =?utf-8?B?NlRHRDJ5QlYzK2lRWE1JT2lmenE1WXN2RG4wWm1SZjVFL2R2dnA1WGtvZVQ3?=
 =?utf-8?B?dy9sdHVIZEhreE5vc0hhS2VRRFNkWWxvV1dHRDRxSUlWZDVlQWQrSmNxNmpW?=
 =?utf-8?B?NjU1M0JWMDc5RWE0d01Sa3crUnZITHdRSjFuN1p5UTQyWSs5SEx6aksxN3Zh?=
 =?utf-8?B?dC9kb0c5Vmx3VDR5S1dtcjI5OG53SHRPeXFwTWdXVGVjWW50VEZxUDRIZ2hD?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a54a60ba-000d-4419-15ee-08dcec570753
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 13:49:31.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7K5GeDd3hMJ0hzKIH3G5zRJPBS5adX7DuuyaiTZxFckCI9JeM0qSF09g9hZqEm+se6lvVQfUZQY4LyqkNEksg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
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

Somehow I missed this.

W dniu 01.10.2024 o 17:07, Zbigniew Kempczyński pisze:
> On Wed, Sep 25, 2024 at 03:30:02PM +0200, Christoph Manszewski wrote:
>> Currently gpgpu_shader__write_on_exception always writes the first
>> column equal to thread group ID x. Make it possible to specify an offset
>> from that value.
>>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   lib/gpgpu_shader.c          | 29 +++++++-------
>>   lib/gpgpu_shader.h          |  4 +-
>>   lib/iga64_generated_codes.c | 77 ++++++++++++++++++++-----------------
>>   tests/intel/xe_exec_sip.c   |  6 +--
>>   4 files changed, 62 insertions(+), 54 deletions(-)
>>
>> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
>> index 6d8c7ebb8..8df8d9612 100644
>> --- a/lib/gpgpu_shader.c
>> +++ b/lib/gpgpu_shader.c
>> @@ -670,6 +670,7 @@ void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
>>    * gpgpu_shader__write_on_exception:
>>    * @shdr: shader to be modified
>>    * @value: dword to be written
>> + * @x_offset: write target offset within the surface in columns added to the 'thread group id x'
>>    * @y_offset: write target offset within the surface in rows
>>    * @mask: mask to be applied on exception register
>>    * @expected: expected value of exception register with @mask applied
>> @@ -678,45 +679,47 @@ void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
>>    * to provided ones: cr0.1 & @mask == @expected,
>>    * if yes fill dword in (row, column/dword) == (tg_id_y + @y_offset, tg_id_x).
> tg_id_x + @x_offset
>
>>    */
>> -void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value,
>> +void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t value, uint32_t x_offset,
>>   				      uint32_t y_offset, uint32_t mask, uint32_t expected)
>>   {
>>   	emit_iga64_code(shdr, write_on_exception, "					\n\
>>   	// Clear message header								\n\
>>   (W)	mov (16|M0)              r4.0<1>:ud    0x0:ud					\n\
>>   	// Payload									\n\
>> -(W)	mov (1|M0)               r5.0<1>:ud    ARG(3):ud				\n\
>> +(W)	mov (1|M0)               r5.0<1>:ud    ARG(4):ud				\n\
>>   #if GEN_VER < 2000 // prepare Media Block Write						\n\
>>   	// X offset of the block in bytes := (thread group id X << ARG(0))		\n\
>> -(W)	shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
>> +(W)	add (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
>> +(W)	shl (1|M0)               r4.0<1>:ud    r4.0<0;1,0>:ud    ARG(0):ud		\n\
>>   	// Y offset of the block in rows := thread group id Y				\n\
>>   (W)	mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud				\n\
>> -(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud		\n\
>> +(W)	add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(2):ud		\n\
> You may drop mov and below should be enough:
>
> 	add (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud    ARG(2):ud
>
>>   	// block width [0,63] representing 1 to 64 bytes				\n\
>> -(W)	mov (1|M0)               r4.2<1>:ud    ARG(2):ud				\n\
>> +(W)	mov (1|M0)               r4.2<1>:ud    ARG(3):ud				\n\
>>   	// FFTID := FFTID from R0 header						\n\
>>   (W)	mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud				\n\
>>   #else // prepare Typed 2D Block Store							\n\
>> -	// Load r2.0-3 with tg id X << ARG(0)						\n\
>> -(W)	shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud		\n\
>> -	// Load r2.4-7 with tg id Y + ARG(1):ud						\n\
>> +	// Load r2.0 with tg id (X + ARG(1)) << ARG(0)					\n\
>> +(W)	add (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud	 ARG(1):ud		\n\
>> +(W)	shl (1|M0)               r2.0<1>:ud    r2.0<0;1,0>:ud    ARG(0):ud		\n\
>> +	// Load r2.4-7 with tg id Y + ARG(2):ud						\n\
>>   (W)	mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud				\n\
>> -(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud		\n\
>> +(W)	add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(2):ud		\n\
> Same here.
>
>>   	// Store X and Y block start (160:191 and 192:223)				\n\
>>   (W)	mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud				\n\
>>   	// Store X and Y block max_size (224:231 and 232:239)				\n\
>> -(W)	mov (1|M0)               r4.7<1>:ud    ARG(2):ud				\n\
>> +(W)	mov (1|M0)               r4.7<1>:ud    ARG(3):ud				\n\
>>   #endif											\n\
>>   	// Check if masked exception is equal to provided value and write conditionally \n\
>> -(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(4):ud		\n\
>> +(W)      and (1|M0)              r3.0<1>:ud     cr0.1<0;1,0>:ud ARG(5):ud		\n\
>>   (W)      mov (1|M0)              f0.0<1>:ud     0x0:ud					\n\
>> -(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(5):ud		\n\
>> +(W)      cmp (1|M0)     (eq)f0.0 null:ud        r3.0<0;1,0>:ud  ARG(6):ud		\n\
> Adding argument in the middle of the list makes a lot of noise in ARG(x)
> changing. What a pity we don't have possibility of making definitions
> like:
>
> #define x_offset ARG(1)
> #define y_offset ARG(2)
>
> in the code. Changing definitions would keep code clear.

Why not:

        emit_iga64_code(shdr, end_system_routine_step_if_eq, "   \n\

#define x_offset ARG(1)						\n\
#define y_offset ARG(2)						\n\
...
	mov (1|M0)               r30.6<1>:ud    y_offset:ud     \n\
...

Regards
Andrzej

