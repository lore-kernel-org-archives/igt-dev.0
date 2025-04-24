Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D1C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 05:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6147810E240;
	Thu, 24 Apr 2025 05:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tr7jTDmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E87510E240
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 05:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745473338; x=1777009338;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YKo7udud7aZ7YMTfsKtt5MCILpoFGsadTYCCskFE/SQ=;
 b=Tr7jTDmfza0m9rpkkGAe4cIlAF98YtHqTAeEDDONIX78TdGIayE2z7fy
 olx0tjF18mtFSLa9cW3z1MIc1u+YE9xn85idS0Q7PrmkimUWn7OKGLHok
 fh96jE0b5W4YI5BxMwNnw0FLlLWLb4rGu9/JXrbryjNZaC+D03KC1IOrc
 8fXk0D9uWvNKtTVOM8Js3+rQnUbsQuv7OhjlLl6+KXxvCsX5E2CmsUExw
 3Co8vYzEm0UCmP18b/wavlKOvJXHS8H5zLo0UNsGC7r3sn0SERs3xsy/g
 lB14TRIeSH3Gaih6ZaYqmuIkLO9Gv0NlcmlFZuBBQYtlePMC/t01QHpas Q==;
X-CSE-ConnectionGUID: QWP48urJQvi8/+jhEk6Ukg==
X-CSE-MsgGUID: 9FEQmcizTT2PKY5nhahq1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46998864"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="46998864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 22:42:06 -0700
X-CSE-ConnectionGUID: j/EonnuFT8CAvBIQPHe60w==
X-CSE-MsgGUID: ojl3Nlj+RUCD2azVa4pGyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132351810"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 22:42:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 22:41:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 22:41:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 22:41:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt5GM4UmOy+jZxNrl+kkwxJt/fSeSzvFq+oSqP89aLlZibRCRDVsscp/iV9vy+sNkjSfu9KFTfFeTetxdY95WFZ6FK4mjFkXuYwePiXdHLPzbV4wCVkvB1cpQQZ3vF66YjFn7AWbcWjjzaP6So34JU1W1gyo4z40Z071bQwdSXZYrTrZ528ayq96Ide0s9No+ip66I6M9G7owqTVU2BOtcdIOR+UQ9ANyv6jqIFOjkPnef+GjiHUawd0ovvSVnIkvdc/jpJMBgi9fLVOIF5lj7z0Nm51dk/WbHpj6IvqVTAGcWOvQa8AnDwQjNHAKPf4lDaxLHpstVngdmguorl99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT4lx+7cNWP9aCcmVhN+St0UBG95pelpFZkYIEMzl9c=;
 b=EuUDHprpeDBN4No16DVlVZ3DpCGEV+enf4NLfchm2WdOpyiUiELaGBOrbHqK+R1DKV2y3TpEU7Ro2GkvCqnWqWHFyOID0/Q0V+7ruQfx+V01F6g1VUaaRhsFoM0ZgdHEdgwCnnFBepop9ZQ3BFyeT3VI1Zoi1hw9L+0snD6iBLr1PceXyX8kqVZhLDv1sbwHzOVHJGY9ZQk+9KDExrpfBEX3SshV8TZrqExCqjKO9kVY1F7AdJeTltaD0kasX63H9w/AyhULsdB1xm0hcMDkJk8lmbETb9nnbWqEfZ/NoIHYkQhjFJn/+aBgf5S6T1L3/BgzTjDJGpOlsV7W96O8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.38; Thu, 24 Apr
 2025 05:41:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 05:41:24 +0000
