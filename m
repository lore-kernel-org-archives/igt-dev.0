Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3A8CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A043B10E89B;
	Wed,  8 Oct 2025 21:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1vkBlAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9525010E89B
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759960537; x=1791496537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nyG6Hjt4haZkegSaOk8faRkPVDw9muXHB6aieNc+oio=;
 b=T1vkBlAIv/dNhh0fWvhC8xL/R6tTTieW8IdnT93g0NdQOZPNWibeEvkf
 eKVB4s1x0AHE/KYGDfCwgdznRkUDhPOEPjqPt2KPfWEWBFtiK40fb97aL
 ZGtfVQPdqirK2b4CYmoUa010S/W7DXKeitRje4jNTh2WpnBjEMoyJlCRN
 jrkwQ+n4VTzq8mlnEzedRivzwun1oZ1Gm5CelxiexVIvhs8omKAX7z6AG
 ZG/n04/6oZ0QXkdqs0ddCYAoTfczLyT1tsEPnlEQ1Irx/etYiMx5blOuo
 tTV+G86UaBo8tf+cJvc1iE0jMqeSSyJe2i55ip9ZIeU3jTYOZ3MsPwrBb g==;
X-CSE-ConnectionGUID: krqNLCT7QfOB3QGspqXpFQ==
X-CSE-MsgGUID: sMMs0P/TQf2MfIA2a71kYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62073515"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="62073515"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:55:37 -0700
X-CSE-ConnectionGUID: 7vHwDqtPTbibGd2NpETdsA==
X-CSE-MsgGUID: mHnUjU6UTgiEdh3LfTl4xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="185842990"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:55:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:55:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 14:55:36 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:55:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUm5Y86J9Qe//MyJQFAKAF3eck5VBllpdK0yaX6N/4aQEOljw2W2U78CP9fw0BqX+0wy7oeeN/b9WKhniMIQdzfaaJqEshqZP0a8oaBeEXlcWMvjsCtUWVrwIvrb/1g6MXQEbfoh6LwBg9s5sj8WR/RxNqzEYkNCXojTYLoCA7f3uyThTTcUB78alCDZoHyC3cOJmjHAHpZy2xtmz1lDb7mxAWl1Oq7/ygDMPr9bJPd2zYphA0x4U+eELkgdDkOD16+JzgfRvhIw2KckH+FMZY0LhA9LjimO2ydyuN1abJ7ApQ9t/eVJqNwGewWtG2cOcM6Zs4yOk1eOHV5W9Qdsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDRBD/hPl0FdMe2rD3Pqn+NiZQMHyYHz/ZE2AcvaAYc=;
 b=EyFhHxSbcjwWu+ezcFjR2rZ3kWdRjC8qubhf0OjDEssZQFEJU+i8XCPc+OWlylBtpZYerCy70J/4DBN5XrMtw+qeAEDN7IHqgdX/4wfy257VQe6jxE9yBqb4NHrDobPIReFNaIO7QBSH/4R1PmVncKo9LcmKJEER3QBwALSyEBsJaHC3rbmZ4a+r5mMwRBOKjaR4OfqTh1mCyVAD/NlObzRXj0XyRnhxnHJr1cFdH33Y19AyJMzMicA8PD2nw3gXiSzXxpATX+VR74JjxxqYUok54KNg43XZEvt2qKfCXVNJS7nfdaK9EmfZqsocxuJIcEw56qM87xCGdzx89DlIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8373.namprd11.prod.outlook.com (2603:10b6:806:38d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 21:55:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 21:55:35 +0000
Date: Wed, 8 Oct 2025 14:55:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/18] tests/intel/xe_oa: Get rid of unnecessary
 DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE
Message-ID: <aObd1Ku5lurKaOUt@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:303:b5::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ca509b-dd23-4542-f959-08de06b568b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWZWRkJta1VJRTMraHVrazhuUGE3NGw0Q1NiUTUrdUR3Q1hEY2JKRnA2eWJz?=
 =?utf-8?B?YWwrMEszdGF5SEhWRGZWR2hMV2xLWDRia3huU29ycG5tQmpCY2FmdEFuQS9V?=
 =?utf-8?B?TElnNmpWblg0YWRHM3l5UnJOKy85a0RxQkRqUXltRlNwQXpTVlF4RlNWaFdy?=
 =?utf-8?B?UXFWWHdYeWFlR2NOZXl5VU9iOS84bHhZa3FLSWNyNzFVRXhPQ3d1cGZDVXpv?=
 =?utf-8?B?TE02VXVZVVNyWFpyL2plUU9KRjVMU2krYU0zMHY1c2dWQlBka2FzSFp5UEZr?=
 =?utf-8?B?ak1FdVRzd0toTlh5VENFZ0RIVlVTeVhZMUVnSEI0cVZWdUhkbFBsWkxqVTJu?=
 =?utf-8?B?U3RYQXJ1SnkyL2VHM0ZZMlJRd3paOXNPOHdQaGJ1YUhzVkUxQUJHNDl4T3U2?=
 =?utf-8?B?cmFqTE1VbWkvR3ViVWZURG05QWJxbjMrWnlKOHE4cHJ6Q1BMN3owNEc3WFY4?=
 =?utf-8?B?aUdNMm9vdkZwcFFTa3hGMW5JdU5OQnJXait6VHU2cDJISHdnd3U0YTYrVHpq?=
 =?utf-8?B?QU9OcjBVbFJRV3poazF2WGEveUY3SmszOURBUEJPblFEaHRsdHFCSml5NndK?=
 =?utf-8?B?R2xEMzd5bGJPL3l3SVRQelhJaEN4ZUI3OFZMdldON3E2L2ZHcGFXazVSUFEw?=
 =?utf-8?B?OTNCZ05UbWM4NEFkRFpkQzhTUzg4MzNVcllkT2dqOGZmaDJieUV4UlpMRnlO?=
 =?utf-8?B?b2ZrL1lNNm9iMXBCZ01Ba1RSekk4TDFnTmpDalY5dVo0UVhQRSs5b3g2NTMv?=
 =?utf-8?B?YXNueFlPMms0T1NGMTREeUpOOVBYenR5dzZPb3I3YjV1M2x5SWJOZHRiQTZm?=
 =?utf-8?B?RXZWKzBDcEtiOU1sUkNjaWFhWEZ0OXU0RkdjNzgydnhINEpUNTFJOWZoTWpk?=
 =?utf-8?B?RkVIM0ZNa1FkNjBDRU13ckVPWnFkRlNESjM3VURsZkFoNnFBU1pROVYxd1By?=
 =?utf-8?B?WERjUlVBb2wyYTNUQ0loL081NVJiTDJoUjl3cmpRSzhEZDZYZlAyTC8wVE5W?=
 =?utf-8?B?SFN3T0psQ0pmeVRrbmtjTldKTnYyL3E4djZ0N3NybktpWFVnYWcreVB6RVhO?=
 =?utf-8?B?elVqQi9qYmlKNk5OeDJOWGwxQ3UxMldRSXV1WnpIdExwL2QxenRCQjdRcEZG?=
 =?utf-8?B?Zm1ObU1XVFBqVzFrVGVTbnRiSWpGd3dzTTJxV2dGYmhDNFFSZUxIYlJkcXk2?=
 =?utf-8?B?S00xOXplUFVsc0pwdE94T2NoYmlTUkpmOVlmM1ZXTTRydENGclVnYit3UCtr?=
 =?utf-8?B?WmYvcC9JZit2WTJDMitMUVMxQzdjZHRUWkEzbmVxc1A2Q243dkxtbHE1d05D?=
 =?utf-8?B?WkFlZ2JtSi83RUU1anhvelgxb0tqU3NlcGJUbGZWTHpyWmQ1K3RPQWFubHgw?=
 =?utf-8?B?Vzl5a2VKMXk1NXNlTXJ6Z2JRZklBNFUwVkM1R1IyY0UwYTNkdDZwRFk2MWcy?=
 =?utf-8?B?elJvaHFkaGJTVFdxaTN4TlFPRFNGdTYxcS8xcStuOWkzcEc1UWtvb1FUWEtB?=
 =?utf-8?B?S3lFNXR1bzl6bGluY2ltRWdXRFhLWkQ5UGh4RXBNU2RIYWRValRSTG9YTjNC?=
 =?utf-8?B?c0VLTUJzSldEaDNjckFiR09INnhaNFVCOTl2Q29ndURXNUxFcTN6RDVYT0pj?=
 =?utf-8?B?QTAzcHltWFlTTDk3WE8ra0ZIYXJRd3c2b3RhVDVZOVN1OHp1U05OdmpCMnZy?=
 =?utf-8?B?K1U3N2lndENhYjJJYS9QL05FcUFJa3BZYjhaaW5zc2RnNTVyZ0xvKzZZMmM3?=
 =?utf-8?B?Vkc3UHpTNkViWW1qRnJlQjI1M1lqdTZLQUNCYzlJbktGd2ZSa2N6OG8vVzFT?=
 =?utf-8?B?R3VxRFZOakhnTE5PZXVDeGdWSW05R0FEU1VBWWtZUnFVRlR1Zzd6T3JUNEVu?=
 =?utf-8?B?d3Q5SndTNHRuZ1gzNWZVcldTcnh3RWRra2lZc0p0QkVDWEZTTEgxVHgzWURB?=
 =?utf-8?Q?ET0EogNVyxxM4KJ3THuWeOTTxkGiO8k4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2pvcmVuZDZiS0RaSWtPMmpDYUdlS2pxWlBkdmRDR243cWZXMGRadjJYZEJs?=
 =?utf-8?B?OUJXQi9yQ1Q1cFJyb0lPbGZjY3M4MTVhTmI5dndGTFMweDdITG9tdlgyTTlj?=
 =?utf-8?B?cStTZkx2MHZ2RU1yMy9VRXlVRFVMN2JwMjgzRkVPRzNTbk5WWGtjVEJzR2pD?=
 =?utf-8?B?UDRlR2lJQTc2dDdCc3hucEFIUjI5MW1GN3FGbzlRc1lGcU9INHU1akNPdUhr?=
 =?utf-8?B?WUNnUGtmL1lweTVxMWRxQ2tOMFdwTWQ4UzJXaUkydlNUZXljRFJiTzBlajFm?=
 =?utf-8?B?K2wzQXAza296RDN6QWFmMTIrQkQ5RVZNNnBKa0orc2RUYWNtemFMV3ByNHV5?=
 =?utf-8?B?MDFwZU5wTHF3QXFiUXo3RTFxZllnZUlHRmlyVTQxS1dxTk9EaVYwZndxdXp2?=
 =?utf-8?B?SWlYbTlBWC91MGc2WGpRdmZTTnpZSXViMDNwRHY0VHZTeXhmYXFSc1BnQWJx?=
 =?utf-8?B?cWtkN1pBOUxWaE43MlI0QVRCaDFRS2Rzc21xQnY5VFhKbytsaDRKYXpnbzhI?=
 =?utf-8?B?MkJ0YXJmckZ4R0VLRUhMYlV0TFBCYkEvSnd6V0dxb2svaXFBdHRmVmNVcFhz?=
 =?utf-8?B?SjArblJ5aEVYNGNvVk9obHhzMjZGdUc5aW04UnZ2ZHFmc3RUbU1kNmJJSURk?=
 =?utf-8?B?QmEwM1Z1UUJkcnQxZllueGN1bEUzcjdSZ3BuZFIyVHR2dm5kMkw0N0hOOUtW?=
 =?utf-8?B?V2tRV09BMFZYYkNxSGRIYXFLcVk5MkRqMXRLNFMzQmhraUpiY05JTjIxaTZj?=
 =?utf-8?B?T0FDWG1JcVdRTGVHU1hha0V5L0JhOEpQYVY1eXlmU2IwLzZ6ZnNYNFFjUWFV?=
 =?utf-8?B?ckN1d0paTkN3Z3F6c0VOL3lmWVRWQVBET3RKcGg5aEpiL204Z3ZQVnNCMU1n?=
 =?utf-8?B?c2VmYnVEK29HWVRPaXpidmpUcjZ0My9YZFg0c3dMT3d4RFlzc3VlMWgvN0Fj?=
 =?utf-8?B?amlNL3o5OVN6RlBkU3E3dzMwUUpPNWhnczFxdDg2blN3bkJQSVJUMnlvUEtM?=
 =?utf-8?B?VjZLQWRQdU9YS1IrUTMvVEVZWkt4eExoQkNhT2l1Q0VYVURTcmtNTDJHZEwz?=
 =?utf-8?B?TUNEaEVOT01EQU9ENzIvZldVaTRsemFPTWtxeFZpa0pQbjcxU09aWndpOFZI?=
 =?utf-8?B?UmZKYlVZMXJoUTIzZ2FzVkIrWTloVGRRa052TG1zbXpMTVhTaHNNU2hWTmF3?=
 =?utf-8?B?QWJRWjRBT2VUNWR2ZHRWQUhOMTdIVlE3SWxLcHNtdGJCM2tUeXdlalVvODZm?=
 =?utf-8?B?d29WMDV2UWQ4OTA1WWJUM1A4SDhaWDM3TE9xRUsxTmlkbW0zL3h4dGRzeGlB?=
 =?utf-8?B?b2g2OCtpcjFuMzJOVVRlWVhHOHVpc0ZzMTAxWkp5QWRETXBVRXJJaEdwMEll?=
 =?utf-8?B?T3lOcDJ2U0VodHIxRW5kajVZVzU5OCs4TnZQZk1aQXcwc3JTeHgrTDBWYnVu?=
 =?utf-8?B?a1ZzZUxZTVdJMmMzbW1KN2RscGtZMjhkeU9MbkswYVY4RzBtOGpGY0NoSit4?=
 =?utf-8?B?R1U0ZG53a0JnYzdBRCtIM21zUG9sT3VMSVVBT0k4b0VhcTJHMEtWYjNSU1ZT?=
 =?utf-8?B?L2ErblU5aVhHcERoSFU5OUxKKzR1OG5SeDZPb2ovakRHN0lJV3lsaVhMOGs5?=
 =?utf-8?B?TENmUkNoZDZDcW1OQytWL2NQK2pxenpoalZRSFFpVHRCcWt4VmlVOGEzaUh3?=
 =?utf-8?B?ZDFzemJrWE5pQkFrNGFaY0NsdjBEY2RLOTJhcVZWZFl3czJrSjFldUROTFkw?=
 =?utf-8?B?N0MzNkNsNm1Fb1dURUwxQ0JNaytjbTZoRkNBV3FBRFA0eTRGK3hOZ2JpV0FB?=
 =?utf-8?B?ZzZndlZzRHZCOVNtcDhtVHlNd0R3djZFbnJrQjNvdk1QRVlnVVZBc2pkejZk?=
 =?utf-8?B?dFBpQzBMTFN5NTNVMi9YdzdPWWJ6akgxSzZXMFBMMnVKQ2hJU05JeEJ6VE5h?=
 =?utf-8?B?cWEzM0FHVEFURWRFeDhGVkFkb0hjY1JZemxiUXRocGMyYnFSdVZnYys2NkFm?=
 =?utf-8?B?QkU3THdDRDFLa3I0am5jREw1ZnZvTEVGeHpXb0NwbVZLdVk3c2p6Y3ZmYU1h?=
 =?utf-8?B?UDlTNUtOc2lzWDBYcTU1emdSRWpkR3hYU1kwREJINUt5bCs2d2hLQTFIVzJl?=
 =?utf-8?B?bzNQNysyMTdQeENuRWN2RUFzcEROZDhtYUNJOWhyNHpJVFYvckJIZHFST1R2?=
 =?utf-8?Q?zRO99Mww2dMFVWUQ0OFfMmU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ca509b-dd23-4542-f959-08de06b568b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 21:55:34.9948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwZ435qgQcceoGJWcgEl/X1ysS+4gdoiGMtnU9tSpxGRNU+Zhnt9KYIt1sztPR/GY8/UMs+D5WIzvPVbwyBAFi8Q8EGxD1bZzBVky0cnWek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8373
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

