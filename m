Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B82AC369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 16:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DED010E24F;
	Tue,  8 Apr 2025 16:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bANneBXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C107C10E24F
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744130842; x=1775666842;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=8mVKRgQVZpdFXuPfk6/zDY7YfCYYtksqGOzd1ZUN/6o=;
 b=bANneBXbFI/eX1mrBI2Wgo1Wz72AOuSFz07MUBF+ciSrRSjgXwbcU8kM
 h7rwwo3e8SqF2dJ++HBFZax1Uz2Vy8S/ING2vvUgyhdiYrZs40rBNxGEb
 QANsosWX7Vf+eMXxRwkMO57tABr1VfC6M+ZM0bSw2r9SMm94A9MTCZsg9
 R9F2JwajxL61KSoZ4AZZDrLqzIfmCIEKVvZ9Y7qhIx4gvl+ixPSYYlQPq
 UtyYViZ3LDpmM65xPjZmsxPaC/NqeW4TWHVvwwhS26ph2asj1xmwJw0ar
 KK0WGEhqB7h0Id3BDDAt2+aMxkeKnB9CeDxsk7HeoKsJB5bQ4m4Zpw+vM A==;
X-CSE-ConnectionGUID: +aoAkhCETXebvIKQG26LBg==
X-CSE-MsgGUID: pOTJ0lHWRvKQwX3g+i6uqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45462725"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208,217";a="45462725"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 09:47:21 -0700
X-CSE-ConnectionGUID: CulKLQXaTauamGdbVno/fQ==
X-CSE-MsgGUID: LmntuEdISfub0u2btb6TYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
 d="scan'208,217";a="128828616"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 09:47:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 09:47:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 09:47:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 09:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmSb+inw3qdgmQv4aVJ+/Zsquq6AyvewwihCRuuB49hj22HNyw6BFNYc08CDxPjWCZHxoGXjb2ji30g9+/vOWy6AyuuuCzb+DOtJsAnk+qV9Zr/NioMSUIKQSAXuwiIzk/gGWKECd+2VFWWEMSzYXiR95rVtaBFEqQKuQwa+yDwyA+owFtKqA9275xabvS2bL7iayvoAIzRIG8PP/SfScn5nZNe/PSFRd3Hla1vjt1EeFK9idvxLbxGH2u3Z0ULjV/UfWT29r/GsVHm5JLFQjwU0UmgncomsnK4O9dkrOxlY+Zi1VwmiQbQRX8vPhXjIoJnqJs30SGslYaV7tEAkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khXY0Wd8ygspEyhOfc+lOUVIQot/8mk3SpFssRsrRcM=;
 b=rJ37f0kS2x34LHebJhly+CtRHWvvecTuGOTyp3TIZNFhjjUUW+qYoHDNFyC8AMooZGZXAE/xXpB4I2VmT95Mz1u02T4A36IpyllDF/ldsg3N2K/RWn93jgEErPmUSjuBnMzAb78/bMI1URDLt0KKouOX5WHNoz3+HqoLRXcRqA2hL5SMfjJYgU+8OjwMDaTo6/dnaRjLY43SpAQ8fxp9J+FJ+lCBOG+z0A/cwViErvsIg74UvMReOOYoYLeo5sYUZG9LWCI40ikXISEiIJVmfRxzRLbugV00HBFj9IebAV8xDHBnDce+69b5qeT0L3Gt5nvXcbfWQc8Nfgr3PtMFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by SA3PR11MB7584.namprd11.prod.outlook.com (2603:10b6:806:305::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 16:47:16 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 16:47:16 +0000
Content-Type: multipart/alternative;
 boundary="------------9nVMy02ozHNZzeFus07dbFe5"
Message-ID: <cecf3a77-dda7-4d62-b400-a29c99cc317b@intel.com>
Date: Tue, 8 Apr 2025 22:17:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/3] lib/igt_kms: Add mode restriction check for
 Intel scaling
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
 <20250327205301.3400440-2-ramanaidu.naladala@intel.com>
 <DM4PR11MB631277D5A542425D801C0F7390A02@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <DM4PR11MB631277D5A542425D801C0F7390A02@DM4PR11MB6312.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|SA3PR11MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b869dd0-ef84-454e-a647-08dd76bd04a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlFNUDRWalBtbk9aYVo4bWw0MFR0dUorQmlFLzdZUWdDazdCTzVZaUo1dUN0?=
 =?utf-8?B?TFc5eFY2ZmtXTmNQcjhaN2crZWRCempIUDZlSUpZTWZheGZzY2Nha0NtZUQy?=
 =?utf-8?B?elZEa2JoQ3ZQdmdoQk1vSUF0YjhqaTZhYnJKQ0FOczlMQVUvelpPNmp2c0ow?=
 =?utf-8?B?alowMU1EQk1KUUtFOFFhTWpOM1BVYnlTd2tMcGlQOEVVNk5LQkhBakRlZDUy?=
 =?utf-8?B?c29pUWZxeTFrbTB3aWdnUkNHTDJWMEVBSGZORFRGa3Y5eHBSamlEL2tLZmRq?=
 =?utf-8?B?b29tMVVQS2VmT3NjWGFmakFCM3NyUUszNmIzQjZCTGtld0RYUlNudWVCcHUv?=
 =?utf-8?B?TjZiNkZ4RHBlZDAzUEdMaEhyeDV5SUlHYUIwQ2o3WU9lWlYwWll4eG9Td3NB?=
 =?utf-8?B?Vk5lOFJlcXU0bm9obkE2bWJVV1VMT1ZOV0hYWUNGVzlEbkc0ODlKQUI5U0tC?=
 =?utf-8?B?YWJvdUFncFlzZmlNVkVUeENCd2dwYWM5QWQzaE5RNVNYTnNlWDVoVlVicElO?=
 =?utf-8?B?dWl3cC9PYlZ0MGJ1MlpDQUNyZHRwZEpTZ0ZodGZyTG1XUTBIN1R6eXRVdXpD?=
 =?utf-8?B?SFNKWXlQZ2FzUnNCU2dQaW1HMUtSMUEvSTUvb290WERJVWNvdG5mcGgrM2lr?=
 =?utf-8?B?dVRLbDlKd3NSS0VSakhyYXFOZ3g5bmhqbm83a0NFYUQycWJKNGsvb05qY3Va?=
 =?utf-8?B?RFMxNWJ5R0xWYzNLQ2l1eXI0amJKL21pVG1hWHh2c3djZ3BDT1RieG5wTmhL?=
 =?utf-8?B?MkNDQXhyNlowV29GdW0rNDJuRjd4VXIySjlBU01ZditrTy9ueXNjUUQxaFJD?=
 =?utf-8?B?ZXdWaE00aEQ3bHphVk9ZU2lBYkZTVDVWak9rdnFSWGZQOGROUERGdURpVGZT?=
 =?utf-8?B?Sjl0WkxwRXdSRW0zb3N3R1NmaitMZ2VDMXFZeUdSZlZtZnZ5TTFLTHRKcFA4?=
 =?utf-8?B?QmlMenBmRDk0czBBRVRUd2tYVVRnaXJTRlp5dExwNXJCY3ZSakJ5UFFsZXZW?=
 =?utf-8?B?YU15UEpyME1nZHQrekN1VkZLeDE0eFl6VzFTRlNONFlKZVFES2RWS1hOVnNV?=
 =?utf-8?B?QnE4RWZCay9yUlprVUNlRlI3eXBqSzFKbUlEZmxqSkpSSDNaWXQ5eVpYbm5Q?=
 =?utf-8?B?YmNDb3RGcHhXYnlUbjdZcXkwcThiWE1ER091eENhMmhUc0p3RHovTWF6YjlT?=
 =?utf-8?B?RUxObFNpcmhBeCtYOTQrcnBCdnZ4SlhXY3pqbHhKSzZ5Q2d0TUdCeStHR1My?=
 =?utf-8?B?bWE5R01vSG50eVUwUkpNa3hSUkc2dlBLU1Y1T1RsQlBFK1hVUHFEWGdtbitU?=
 =?utf-8?B?cHhGVHIwaHp6MTZiZ2h6SUJqT2dEK2JkMjMxQnIyczhCa0xmL3FkRUpFejVv?=
 =?utf-8?B?cG5ZY1RDTU9YMUtoS1NyWkNqZlVja1A3bjZ2TU1PcXoxTVNsa0x0bGtsRXJ2?=
 =?utf-8?B?OU5icVlUajdwWTJVOVR3V0J6WkloQ1prZFliS3dMK21LWEFDNVRTcmlZS1Uy?=
 =?utf-8?B?VDR0aUE1WDV6MS85VGw3SWJES0c4MmlscGVCa1hMOHIxY2RTaWhESDVENWp3?=
 =?utf-8?B?THNhZ3d0Rjh5VUhiNmVQWXF4cmlFQitlUHduMVhXK0oxUksrOHFZQlNTSGZu?=
 =?utf-8?B?K1k1WnJIelN3dnhmQ1NYTXNDcWVaOWM3R2J6cWhGcFdpRnBYMG9tU2d3MDVY?=
 =?utf-8?B?clJXSDU0TUY3dzZsZTZyaTZ5d2ZEZFdYWk5GRUI5ZnZaeWw5WUczTGMvS0Nx?=
 =?utf-8?B?RGJ6OXZ4eVpLT0pCM29yQjlpWDRiMnNHRS9lS2hIQXpWOHJ6dTRIbVNVMldV?=
 =?utf-8?B?bjc1am9sUC9jZklBenpxS1N4d0JvMjR4QWF6NStKR3M0aDZjTUxIdVppVW9N?=
 =?utf-8?Q?MikuVFdagsFti?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akkxK3IrMStkTDY3UzN4dlE2YVBOelArK05Za2l2UWNrb3d3LzJ1Y1hOM2ho?=
 =?utf-8?B?Wk81WEpCbTF4czR1eTRESGt6VG16dGgvc1lBQy9jT1dtT2hKL25EUTdkRHRT?=
 =?utf-8?B?dTloYUVic0diYzU1eGhFTVdabU1mTTNZd1p1WmpjcWdtaWVCbFR5K2NIcjUy?=
 =?utf-8?B?NE8vV1JlNFF1SkpZNFVGSVJJaW8xakpkRWxzSDFMMGF3OC9WazRJbXBJRTRV?=
 =?utf-8?B?OWlsbVJXOHo1UWc0aEVFbWJDMXhPVmZTRi9PQ0VPY0R3Q3lHaUxOY1ZEM3ZP?=
 =?utf-8?B?Tk1vaEFPa0tjK3FRSFlGTHNORzlMc2ZkdFVJeUZNSzhta1JybUYrRVFCb0xJ?=
 =?utf-8?B?UStWNjdKTjRoZENpQ2FrWnF6VDNUTGxJcVJRbzg0aVlJamRlREFsN3JvWE1K?=
 =?utf-8?B?OXNvSFNqYkZpWFpRZHFrbWpteHJhV1BYWUtGbG9lNHFzRGVGSXgrbHU3cHBI?=
 =?utf-8?B?WVhrQjlyRjV5UDVHc0luM3ljeSt3bEF1QS8zQ25Ua1Jsa2VrcUdHZkNkRGdx?=
 =?utf-8?B?ZE9NMXdWSkNTbHd0cWx3ZDFZbGZSbzhtQzNXbmtkK0M5R3BiMXNYY3kxUFBN?=
 =?utf-8?B?NVZHNDZSeVlTVFRMYzhFbkUzNENMRzBSblArWEJ1RVpKVjA2MWswM1pBdzNG?=
 =?utf-8?B?cFpvNlp0WVkyRmkwb2k3OHVkRnc4bFJ3aVBsVzhZdnIwaDhhYmF0UnVOMm9C?=
 =?utf-8?B?Z0dUcHE3akw3VkRFdTkrS0MyZTdvQzFvUCsvMjVNYXZqeVlFaG9jejZYMGRX?=
 =?utf-8?B?Y29NSVZvZnV2Y2dLOWVsck82ZFcxNGcyMXlhSW1pYkdoUzRLblBFZW9pN0lO?=
 =?utf-8?B?THR6TkVmaVBNSXRDUmUyeFhPSG1UZGV1MnpuVnYrQ3gvS2l5bmhCU05DTDJQ?=
 =?utf-8?B?NWpiMU1kcDdXZmFxVUQrcWNxSUlwZEhCUXNlaUdERFVrZVVPaERQejV2N3ZU?=
 =?utf-8?B?aTFSZUUvTDJGeGY1THdleU91Mlp5YlJxb08ra2xEb25TNHByZ2FyNHRnZG52?=
 =?utf-8?B?QjJ2Q2hkeElveXU5MkRlTGFFUkc3U0dxbDVEczI3UzY5TmU4ZWdmOE1KMVg4?=
 =?utf-8?B?TkYxY09JbTY4SytjMmEwcUhKZmwyOVZRaUxUakVTVFhMbjUvWFY1NFcyZ2FQ?=
 =?utf-8?B?L3BKM3FpZHExQ0ZObkhLSzBTcTdNMFdKWWNkRThGc0EzbUlFeGNscUdsSkdU?=
 =?utf-8?B?YS9iLy80Vng0WHAwdzdOUGZIdk1QUlFPUEszR2RwSjhVS1RnZm5CSUZBMVlp?=
 =?utf-8?B?WkdpR2xDbXJXRUpGMXpmdnZBcnVEa2ZEUjVGWDlleW9YcVJrTHArQ2ZXWHh4?=
 =?utf-8?B?cTU1ZjlnQVpsN3BIZ09hWkNUV1I1aG5TdlRUdmhyNkxpTWFsU3R0OXhQMGpW?=
 =?utf-8?B?QXE1b3RYdndURmgyUkxjOVVzVnNQUTA3b3h0OGdaaTJPZ3NIbEhuV2V1OEYw?=
 =?utf-8?B?N2hTK0RLWk9xZ1kvdEk2bThFSE5yWVBNTzNqZW5CY2RzVUlNYnVJb3E0Vjl0?=
 =?utf-8?B?bUF4ZkxaekhDRnNRRjNpdU9OMklGTGxvNWNlSmF3eUIvL3ExNk1GME84MkdT?=
 =?utf-8?B?U095U3ozNXBoaGVyZ3ZZaFBxSjhtcmlPdmhMMUV4Y1g0UjU0YW1OSHJib0Vw?=
 =?utf-8?B?MURYSEtsNCtWd3puNFlwbldiWlRkdjhodlF0c1o0b1plb3cyNWtDRjZ1Sjlq?=
 =?utf-8?B?OGpOOXVBckhqSUxaeEkvUWpiUTEyRW12MjhYaUxLRXRMZUJ1RFhiY3JKMnk1?=
 =?utf-8?B?Y1B6YzZpYXJTSUxhTWlBOGFmM1cvaURDRVdCZGVWOVFvZGJJbTcwRlVqa0pa?=
 =?utf-8?B?ZDlLVExaT0x2OXc2Sm5LV3ZHTzgwRndLaVhKZnczZjdWTDFHVmNrUjlUYnI2?=
 =?utf-8?B?dWNHOVNiYkJoZzgveGtERTFsSkFDcjVLRnVHaGJiUndXbFpTRlMxNmx5YW5j?=
 =?utf-8?B?Y08xQllYUHNvRlhnZVJKbXZqRE9KRVJCeUpMVUFJbDBydFM2dmZLb0lNR0RN?=
 =?utf-8?B?ZWsya0RZNWFhZ0FxSHc1RW1WMG02empEa0h3d1M3NDZkdmZFZ2htUHhYYTlV?=
 =?utf-8?B?eVlvQXlidFZjRi9Wclp1RFVyZmVGNkFqVE9HZ3g5OTZteTZWNU9KRUttM05s?=
 =?utf-8?B?ZmQwS3YzQVNhREc0eWhWY01tL241VExNeEhLQ213cGcwR21TamdjVXBQaGU4?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b869dd0-ef84-454e-a647-08dd76bd04a8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:47:15.9670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +o3XFUx3KZYxm8Hs6DsNKZBwlXFyGzZ8lCOja4iXLXd+WOdVLINxEkUHRyQVWc1sjume1angvV8+NTmiti3aXSya0u1pCllPbgipVILNs7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7584
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