Message-ID: <5a646900-7853-40a9-a217-e5d3021818fe@intel.com>
Date: Thu, 24 Apr 2025 11:11:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <kamil.konieczny@linux.intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <louis.chauvet@bootlin.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
 <rxwug7vusfk3npmlpvad43qhgo2rqa7jwi4wtfbhnei4f46sty@wjylvkykbjgr>
 <aAfuM25ln-ugZd_W@intel.com>
 <md6mljnmwsujfhv3up22l6rqhlmfyhg4qicqonkhfetabsako6@z5drpnypwqyr>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <md6mljnmwsujfhv3up22l6rqhlmfyhg4qicqonkhfetabsako6@z5drpnypwqyr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f099952-7b09-41ba-596f-08dd82f2a6a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2tucjF3SFd4dnZIS051ZzE1VGtKblMrbkF6NFNMOStkRjNaZHNwTXI5N0dK?=
 =?utf-8?B?VHhqYlN2Skd5T0ltY0k0clh0dDFrR2M4UTdLM0cvRFdLcGJBQWwwN0x5TEoz?=
 =?utf-8?B?bFpRNkhQcElMdUZmY1ZRaXFKNzdlMkF3cC9FVWFTTGpKay9EYTNRKzVuTnZh?=
 =?utf-8?B?VkhjeW5wakJNYURCcTJxSEY0V054WmVrUFFMblVuQ2wvZGE4UWpaM1RzckJI?=
 =?utf-8?B?Q2tCdnZUMHl3dloyMTJoU0ZoZnFxTjZNSk4wOGV2bjJFL1RwT3VtZHJISkNh?=
 =?utf-8?B?bFEzZ05zSG5vSjd4akxMVmFPTysyMHh1U0szNHRvbk4xTjhzSTcyQVkyY3BP?=
 =?utf-8?B?UnZvUkxOS29JcHFIenJxbmQwTEYwTWVTSzBNckFHd1cvRjFBT0I1VTZBdmlX?=
 =?utf-8?B?bnY2RWpicEVmN0FTeWJNb2Vjd013aStKd0F6NlRMNHExMC90RUhwV0hMOUdh?=
 =?utf-8?B?L29IS1VSV1ZCSmZLZFBMc0UzbGpnZXJaejNNbEVGVjNiTnpqa3BxQXhOcFpY?=
 =?utf-8?B?bXlqUTJXM1k5MlRUUDBDTVRGVDVId24xVHQvUzJjeE5vQTVGNURKbU1XMWIr?=
 =?utf-8?B?dEdUR3BPazVKMno1QjZESVpqdWYvVUFWeDNOUHRxcU5hRUcxOUdhWHNPa3pv?=
 =?utf-8?B?MVRTeE40S0M2M0YxUXBKTncwNkpvenZlVm5ycXU2UHQxb2lSZlZOTzc2T0Vo?=
 =?utf-8?B?cFdHODN1dis2a1hLRFVyZ0JIcncybXNEUS80YWVxQ0phYjFKVnBHd1hBeFhu?=
 =?utf-8?B?SGxPVG9CMVdpendnODc2NEdxb1BlRU9TMzNBS3ZDWlBvYUdFRzhiVmRrc2Fm?=
 =?utf-8?B?MFpoYXpvaDZ5SHlUQlNJZFFCRnVaT1FOTjQzLzVOU2UrUTlWZDhnT25Vemsw?=
 =?utf-8?B?MVpvdC9JUGluRmdtbThWM2RacFEyTERmTzRWWGNLa0RGL3RNQVNVUmJsbU1Z?=
 =?utf-8?B?RGVWUDFFamxQYVM1QTQ0WkJVek01K3BFOVhKUFphQm5PcXQydHFUQXFKUS9B?=
 =?utf-8?B?c0QxVkZTRnEyeVo5ckNEUnR0QTRqRFB5Q0ZIY2xLcEo1eXJ6UHlPdXRncFF6?=
 =?utf-8?B?NHdzQ3NYdjhrOTB0VnRsTzYyREltUjZ5R1BOZ2NqL1RraTZ0RVdIa0hGZDRX?=
 =?utf-8?B?SHZaQmoyVyswQXBoUUQ2V3d5WXNZdkxEVGxaaUpLVHlMOEtoYjJVMzdLNFlm?=
 =?utf-8?B?QmhocmVjT253REFjTTBja1EvVWcwaG9RcTB4UTlrM3YyMHA0SDQyK3RDWmJD?=
 =?utf-8?B?aEtJbW1kTGFGZXdSQktGNFc2S3F5RnJFWnc2T3NuYmwwNExMU1Q4cGptSS9k?=
 =?utf-8?B?cWVBb2FQL1owQTNUb3hmZCtHbVdrQ1BIU2V1M2VONUJ5WEF4Rkl4VE5CbFc3?=
 =?utf-8?B?cUJSb3BBZWVhcUxVOGxRVVRLbEZBRlptZExjRlMxbW8xcVJ6ZmdKUXlnbnlu?=
 =?utf-8?B?S0twYisrSmFRZTRZMEZlSnpwN0pZbmE2WTlsWXF4NjFGdC9kZXVWbXlSNHkr?=
 =?utf-8?B?VW5DMHdCVTdkUHZQaWFYdUdUK3FvNWlvazNvaE9qRUxKYmcyeGZTWSsrOTYv?=
 =?utf-8?B?SlBLWnI1SnpqZXBNTkl4TjZLZ0dLZmluWkFhMGdLS3RPcnNTM3FuQ2ZFZEx6?=
 =?utf-8?B?UW44ZFgxZVAyRnhuelNGMDZlV2ZZdHJtUzd5NGEzbnNCZHhlSWRjNXp6YThP?=
 =?utf-8?B?ZGFNM05POWYrRnlmWWRETVFhM3R6eFkyOWhVZldZeFNKRitrZHI2REE5bkhr?=
 =?utf-8?B?NDU2WEZSUFFvZU5yUlM0cGtUSGV3VlNRSmZyRmRoN2F3ZVZxWEU0UlFZempH?=
 =?utf-8?B?ckR3Z0NBZ0JZM2RBWGJycDdyRG03UjFRWWhuZXNOMElreFRKY2hOSlFCWjUz?=
 =?utf-8?B?aWp4UHVCZEFGT0FkclBMNkMwbzJucmY0TE1IbFFVbytsWnBBZ0J3djVXb0ZD?=
 =?utf-8?Q?9ugFdVEfrZQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU1vZmg3em1TWnR0QlluUWNMSzM0N21waVYzeWovSEhJVWlXWTE5ZUNwZHQr?=
 =?utf-8?B?bDFERDN4OWtmakpYREQzUDBvc3VrT3NlYmw3cDl2RFBqQ1hyRndueTkzQXFQ?=
 =?utf-8?B?Wm54OGlFUXo4aVhUSVkrSGh3UDBLUVlCNEJpOE55TlR4SkhkQk5MWUtzT1I3?=
 =?utf-8?B?ZXI5UUVmQVE1VXdXYlB2d2dPTmgyT0FnR1MvUzFUNW9zUm42MnBKWHB1emxs?=
 =?utf-8?B?L3pRc3pCdERyRjMvVUZlazhScXNZUTZteUlMeTB1OVFPdkZTZzNnbjQ4NlM2?=
 =?utf-8?B?aXExc3lkQlFXempzVWFjSitOaUJ4U0FlSUJWR3EyNGx1YVp1Y3lwUEh3cGlw?=
 =?utf-8?B?dVFVN3hJVjU1WlF3akxuVjd0R3IyeTdOdVpOVUtvazBidi9uMG5KMUN2dlM5?=
 =?utf-8?B?TTJrYVc4clpGUGtORmZSRDF0aHJjeG5JSGZ3ZU1tY3dmd25NbFhmRTBIN0Ev?=
 =?utf-8?B?VU5CT0JCQk1xc1Z3Y2FpSWx1ekFJNkUwR085MFk4azdpV3JzY3lsUFdsV3Er?=
 =?utf-8?B?M1dzbHVYczBraUk5ZGNsYm05eks2TnVycVJTKzQrN2FRUC9pVWt6SFBMUUlS?=
 =?utf-8?B?SCtiMnRDNHhYc0VjWEtxU3lRbWgxcUd4OG9hZTRZalVVVnBPRnZlRmdZblZa?=
 =?utf-8?B?djl0Q1FhNUY0aFVzU2pFeUI1RnpYTG9ZQ3E4dTdtbEhLRFR6eVVZazRYS1Vl?=
 =?utf-8?B?L1BBTm5yWHdwejhydklONnRGMlAzM0lYcENmQWVKYWdpVlpBbGd4NlZtS0lS?=
 =?utf-8?B?QUljQndJWGs3OHo2cGtiN3JvOTRGbVp5RVVXVG9FeitneVZqNDlWaHF5bytC?=
 =?utf-8?B?bVV5NWxiNndUTVJPSEowM1pkL0pnT05TLzNCWW9CdVpZd3hscVJDYWYwclZz?=
 =?utf-8?B?YmFqbUtzVjhpeXZMbWViRzliK2FnY1RaMFo1ZzZ2ZjkxMXkvWXJqcXY5OFZn?=
 =?utf-8?B?SkQ0bVRpbTNtcnIwbmJEcVdKTERwbFhJQWNyWklRRlZTL2RRZjBYK1pPRk1n?=
 =?utf-8?B?R0xuOVI3alNDOVE1OWZVV2tFbHdDYS92M3NkcjZ2ZmxzNkkyZlVTb0Z5ejhm?=
 =?utf-8?B?UzZia3dNWHBBbXZmdkR3cFp3NkJ3bXAzanUwcWZJMWRkYVdDaTVvbDFJNW03?=
 =?utf-8?B?REtSbG4wbDlSL0Z1cXV4YlRrTFlxZmNvQS9UNjFlNlpCTE9KVTRHVHI4VkxC?=
 =?utf-8?B?OXVydlJ0YUxGWFlnTTRWc1dIb1JNcUhsTW5tOVhWalVoa1doajlNR3ZibExq?=
 =?utf-8?B?WXRtRzR2dTc2Kytid29DN1o3c0FjUWk5RXQwR2JIdzE5V1NsY1NlSUMrdTg3?=
 =?utf-8?B?NFl1UGNRV2ZNakpoWHl1UGtUbmw3RzlsU1ZSOWZ2Nmw1ZkI1MXV3SWI1MlhD?=
 =?utf-8?B?eDlyTUM1Um5CQi9aNmkrcEFINXFUTTNuTERLZTFYTDg4NCtxZnIzRllLdDFW?=
 =?utf-8?B?M1QvejdYK2hpQjY0bk9qcVorRjBrR1hRWHIzcXRuSTdDRisydmFWVUt4b2ZG?=
 =?utf-8?B?YXFvcXFXUzlpa3R4Z3JXL3Y5K2R2MzhMUzQxVnh4cDVtSEl4NlFYeTdXVE1Z?=
 =?utf-8?B?bDVna2d6SGk3bnZGWDBWSVg0azNoZ1gzcmx0eFN0b2dzQkxoZlNuZER5TkZs?=
 =?utf-8?B?OVVQYnpUYkI2eXg1eEpLREpZUm9iRzcrVWRPU3RocnFWdEUrTnBQamdOWk92?=
 =?utf-8?B?QkdMRHdWTmtYeHlaZVFQdnhDVFo3SkMvc01PSkg1Uk41S1NGVU5XZVNkM3hj?=
 =?utf-8?B?cW5lS0RaSDdPaWdGWWtEYW0xZmx4TnJtNm1YY2dRWFVqcjR6V0RSSHkyK3hZ?=
 =?utf-8?B?dUsySHBwTHZrUU9pdlR1ZzJIVmZCd1QvTWFuMlBEeE1JcTdCelRnN1VQT1Z3?=
 =?utf-8?B?UmxkQ1QrZ1IwTS9GSk1xempPd3FSUzlmcGxoWEJDcHVqbzZpeEZ0ZzgwTzQ1?=
 =?utf-8?B?RzFOakxEenZ3NDRQWUtCcHh1WTBuOWZlWi9QNGM1RXNsU1AvcFRPYytZdUNu?=
 =?utf-8?B?QkFpays4L2JJZ0RoUDhTL0JId2VvcHI3aU1seHRvRjU1RW9OUzgxL3hMaGxW?=
 =?utf-8?B?YlRTUzFDa2UxT3h3OFJLRE5YRWFaRjB0R2l3elF6dUVKMlZXUUdUNDYvK0wz?=
 =?utf-8?Q?ACcdMny1nEYQxHZdS8dU8Or0j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f099952-7b09-41ba-596f-08dd82f2a6a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 05:41:24.7558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sSTTu5BqZdW2MHXOZfAfu3iq6P7f9GOwr1A+GJGgRIQ55DXnXojbjPb/d5duh027imwUEjrfM15as/Pe7FLvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
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



