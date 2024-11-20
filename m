Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423C6D63923
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 10:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDBB10E051;
	Wed, 20 Nov 2024 10:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpYNeEwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B69E10E051
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 10:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732099321; x=1763635321;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R5zHqBy3mLtAGhiEc89uxYcQ7EJ1aqeSqfMz9HeShoU=;
 b=HpYNeEwWEGiL7TdGLMawaDaipeo2KYtEfnQ9tij9mNt+wlm3IhTUjjWB
 dVnur5u8eRO3ZRMZASY7jHXs/m4TH9X7anbSc/N2rImpyB6NAO1kLsiUR
 Rh8GxAqV/kTCl0S5k5d2USLwH/v63K9nVV4uRLSjcKvn02YEq8YThDBLh
 Dheo20Qwr0qJ81qjDUzL9b1pkDHL2tySb5grUOL211x53L+sl9pjOODNk
 91ekSU/MWtO20sU0G8NIm97y675064BWwo/NidxVwMrmswAVospYifMJN
 jETQPVIlttr+c7r8CMS6zH5XiJPOCOBzB982eazEMd90BU7wgdRDzA4u5 A==;
X-CSE-ConnectionGUID: 9KYII2fDTlW9MOmiS38QsA==
X-CSE-MsgGUID: oRZVRYqeTIGPSOSY7DlrMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42770052"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="42770052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:42:00 -0800
X-CSE-ConnectionGUID: nAxmWGUcQxSNG+ec/Y10aw==
X-CSE-MsgGUID: jURxDHWKTaug8FHScnianQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94936302"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 02:41:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 02:41:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 02:41:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 02:41:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmWy++1NxujSx53hdNs3ikGwKPEOEb7OwxpSkIFhug50xs+IjpVOAquBw7MdCjUTbk0yivEeMly7C4NAQ5b8QwGHJdz8wXDPK8D9+BwpAovE7bFaY+UrqT2sTDORw9shdUhKFsZ2QdBi8GywHRdBObUvDloyh/BlknCnJ6a0BxCgHw1vr5hIBFxDLAulKRBwnycFE2qQ7GijTZh42K+bOSQgAKPS+svJ8KzzoN+zhuCf0SDKkr2BZsCsiWIFLWKrOqXOwVV9eOvnTg948rcP1QjDe8saJHqn80TNRpZTlTeW0/Rf5kUyLCklUf29J3OSUrNAs3518orQl656gRrVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oYFIFkOhSD2wd6wFegCS5gIxDhdD2ls++ggFO0q0a4=;
 b=kZHh10jxWEKZZhvONdGnU892bLJ/cA7xr0nVHpgUsa6Gxft/G6nfUtYAGHJV+KL8fi2Pstme1sHNiZ5A6BDNAC3sCoK07oiEOPravOz85VPPN/eX/+Rzp+TnD70uF6s/TLpl8Onq/VMrQZt/N/maonvii2hjjDTjLi4F5tH4Ea/HZcj+YuO71Ln7aNeb+jvvoXE+BIL2XyRYsApOTUAHQxby/qLJ5O/UJlWIsBsyF+CKFW6cZhvxKfV8HTqM5+v3/5vno7HMkOhf9pLfltMGjKk65ZfyfX/ZZqAyAX+92jSVLwgAgOnOLxadq4OO5aa9aMYFFUU2guP8zlCbRmmaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Wed, 20 Nov
 2024 10:41:54 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 10:41:53 +0000
Date: Wed, 20 Nov 2024 11:41:45 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Ewelina Musial <ewelina.musial@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests=2Fsyncobj?=
 =?utf-8?B?X3dhaXQ6?= Update invalid-wait-zero-handles test (rev4)