--------------9nVMy02ozHNZzeFus07dbFe5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeevan,

On 3/28/2025 2:21 PM, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev<igt-dev-bounces@lists.freedesktop.org> On Behalf Of Naladala
>> Ramanaidu
>> Sent: Friday, March 28, 2025 2:23 AM
>> To:igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2<swati2.sharma@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v1 1/3] lib/igt_kms: Add mode restriction check for Intel
>> scaling
>>
>> Add function to verify display mode parameters (horizontal resolution, vertical
>> resolution, refresh rate) within 4K limits for scaling operation.
>>
>> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
>> ---
>>   lib/igt_kms.c | 23 +++++++++++++++++++++++  lib/igt_kms.h |  1 +
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99c8707c7..332f6dbf3 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -93,6 +93,10 @@
>>   #define MAX_EDID 2
>>   #define DISPLAY_TILE_BLOCK 0x12
>>
>> +#define HDISPLAY_SCALING_MAX 3840
>> +#define VDISPLAY_SCALING_MAX 2160
>> +#define VREFRESH_SCALING_MAX 60
> Can you please mention the spec number or Kernel patch where we have this restrictions mentioned ?
As per Bspec: 49199 Pipe scalers maximum horizontal source size 4096 
pixels.
>
>> +
>>   typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char
>> *value);
>>
>>   struct igt_connector_attr {
>> @@ -6998,6 +7002,25 @@ int get_num_scalers(igt_display_t *display, enum pipe
>> pipe)
>>   	return num_scalers;
>>   }
>>
>> +/**
>> + * is_intel_support_scaling:
>> + * @drmModeModeInfo *mode: Pointer to a structure with display mode
>> information.
>> + *
>> + * Finds the display mode's horizontal resolution, vertical resolution,
>> +and refresh
>> + * rate are within the specified maximum limits.
>> + *
>> + * Returns: true on success, false  on failure  */ bool
>> +is_intel_support_scaling(drmModeModeInfo *mode) {
>> +	if ((mode->hdisplay <= HDISPLAY_SCALING_MAX) &&
>> +	    (mode->vdisplay <= VDISPLAY_SCALING_MAX) &&
>> +	    (mode->vrefresh <= VREFRESH_SCALING_MAX))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   /**
>>    * igt_parse_marked_value:
>>    * @buf: Buffer containing the content to parse diff --git a/lib/igt_kms.h
>> b/lib/igt_kms.h index 0381c82ad..0e3d1297d 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1279,5 +1279,6 @@ void igt_set_link_params(int drm_fd, igt_output_t
>> *output,
>>   			   char *link_rate, char *lane_count);  int
>> igt_backlight_read(int *result, const char *fname, igt_backlight_context_t
>> *context);  int igt_backlight_write(int value, const char *fname,
>> igt_backlight_context_t *context);
>> +bool is_intel_support_scaling(drmModeModeInfo *mode);
>>
>>   #endif /* __IGT_KMS_H__ */
>> --
>> 2.43.0
--------------9nVMy02ozHNZzeFus07dbFe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan,</p>
    <div class="moz-cite-prefix">On 3/28/2025 2:21 PM, B, Jeevan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DM4PR11MB631277D5A542425D801C0F7390A02@DM4PR11MB6312.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: igt-dev <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev-bounces@lists.freedesktop.org">&lt;igt-dev-bounces@lists.freedesktop.org&gt;</a> On Behalf Of Naladala
Ramanaidu
Sent: Friday, March 28, 2025 2:23 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Sharma, Swati2 <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>; Naladala, Ramanaidu
<a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
Subject: [PATCH i-g-t v1 1/3] lib/igt_kms: Add mode restriction check for Intel
scaling

Add function to verify display mode parameters (horizontal resolution, vertical
resolution, refresh rate) within 4K limits for scaling operation.

Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++  lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99c8707c7..332f6dbf3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -93,6 +93,10 @@
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12

+#define HDISPLAY_SCALING_MAX 3840
+#define VDISPLAY_SCALING_MAX 2160
+#define VREFRESH_SCALING_MAX 60
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can you please mention the spec number or Kernel patch where we have this restrictions mentioned ? </pre>
    </blockquote>
    As per Bspec: 49199 <span style="color: rgb(64, 64, 64); font-family: &quot;Segoe UI&quot;, &quot;Arial Unicode MS&quot;, &quot;Lucida Grande&quot;, Helvetica, &quot;Ubuntu Light&quot;, &quot;DejaVu Sans&quot;, FreeSans, sans-serif; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Pipe
      scalers maximum horizontal source size 4096 pixels.</span>
    <blockquote type="cite" cite="mid:DM4PR11MB631277D5A542425D801C0F7390A02@DM4PR11MB6312.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char
*value);

 struct igt_connector_attr {
@@ -6998,6 +7002,25 @@ int get_num_scalers(igt_display_t *display, enum pipe
pipe)
 	return num_scalers;
 }