On 4/24/2025 9:47 AM, Lucas De Marchi wrote:
> On Tue, Apr 22, 2025 at 03:29:55PM -0400, Rodrigo Vivi wrote:
>> On Tue, Apr 22, 2025 at 08:57:35AM -0500, Lucas De Marchi wrote:
>>> On Tue, Apr 22, 2025 at 03:26:01PM +0530, Riana Tauro wrote:
>>> > The test validates if survivability mode is enabled on supported
>>> > platforms when configured using configfs attribute.
>>> >
>>> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> > ---
>>> > tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++++++
>>> > tests/meson.build         |   1 +
>>> > 2 files changed, 113 insertions(+)
>>> > create mode 100644 tests/intel/xe_configfs.c
>>> >
>>> > diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>>> > new file mode 100644
>>> > index 000000000..414af4a86
>>> > --- /dev/null
>>> > +++ b/tests/intel/xe_configfs.c
>>>
>>>
>>> humn... does it make sense to test survivability mode in a xe_configfs
>>> test? configfs is just the way to trigger it. For completly different
>>> areas of the driver I don't think we should bundle the tests into a
>>> configfs test: we don't test if xe can be loaded without display in a
>>> xe_param.c test, or if we can inject faults in a xe_debugfs.c test, etc.
>>>
>>> My suggestion is to have a dedicated test for survivability in which
>>> configfs is part of it.
>>
>> Well, that would work for survivability itself. But perhaps it is good
>> to have dedicated entry points for the knobs we expose, like we have
>> a single place to toggle all sysfs and debufs. So we don't forget to
>> add new cases and we have a single entry point to quickly exercises
>> the knobs.
> 
> humn... dunno. The problem I see here is that the answer for "does it it
> work?" is quite different for each configfs file we implement. Some may
> even be honored on probe only vs others that can be set in runtime. If
> we had a generic way to test the configfs like:
> 
> 1) write XYZ to file
> 2) read file
> 3) make sure it's XYZ
> 
> then it'd make sense. But for these tests, checking that is not testing
> much.
> 
> For survivability we should test:
> 
>      1) bind the module in survivability mode
>      2) read something to make sure it is in that mode
>      3) flash the same firmware... possible?
>      4) unbind the module and remove configfs
>      5) bind the module
> 
> For possible other things coming to configfs:
> 
> A) Extra Workarounds
> 
>      1) write a {gt/engine/lrc} regiter-save-restore
>      2) bind the module
>      3) check for each of them, via <debugfs>/register-save-restore that 
>         the value is correctly set.
>      4) repeat test for write types like rmw, write, set bit, etc
> 
> B) Fuse off engines in software
> 
>      1) write a file with the possible possible engines that we should 
> export
>      2) bind the module
>      3) check via debugfs that the exposed are at the most those
> 
> C) Do not attempt enabling display (i.e. a substitute to the module
> param)
> 
> ... etc
> 
> Are we going to shove all of them in a xe_configfs test even if the
> tests are totally different? I think it will be harder to maintain, but
> we can always move to something else later if it becomes overwhelming.
> So.. I'm not sure. Any additional thoughts?
> 
> Lucas De Marchi
> 


If we have a single test for each entry, wouldn't it be better to place 
it in xe_configfs file?

There can be a couple of basic tests along with this like (read all 
entries, invalid directory creation etc)

Thanks
Riana


>>
>>>
>>> Lucas De Marchi