Message-ID: <56sgmxecdsudkj2e2ymmn6b7lhe2txh25fooixmxw2nyheimfp@no7oum4kyte7>
References: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
 <173198054111.107654.12011343560311556000@b555e5b46a47>
 <20241119204703.vxegpjleoritqkfn@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20241119204703.vxegpjleoritqkfn@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|PH8PR11MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 1591ed66-40c6-4b13-1fb0-08dd094ff2c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0NUK0FjK2hTbUVnUEYyTEZFOXJ1YnpPR2tzcnliV09TaGxrMVVwdWFmSkhD?=
 =?utf-8?B?YUVvMlM2cGlXZmRTaml4Z1FLNU9FZVl6b1NGR0V5U0ZueWNaaFN5Q3NleVZm?=
 =?utf-8?B?TzQ2aFdZanNNNThpZ1podTNnY2FsUzZiOWprdDlFNklJc2JhYlpvNkljT1pG?=
 =?utf-8?B?WjN4OGR1UlpjM2RiRlZMOWtqMk16QUoxMWQybUR5QUlJSEx1dG45S1BCM3Np?=
 =?utf-8?B?UXBCN3c5L3ZmNnVWRVFERStUbWRzTnV2VCs2NDkxV3NxbUdIdGVNY1BoNEY3?=
 =?utf-8?B?WFV5OW9udWJFeC9Jc3ZFSGtJWG5VRExDa3JRVnNMSjErOVF2TWVPVmRmdnV0?=
 =?utf-8?B?QjhEL1ZmQ1hZTzVRWnpKOVlEMUgzSWlYc2ZVV2tGY3RMLzYyemZnTGVmMmx4?=
 =?utf-8?B?Z05FaUlMQmdhUkpHbW5UKy9HekF5SGRpemxMV0ZHbVJ6ME54UWNyaEhVeUFD?=
 =?utf-8?B?dUFmR2VkL2R1TnpKcmtTOWs5RnRhWWlLYUlBZVVpVHVjRFRSMitVQmtQdjhN?=
 =?utf-8?B?UkhNekRUSStOWGV3VzY0MzB1dldWMnZISDZwMzBENmE4RUcxOTJQTFZWbGxU?=
 =?utf-8?B?alhHV2Q5b2N1NC9sZG9qRVMzakp4UytVUUlBU3REdSt1Vk5lb3JJaGJ0RXcw?=
 =?utf-8?B?MUVOcStwTjQ0NGVDa3BEV2xYRFc5cDQvMTJBekI4U2F6b1h0eExCazhpK01D?=
 =?utf-8?B?ZTN5UVcvSHVKWXNWVjhEZCt0OVRyaVpmVzlNY2ErdWJFUmhsK0tQV2swMFJH?=
 =?utf-8?B?ckFJczZESzMwenQzL2ZuT1VGdjE2V2RZVVV5SnVNcE94cG5WNG0yQXpuZE1T?=
 =?utf-8?B?U0t1SUgzUlFmdllMU2xVMURqV2FIZTFxTEFnVWZWM0xuNDRFSGhSelhLRjZl?=
 =?utf-8?B?OEIvSVFTTkptNXNDRS9JUEZsY0JBbVNpTzhwa0daM0VoYjlWZm9UdFF3YzZ3?=
 =?utf-8?B?V2NLNDBtTlV6VVREaDhnTS8vZklBVG5raFV0b2NhOERLWlYrN2JsdkYzcG9v?=
 =?utf-8?B?dXd6TW5wWVZSL0l4UHBjaW1uT3c4NTJMM01oNDB1Q1Y5U1hnVVIxSjkwbXJF?=
 =?utf-8?B?ZU9Eei9nakZrWno5eHFZZVNkd052Z2MvVEh4NHh1dUFLbFgvVFFOVXpkRnJO?=
 =?utf-8?B?VlNWbHkzY1hwTEVVWjFvMFRnNFIxTWxLM0xIRzdqaFpNVHlpTDIza0pCN0xX?=
 =?utf-8?B?STQrTU9WRVM0MEFaTmhjR1JJS0plemZYdjFsMUtDbGdZdzA3aFY1Um9IRzRB?=
 =?utf-8?B?QlRLaEV2bUZIOHE5RFU0SEg1S2QwbHZibVR2MmtYUnpvOVFvRFhmVXRLQi9M?=
 =?utf-8?B?MVozVXZZb1l3WmIyVkRDbVlOaW9oTFppVndFNkNJZXFGbzN3V3JMUUxKUFpv?=
 =?utf-8?B?TFhObll0VjRKYUl5RTROZ0t4YURoVU9KMmxJQzZtcVhncVk0T0xpWTI0eDZZ?=
 =?utf-8?B?KzBveWZxSzBnNVBuTmYxZHk3K3l5WkJoQjdIK2Y0c2ZxUHhHWTR1ako2RGNU?=
 =?utf-8?B?QXErZlVxcVlsUTJFUnNZbE9FMXJWN3p4ZG9zSU1hN2tkU3hQeTRCbUtwUTkr?=
 =?utf-8?B?VFlmaFBkeENOWFFJRXdianVVVDJPSmtPUWIvRUJWNHI3YzdwWW1hZ0trazNj?=
 =?utf-8?B?dTVxQW1DMUJHWWJrSmkzM241MTZ5QUQzYTJqZjJ1d05DMnI4eWdHYW5lbk9G?=
 =?utf-8?B?VWJNckxsSDFScVN2dGNQOElIclR4Qmc5QWZMdkNiQ0J6YUZ1cTF0NFRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THZJMEtIdVdWVHZwOGpadUMvMi83QnhFZnh1RE02RzZ4dFhjd0lsbG9sNkRW?=
 =?utf-8?B?a0JmRGZldk5yOFlNbDRGQjlUVEQ1YzZ4MWtQYXlOdzlMd3ZvbXo5Qm9vckxL?=
 =?utf-8?B?UkVpZ0RDMWVxUGJ1UWF5Y0UwalA2aDk1bkRaWThiWE5TTG9GS2FxSVozVFVK?=
 =?utf-8?B?SGl2R1ZyVXU5YWhwcFN1Q0p1N3Jsb0s4Sm84akZ3RHJ1Z1JYWjdlSHlDNzFr?=
 =?utf-8?B?Zi9TLzEyQ2VnZGoya1dQc3o3T2tySXM0cVo3UjRweTZjQllvTWFHdmZVOFVi?=
 =?utf-8?B?VVZyOFNxOUpRSUdnT1hFVEFsVWhYdlNNSkc0aWQ0NFk0eFJKM0J5eGRuSnZF?=
 =?utf-8?B?Z3g5cWMwN05za3Byb0JyQ0pSVU01VVFLekt5MlNzQlowY0V2bmlURmZBZkVB?=
 =?utf-8?B?K3JHa3pwanNrVWorZFVxSEtYcktCVkVQb0FGdTFRd2Q3SWE2YmN0MW1TMnpL?=
 =?utf-8?B?Tm5GajVRemh4ai9CQ2NXc3FvVmsydGxTU0dYZEhBTVVkd3VZYkVHbTdSV3lS?=
 =?utf-8?B?UXM5L1J3UENWR2ZyQm9kbHZxbkdNYU04Ty8wbnlaZXd6Uk1EK0llVmVqU0Vu?=
 =?utf-8?B?TUUzL05Wd2xpMWdIb2trbU5ncm95ZWkvMjdQSDY2K3ZLd2YyaEdlZTFRUjkw?=
 =?utf-8?B?b2E2V09pdTBjUHAzdlNlaWRxSDdJS0pVRkxQMEliNk4zNEdQcGgxcVpDcDQ1?=
 =?utf-8?B?Z3Y3NUxMZXlTREdvc0xhRURGT1FYSTlxUlkxUHVkc3ZYZEJVTEtKVkg1Ylly?=
 =?utf-8?B?VE1uaXJxSkdqcWFzVGUzam54cUVkZ3dDY3NaMGZlZlUwNkdydHZ0NWk3bnB1?=
 =?utf-8?B?WjQ0bFZVUUJ0ZFdKaVU4amdONFZxcFNwSUNsNWpQUmc5cnRvVG5hY0hUQTlD?=
 =?utf-8?B?M0RjVjA4U2lOQkRhYkVDV0daN24wS0RIOXlxc2FzSG9NMVVsK0VLa3hjdzZD?=
 =?utf-8?B?WURRN3IzUFhkdEExWHFOWHYxb2dSd0pDUHFiRUR6VWR1cVIrMXlUczdYSmFY?=
 =?utf-8?B?b2dxald3clRZcFF2OGhhcDBrYldMQmJwQjdyMjdqR2xxTUc2V1dPd0FaM1Ur?=
 =?utf-8?B?aG1jZVpZS1I2YWQvL2pDRzJPVml0ZU5SdUpJZzRNM0d6TW12NDRmRDd0Y0dx?=
 =?utf-8?B?ejVuZ3VqWDMvbEJGSVRzSnROMTBNV29CQTZFcTlXNXpnRWtGOE53THhZemEv?=
 =?utf-8?B?eENyc0Y5aDJPa0J3UHJteCsrSTZmeUVOcHE4VFFkK1lyeUJnY0VPK21yQ01a?=
 =?utf-8?B?alpOZ0lOTjhMWS95KzFGZXpWZ2dmWkpOSC8xZjR1UlVObTlwVWxZeWtlYkpM?=
 =?utf-8?B?ZlZUTUE1N2lSa2Q1T1ZlbmJLc0doREs4U2h5UGxWLzcrZDZtUXc5NmRIRkJq?=
 =?utf-8?B?WXptOUZLUnJpWWhpdWE5UVRSM0pVcjAyUThsR09qbVNncUpBRTh2YjFQWFBr?=
 =?utf-8?B?Y09DZ2pvYStickxqVzM3dUhWRGw0MnhGMk9WVFVRSm5ZVm5sZDVrTUtPbi90?=
 =?utf-8?B?bEhOZkFVL1ZPNkU5aHFOdFJEaFRmTVdKV0FBT21WendueTdDN1NRQmt3R3Ra?=
 =?utf-8?B?L2hpMWFhNExsMnB4ZmN0SjRPZ0thclhkcXZ0cjhzOEYyWnZOTlpKaGF4NTFO?=
 =?utf-8?B?U3FmZkpKaVcyMWFOeFJoNFloWEY3cSsrYXd6L1A1UlpXbHRUcUdlTFZIUDdO?=
 =?utf-8?B?QmZBajBqNlBPY1NWZ3B1OEZqa1NEcUpXYUMzajk2Znlscm9ZNG9jY3hvUXB2?=
 =?utf-8?B?dlNndUtWRHlxTlgvalpSNGVWNU9UQlQwNWVuWmIrNUg3VjFjZ0k4eU9ySmhx?=
 =?utf-8?B?TlBWWjZ1djVQc2k5dVRRY0lIZlF3U3NaWGlmL3l2b2w5cXY5dlA2ZXh6cm15?=
 =?utf-8?B?dzNzNG8wTmVabkxhdUpkKzlBOFRqOGNDWUp5ZDM5STB6UXN0QnhGUFk3OTFo?=
 =?utf-8?B?T1VDYmVzZnZnTzFQZFRBQmRFSWk5SXYxVGZRbjJhZ0lKWks0VUFRaU9WM0tx?=
 =?utf-8?B?enpwem9KZmFXeHFmbVA5VGVoSzBzYjh4QjA0ZDVHdStPMWlEamVxY25Ca3NQ?=
 =?utf-8?B?QW0rb2hwUE83UlYwT2hESCtkQnJ3RUxkRFZSTVd6L28vRGlvdk9PeVF0S0Y0?=
 =?utf-8?B?WjB3Sy93M0lla2xJRzZOcVAzU2ZldkE3Vm42djlMVVNHczFZSlJWV2EwZXQ3?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1591ed66-40c6-4b13-1fb0-08dd094ff2c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 10:41:53.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIC7EwaDs8R2vG431LkpuNcZJKSuo2+ROISqRwZqoWzyGXl0EEJrq9dos5RWndVV+76nZUvAhR1eQZu9/LuLD5F3mMvaUUC5xrrRK89JBrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
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