+/**
+ * is_intel_support_scaling:
+ * @drmModeModeInfo *mode: Pointer to a structure with display mode
information.
+ *
+ * Finds the display mode's horizontal resolution, vertical resolution,
+and refresh
+ * rate are within the specified maximum limits.
+ *
+ * Returns: true on success, false  on failure  */ bool
+is_intel_support_scaling(drmModeModeInfo *mode) {
+	if ((mode-&gt;hdisplay &lt;= HDISPLAY_SCALING_MAX) &amp;&amp;
+	    (mode-&gt;vdisplay &lt;= VDISPLAY_SCALING_MAX) &amp;&amp;
+	    (mode-&gt;vrefresh &lt;= VREFRESH_SCALING_MAX))
+		return true;
+
+	return false;
+}
+
 /**
  * igt_parse_marked_value:
  * @buf: Buffer containing the content to parse diff --git a/lib/igt_kms.h
b/lib/igt_kms.h index 0381c82ad..0e3d1297d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1279,5 +1279,6 @@ void igt_set_link_params(int drm_fd, igt_output_t
*output,
 			   char *link_rate, char *lane_count);  int
igt_backlight_read(int *result, const char *fname, igt_backlight_context_t
*context);  int igt_backlight_write(int value, const char *fname,
igt_backlight_context_t *context);
+bool is_intel_support_scaling(drmModeModeInfo *mode);

 #endif /* __IGT_KMS_H__ */
--
2.43.0
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------9nVMy02ozHNZzeFus07dbFe5--