On Wed, Oct 08, 2025 at 02:17:49PM -0700, Ashutosh Dixit wrote:
>DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE is needed only when input OA
>properties include an exec queue. In other cases the kernel does not use
>DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE. Stop providing the unnecessary
>DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE property for these cases. This is
>needed to use OA units which don't have an associated hwe.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 14 --------------
> 1 file changed, 14 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 0a00105bd4..a028823e51 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -1559,8 +1559,6 @@ open_and_read_2_oa_reports(int format_id,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(format_id),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>-
> 	};
> 	struct intel_xe_oa_open_prop param = {
> 		.num_properties = ARRAY_SIZE(properties) / 2,
>@@ -1877,7 +1875,6 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
> 			DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
> 			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>-			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 		};
> 		struct intel_xe_oa_open_prop param = {
> 			.num_properties = ARRAY_SIZE(properties) / 2,
>@@ -2096,7 +2093,6 @@ static void test_blocking(uint64_t requested_oa_period,
> 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
> 	ADD_PROPS(props, idx, OA_DISABLED, true);
> 	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
>-	ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, hwe->engine_instance);
>
> 	param.num_properties = (idx - props) / 2;
> 	param.properties_ptr = to_user_pointer(props);
>@@ -2241,7 +2237,6 @@ static void test_polling(uint64_t requested_oa_period,
> 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
> 	ADD_PROPS(props, idx, OA_DISABLED, true);
> 	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
>-	ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, hwe->engine_instance);
>
> 	param.num_properties = (idx - props) / 2;
> 	param.properties_ptr = to_user_pointer(props);
>@@ -2498,7 +2493,6 @@ test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
> 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 	};
> 	struct intel_xe_oa_open_prop param = {
> 		.num_properties = ARRAY_SIZE(properties) / 2,
>@@ -2563,7 +2557,6 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_fill_size,
> 	};
> 	struct intel_xe_oa_open_prop param = {
>@@ -2611,7 +2604,6 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size ?: buffer_fill_size
> 	};
> 	struct intel_xe_oa_open_prop param = {
>@@ -2700,7 +2692,6 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
> 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 		DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS, num_reports,
> 	};
> 	struct intel_xe_oa_open_prop param = {
>@@ -3491,7 +3482,6 @@ test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
> 			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
> 			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
> 			DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>-			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 		};
> 		struct intel_xe_oa_open_prop param = {
> 			.num_properties = ARRAY_SIZE(properties) / 2,
>@@ -4008,7 +3998,6 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 	};
> 	struct intel_xe_oa_open_prop param = {
> 		.num_properties = sizeof(properties) / 16,
>@@ -4114,7 +4103,6 @@ __test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 	};
> 	struct intel_xe_oa_open_prop param = {
> 		.num_properties = sizeof(properties) / 16,
>@@ -4593,7 +4581,6 @@ test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe, size_t oa
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_size,
> 	};
> 	struct intel_xe_oa_open_prop param = {
>@@ -4653,7 +4640,6 @@ static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
> 	};
> 	struct intel_xe_oa_open_prop param = {
> 		.num_properties = ARRAY_SIZE(properties) / 2,
>-- 
>2.48.1
>