On 2024-11-19 at 21:47:03 GMT, Kamil Konieczny wrote:
> Hi igt-dev,
> On 2024-11-19 at 01:42:21 -0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev4)
> > URL   : https://patchwork.freedesktop.org/series/140727/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from XEIGT_8115_BAT -> XEIGTPW_12127_BAT
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with XEIGTPW_12127_BAT absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in XEIGTPW_12127_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   
> > 
> > Participating hosts (9 -> 9)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in XEIGTPW_12127_BAT:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@core_hotunplug@unbind-rebind:
> >     - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
> > 
> 
> This is new test and it is present in CI.BAT for i915:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/index.html
> 
> However, when looking into combined Xe.BAT here:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-all.html?
> it is not present there.
> 
> Is xe-fast-feedback ignored or not updated in this combined view?

For now I've sent a v2 that also deletes this test from the xe blocklist
- this might have been the reason it didn't run here.

Thanks
Krzysztof

> 
> +cc Ewelina
> 
> Regards,
> Kamil
> 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in XEIGTPW_12127_BAT that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@kms_flip@basic-flip-vs-wf_vblank:
> >     - bat-lnl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#886]) +1 other test fail
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> > 
> >   * igt@kms_psr@psr-cursor-plane-move:
> >     - bat-adlp-7:         [PASS][5] -> [SKIP][6] ([Intel XE#3443] / [Intel XE#455]) +3 other tests skip
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
> > 
> >   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> >     - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> > 
> >   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> >     - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2229])
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@xe_live_ktest@xe_migrate:
> >     - bat-adlp-vf:        [SKIP][9] ([Intel XE#1192]) -> [PASS][10] +1 other test pass
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
> > 
> >   * igt@xe_pat@pat-index-xelp@render:
> >     - bat-adlp-vf:        [DMESG-WARN][11] ([Intel XE#358]) -> [PASS][12] +1 other test pass
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@xe_live_ktest@xe_bo:
> >     - bat-adlp-vf:        [SKIP][13] ([Intel XE#1192]) -> [SKIP][14] ([Intel XE#2229] / [Intel XE#455])
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8115/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
> > 
> >   
> >   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
> >   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> >   [Intel XE#3443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3443
> >   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
> >   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> >   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * IGT: IGT_8115 -> IGTPW_12127
> >   * Linux: xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4 -> xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
> > 
> >   IGTPW_12127: 12127
> >   IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >   xe-2248-6abefc8e3bf638090d5277bc3e6fd02bb25579a4: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4
> >   xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12127/index.html
