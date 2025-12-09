Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22B4D3B994
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 21:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F43710E52E;
	Tue,  9 Dec 2025 21:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mFSTKiiR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B262B10E4E1
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 21:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765315694; x=1796851694;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XJM+bGUS95N2xDtTRb8eG7EW0tbbLrr66yDBIcQ4ng0=;
 b=mFSTKiiRzFIg3zEw4g2NrFSWDmhJrzY/FXHix3hipCEE75vsbFxL1Z6u
 AeqZhCxXp0wy9ezUht3Y+zQjnFm10T+/2DGYDotBoGpV5xFIFCcHfkh63
 he1gnVruoFXUoHByM/1Ubq53PlYQ9aZLAaUOb3Xa2JajdrTEdND1A4OFG
 qLxzpPxGEYJZE/XQGMZA6vSG7bogqE6ltQxaZDkhB5OtJqL4ayEhyTKsn
 NKd2NjCxs725sY1OzKp9W5j0aDuVC2lObiSqbkRDIUqxCTu+CqejoVTmd
 LlczMEnkhzlPUbvOupS8FdO+jUWwP7uv+fCz/bvty7H1HW9xTNrgVrOOG w==;
X-CSE-ConnectionGUID: yQEd7TWxQOumJ1l13XDVPQ==
X-CSE-MsgGUID: ArTYcHatRc6f9JfMdfwhIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67177593"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67177593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:28:14 -0800
X-CSE-ConnectionGUID: A1lwxvt/Q0GRpUzbJfzlxQ==
X-CSE-MsgGUID: oCDCsm/4QNyR5KgXlLF7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196627314"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:28:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:28:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:28:12 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:28:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upRFIoo2vvrLdzrk278XYtXtSicVNnTbKIcHjO+eKjDL/hL2aVkY/ULVyUy1193gWf6YexLIV1nNVXB97nCd5ry2Q1Sb4Qk3P0HlNXhnX/AkV7z8TRJdgoJRrwE/+18UnYw6wofyQIgoxWpp2egS1ZHXRyL2oTKtmkRsYqKFxBBWOGF4Sg3utqaK8iKwol2mrhXv0RnFVUK7Mzt1FSvkk+YbtSNup/OWm1oKlfcnkUj7X6MtzbT0pva4GEHXOJDnIqq2uJVClyoouzZc7m6qNU8SZ3SLoDnIS60F/ebSZU4tvS1E2GRFVfZiI+oTVCsnN4PQkr2je41LUWV6Y7iusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJM+bGUS95N2xDtTRb8eG7EW0tbbLrr66yDBIcQ4ng0=;
 b=LJMROSODZGyCbc3BjrbPEbM3nzj3xZms3hMyiPHLv8Wp3POm3uSDHHBLnbF0zu0yOxBsClXbo1LqXFhVbFqMIXsc1B2Cg0nz2x/JJaSZael4sc1rJaAKzhn9scb8k7cejhlI39Gc96jkbM5ZtXo3LeSZK6IJ296inUdJa86G+PrimbRQou1SIe0yBPchM6BibY2WPGrbs1z5IcHrm/uWk73I+VgA2+/HHeqoBV+X+YwRTbbUQriOd10Q0iv0zyCmYFcC5gmVCB9IVb7JH5gkd/GTHyBDb09jcfYCVlso92xwPN1wiRQC6PrxaMxSOpyc9tFCQ+C5mZrE4gp9lMXe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 21:28:10 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 21:28:10 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 17/18] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Thread-Topic: [PATCH v3 17/18] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Thread-Index: AQHcaLsQm20QUu4D4kSnZCHSxudvsrUZ0/YA
Date: Tue, 9 Dec 2025 21:28:10 +0000
Message-ID: <ef2d49afb738fc09ec5047084f2ac791ac7c5809.camel@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
 <20251209032208.1540217-37-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251209032208.1540217-37-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BL3PR11MB6388:EE_
x-ms-office365-filtering-correlation-id: 3bab6efb-4f65-4490-674b-08de3769da41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TFFHbXd1dThkQkF1a1pzL3lzSEZ3Q200Q0tjaXZGZGUyN3IxN3d6OC91THZS?=
 =?utf-8?B?eURyTFJuZThsYkdNczhVQlUxWHNnOUNQci84T0w2V1h5b2h0M2FFOHIzUEZO?=
 =?utf-8?B?RmEvWkV0dWtBWVdJeU1EZksvcUt5OENpTXNIei9ubWp6TjFpWS9UZkx0TDhi?=
 =?utf-8?B?SytDMlI2YjZHc09xS2M2TXJmbnRDT0tySWxJMzBnYnZrV1d1ZE4wY0U5RWk5?=
 =?utf-8?B?bndkYVJFSWxzTlhRVktMN0FDTml6OGRCMG9NWURIb0MzK1VDbzZva05XV1p3?=
 =?utf-8?B?aFZXcThwMlhmQjVyOUFqSy9uZjdWNXdvM3pUS0JUa2pHRXJnYzFFVkdaWjEr?=
 =?utf-8?B?YTBmTHd6UFA2YTluemtqbCtmanVMb1pWak5hSU0xM2VHbDhlclhYVGI0ZmNl?=
 =?utf-8?B?T0E4QW1FMkx5UjFTWjlMaTU3K2NLck1wY1Z5bGlxUmdKd25RTThYckxLNmg4?=
 =?utf-8?B?ZVBvYy9vNk5nWUpYVTNkZ1hIaWU3QnhMSVRycEYybXlwMG5mZmY0UHRHQ2ZQ?=
 =?utf-8?B?TjB1ZVpCVUZpeEZJTGwrY0l3Q25TbjE2ZWJNSzZ3eS9CZEQrTzViSU01R3VG?=
 =?utf-8?B?Z21Jakp6OGhQaUZ6TG01VHpWRUNSU2lWb2VMdGZrNmlleEd2L3hDK2tteDdw?=
 =?utf-8?B?M29zUEtCUjFjWXpJTWVxb2FEUlNiTGhQdlZhbVdJN3RyTzczNktZQjE5Z2VE?=
 =?utf-8?B?WFBBZ3dnaVVQQWZPZ0J5MnRRK3pDTWhWU1VOQVZlRWY4aElrNkpjTzZJd2ps?=
 =?utf-8?B?VUpWNE54dkZzNTd6eEpLcEMvbkdpdnQvblN6MklzZnl6eUV4dUdNUWQzM0pB?=
 =?utf-8?B?MlhaN1ZNM1l2NmlJZzBVbFhBRkZldVdsNTlFRXZ6cG5VeWIvbmEzZ01Pd2tP?=
 =?utf-8?B?Y1VoOWdVemdRQUFKQ2xhcCtxRkNMWFp1RnhJdm5vQ0toUEJnalo1NzhpRGVM?=
 =?utf-8?B?SWR6ZHQvclhlMk13NDRWamNpVlA0by9iVkdQeTNVQzRDVFNPTUpjRXg4RGhN?=
 =?utf-8?B?SlFyKzFVeUovYm5oUGdtQStjRjB0dzZwemNZWWpZbHVvWFNnWGxaS2tBWVdk?=
 =?utf-8?B?RURGZXhkWnBxalRZS2x1VExTT0syN0Y1cmp3aDVsbmVhKzdyNGxrMXhxdkR1?=
 =?utf-8?B?dmN0VzVIcVRYU1VhY3Z1VUV2Z0l2U0Q1dVpzZ0xwQjRWUEp0MncwTGgramtO?=
 =?utf-8?B?ZWdMVUdxcURvU2puNlVOUWUrWnk3YmQ4S2VEdUVnb3Nhb2VPSElnWGdXRFRx?=
 =?utf-8?B?aGNQYS9MVnFHeVJ6VmpocllXZEJGNzc0QUxoYkRVN0l1YjllUTNCMkk1RHNz?=
 =?utf-8?B?Zk9zOVlwNVQ4SVFXcHVUeEFzS3ByWjBlOTF4R2d1ekNCRkRuR1cybTNHR1Ry?=
 =?utf-8?B?ZUdLYjdIcmNzUi9CNGc3SkJuWVdqV2Y0aHhOSUI4OFlER0o3VkxDU2pXdmUw?=
 =?utf-8?B?YlZTc1RyNlJGaThOTXpUbFUvNmpkSXo0ZHpPM0x2ZklvMjNiZkFZTXRLczhu?=
 =?utf-8?B?U3VNbytFNDBkNG1PMHpaSDVhOXhwaERBOHdvT2s2Z3B5R3BXSjZGV1ZwNGR2?=
 =?utf-8?B?OUwzTDJVZjE3MVJIZ1BaZEo5bkIrejlPamJSV2N3RlJFemswV3phbER5eDZF?=
 =?utf-8?B?eHZhZ3kyMXU1aC9VN2dtcHBQaFpRSlVSK0hnczlHVWdtUGt4MklBR3VRVTli?=
 =?utf-8?B?U3ZrWk5kRUpYT2dWM01HMmZRUElKMjRLcnIreW1Yc2tsSXc4U0ZYSzA1T0NF?=
 =?utf-8?B?dmJ6UlN0NU4xUHBlMVFSY3p5OEkxbWxVaG4wSkdTWW1tZzZvd3lLaHJGM0d4?=
 =?utf-8?B?Q1RrNkZKelpBK3Jhang2ZGxtVzc1S2JTV20wWVl3djVxTWhnTjl4RnpKT0px?=
 =?utf-8?B?MUY2N3FrYUVqYkR5SWV4bzlsRXVCaE91aGRMMGxTTFRTTzF4RUpTQ2R4NEJk?=
 =?utf-8?B?UzJVY3VlVFFoNHNlSWdCN292WVljK2JON1UveStRSU1neXErWTdFR2RYVHNR?=
 =?utf-8?B?RlRMNVliQ2dlLys2ZFBiaDB3Rm5WYmUwSFZFVThkR2JyZ3M5QkZrVGtHRnU3?=
 =?utf-8?Q?t7GVh2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGhxUXQvbkFwSmovUGp3dURlU25xVXFSYlgzdGlWQXppK28yVCs1QkVJejRR?=
 =?utf-8?B?aTY0cUhkZVBDTFRGM01nUnVEMFpjcUxLa29xdXhlUEp3WlBid0IrTUc2UHRi?=
 =?utf-8?B?UEgzTmtvazJOVFF5djM1ZjQ1YW1nOU8vMjVnT0FhSXFwZ3F1YS9hL05xR0Vp?=
 =?utf-8?B?ei9CdzV0c0pBNThYUVl6aVIvUHZzRlNGcnlxQnhWdlJXeU96aEZNc1VKR2xZ?=
 =?utf-8?B?Zzk2S0ducG5HcXg1b3VEUGU0VHYzeHRSODQrQjBuaU16RGd2ZTRHYk9BTkEr?=
 =?utf-8?B?Q1B2Y2pBRFNveXBELzdGN01iWkVPeERORDBHbjdJaUp2RllHcDM3Q2s0dWtm?=
 =?utf-8?B?QTJqRE9kZHlQZ3lmN0ZRa1cwSWNCNU1Bc1Q2a0FBYk5ZY2U4WEM4UHdqRURh?=
 =?utf-8?B?L3RxSXlHMkRwaTArYk11NWZQRlRpdmNkbVVIK3NMREFlZWVPcjQ3dm9hNzhP?=
 =?utf-8?B?V0JjZDNhU3poYndoV05sNjlkdFd2Vkk1QzZia2lWdFNiNWtkZjRUYXY4YllL?=
 =?utf-8?B?QlFnMTJHeGVPejVad09QTVdLSDMrT1c5SC9XNjFZaEVUTjZLOUZ1L0hPcVJC?=
 =?utf-8?B?QXZUeStnZDBRWXg1SFFLSTM0em5KejZLOC9HbzBwbWM2VzhIT1N1UWVLcjBJ?=
 =?utf-8?B?WDJ4dFdjclJJam12b2tnRXU3NGQ0anlNbTRYNzhpV1FndEViUmcxNzVXNzU0?=
 =?utf-8?B?WHFYWlY1RXZ5N1FzVHlqN0ZYd3VtUk5JUVh2eVYxbklMS255cDFyUk9jc1lp?=
 =?utf-8?B?N0g3d1lVMkNUS2RWaEUwNWh1ODZnaUdEeXV1RG1JZ0F0Y3JKUUM2aW1sSTVN?=
 =?utf-8?B?blBCbW96MlpBaDlxYlB0eVNzRkorYnA5NlNkWlFzUmdSaERQWUZVNWRXeDFz?=
 =?utf-8?B?cFJBNTlGTVZFOFdSTGw4dkRReXFQZ2RvbU1rRzhib2pHTXBFeEZseTU4V3pw?=
 =?utf-8?B?a0t2ZDR0bU9GcEE0WGJXd2tERG9sVk1TZW8xYW5UNmYzQi91d0tQazdXcGg4?=
 =?utf-8?B?UU9TeU1mR015S0hjdHpySVhFaHo1S0tOaUFkM2FIamZPdHAvSXNNc2UrRVRt?=
 =?utf-8?B?ak5zcHIxMXJ5eUJ5ejJzTXBuR3d1WWZMaXVvbXlKazg4ZVJIOVZsMFlFc0tj?=
 =?utf-8?B?UDF5bnQ5VW9aVVEvcFdVWWxLUGRRWStEVXRIemFFVzdDaEkrME84TmZ4TnNE?=
 =?utf-8?B?ZGRPWWxzak03UmhrODFzdVVjYjZYWHZWRzFwbkduM09DUW9jYmFZZmlZdVBt?=
 =?utf-8?B?dVBFVlVtMExhcHMzenAwbzMwSVFTK3doalo4T01Wek1iQUMrZkR0RU9uZDIw?=
 =?utf-8?B?UEtJZW44T1dBZ2VBdjlrWnVkR0lpaDR6NGVBbXRvckxhSU1hTzVrY3R0UTBD?=
 =?utf-8?B?aGVNL0daVlI4emdaeXhoS054R3RXMkxsNXZOckVLQ2psbXhqTUpyWUlCMTBQ?=
 =?utf-8?B?My9MenJwR0JPdUFTRUFwVVcyZmNYUkhmZ29Wcm9kWlV3bm8xNldsR0piOG5j?=
 =?utf-8?B?UEZmL2VLNnRYMzIwUU1waktIaWRWV1hxVjlhbnlwdkFFcXRZb0FXSUNzazRT?=
 =?utf-8?B?QTdldWFuKzBCQ1pEdHFSZEYrbm5CdzJnRnc2dUFMekdtb2lXZVZMNFRXQjFl?=
 =?utf-8?B?c3UwY2IzYXQvYW5DcEY5OWdWRlJHNHhYNDJPWDU5cU9DTFNSMGl6L2VmY0Yx?=
 =?utf-8?B?Wnk3T1cwU3pEWFZwSFBBdlB3Z1RickxaRTd2dmpkT0xod2pRdmJEN3dTWEhI?=
 =?utf-8?B?cHl2TUJGR044bUNzR1dhdCtvNldUMHpNNzc4NUd3MXZaWUNQcmxaMERDK3M1?=
 =?utf-8?B?Y2JPcGdxVE5OMlB3elAwdmFDSU9YZmlpVGhoV0dscWVhUnBkY0l6Mi9Ed1dw?=
 =?utf-8?B?OVNQU2IwVkpWMlB4QUJ0QnNMKzV3RGFpeGlxRkZ6Y0xVdDRsWG1rRGVWQzV4?=
 =?utf-8?B?TEpnQTYwdUp0YmYraXlHVzMwYmtkQmRQMDRLS25YbFlvcklWMjNyZnY4ZlVz?=
 =?utf-8?B?N3pWekgxaEsrSWpsSndlSXp4R3U1cDk3MmdNdGhUb2FIb0FqK0l1R2xQWFBX?=
 =?utf-8?B?eG9ldDI2UG9DQTBFNnpXTTdySlQ0TERyeUM2dXJxMDk4eFUyempsUDBXZVBF?=
 =?utf-8?B?bDlaWnBteFk4ZFZ1NXllSlNKMlBhS0VnTi85SDEwYXhLNnhxa1VlNkc1OUNI?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A2FD9B7C38237408EACEDD983465E6A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bab6efb-4f65-4490-674b-08de3769da41
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 21:28:10.5941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nuPuTUpAD95eYUPaXUdwO6Tfnjj8cOuYk6zT77+W84cY2zE3qPChvpt62azG67vo4Y0cUx7/Ze8ui/XMAQ33eSeWCOAKnMcpVqiBVcv/gwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
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

T24gTW9uLCAyMDI1LTEyLTA4IGF0IDE5OjIyIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEFkZCBEUk1fWEVfTVVMVElfR1JPVVBfS0VFUF9BQ1RJVkUgdG8gdmFsaWQg
ZmxhZ3MgbGlzdC4KPiBWYWxpZGF0ZSB0aGF0IEtFRVBfQUNUSVZFIGlzIG5vdCBzdXBwb3J0ZWQg
aW4gcHJlZW1wdCBtb2RlCj4gdW5sZXNzIGZhdWx0IG1vZGUgaXMgc2V0Lgo+IAo+IHYzOiBSZW1v
dmUgcmVkdW5kYW50IHByZWVtcHRfbW9kZSBjaGVjayAoU3R1YXJ0KQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEKPiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVy
YUBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJz
QGludGVsLmNvbT4KCj4gLS0tCj4gwqB0ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMg
fCAzMQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVs
dGlfcXVldWUuYwo+IGluZGV4IGNlZGUzYWJlOS4uODNmNzg0MDIxIDEwMDY0NAo+IC0tLSBhL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4
ZWNfbXVsdGlfcXVldWUuYwo+IEBAIC0zNywxMCArMzcsMTIgQEAKPiDCoCNkZWZpbmUgRkFVTFRf
TU9ERcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDB4MSA8PCA2KQo+IMKgI2RlZmluZSBTTUVN
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDcpCj4gwqAjZGVm
aW5lIFdBSVRfTU9ERcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDgpCj4gKyNk
ZWZpbmUgS0VFUF9BQ1RJVkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDkpCj4gwqAK
PiDCoCNkZWZpbmUgTUFYX0lOU1RBTkNFIDkKPiDCoAo+IC0jZGVmaW5lIFhFX01VTFRJX0dST1VQ
X1ZBTElEX0ZMQUdTwqDCoCAoRFJNX1hFX01VTFRJX0dST1VQX0NSRUFURSkKPiArI2RlZmluZSBY
RV9NVUxUSV9HUk9VUF9WQUxJRF9GTEFHU8KgwqAgKERSTV9YRV9NVUxUSV9HUk9VUF9DUkVBVEUK
PiB8wqDCoMKgwqDCoMKgwqAgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1hFX01VTFRJX0dST1VQ
X0tFRVBfQUNUSVZFKQo+IMKgCj4gwqAjZGVmaW5lIEJBU0VfQUREUkVTU8KgwqDCoDB4MWEwMDAw
Cj4gwqAKPiBAQCAtODQsNyArODYsOCBAQCBfX3Rlc3Rfc2FuaXR5KGludCBmZCwgaW50IGd0LCBp
bnQgY2xhc3MsIGJvb2wKPiBwcmVlbXB0X21vZGUpCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghbikK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiDCoAo+IC3CoMKgwqDC
oMKgwqDCoHZtID0geGVfdm1fY3JlYXRlKGZkLCBwcmVlbXB0X21vZGUgPwo+IERSTV9YRV9WTV9D
UkVBVEVfRkxBR19MUl9NT0RFIDogMCwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgdm0gPSB4ZV92bV9j
cmVhdGUoZmQsIHByZWVtcHRfbW9kZSA/Cj4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUg
fAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJN
X1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREUgOiAwLCAwKTsKPiDCoAo+IMKgwqDCoMKgwqDC
oMKgwqAvKiBJbnZhbGlkIGZsYWdzICovCj4gwqDCoMKgwqDCoMKgwqDCoHdoaWxlICghaW52YWxp
ZF9mbGFnKQo+IEBAIC0xMTksNiArMTIyLDE1IEBAIF9fdGVzdF9zYW5pdHkoaW50IGZkLCBpbnQg
Z3QsIGludCBjbGFzcywgYm9vbAo+IHByZWVtcHRfbW9kZSkKPiDCoMKgwqDCoMKgwqDCoMKgbXVs
dGlfcXVldWUuYmFzZS5uZXh0X2V4dGVuc2lvbiA9Cj4gdG9fdXNlcl9wb2ludGVyKCZtdWx0aV9x
dWV1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnRfZXEoX194ZV9leGVjX3F1ZXVlX2Ny
ZWF0ZShmZCwgdm0sIDEsIDEsIGVjaSwgZXh0LAo+ICZ2YWwpLCAtRUlOVkFMKTsKPiDCoAo+ICvC
oMKgwqDCoMKgwqDCoC8qIEtFRVBfQUNUSVZFIG5vdCBzdXBwb3J0ZWQgaW4gcHJlZW1wdCBtb2Rl
IHdpdGhvdXQKPiBmYXVsdF9tb2RlICovCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHByZWVtcHRfbW9k
ZSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2bTIgPSB4ZV92bV9jcmVhdGUo
ZmQsIERSTV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RFLAo+IDApOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBtdWx0aV9xdWV1ZS52YWx1ZSB8PSBEUk1fWEVfTVVMVElfR1JPVVBf
S0VFUF9BQ1RJVkU7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnRf
ZXEoX194ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0yLCAxLCAxLAo+IGVjaSwgZXh0LCAmdmFs
KSwgLUVJTlZBTCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVl
LnZhbHVlICY9IH5EUk1fWEVfTVVMVElfR1JPVVBfS0VFUF9BQ1RJVkU7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHhlX3ZtX2Rlc3Ryb3koZmQsIHZtMik7Cj4gK8KgwqDCoMKgwqDC
oMKgfQo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgLyogU2V0dGluZyBvdGhlciBxdWV1ZSBwcm9wZXJ0
aWVzIGFyZSB2YWxpZCBmb3IgUTAgKi8KPiDCoMKgwqDCoMKgwqDCoMKgbXVsdGlfcXVldWUuYmFz
ZS5uZXh0X2V4dGVuc2lvbiA9IHRvX3VzZXJfcG9pbnRlcigmcHJpb3JpdHkpOwo+IMKgwqDCoMKg
wqDCoMKgwqBleGVjX3F1ZXVlc1swXSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgZWNp
LCBleHQpOwo+IEBAIC0yMTksNiArMjMxLDIxIEBAIF9fdGVzdF9zYW5pdHkoaW50IGZkLCBpbnQg
Z3QsIGludCBjbGFzcywgYm9vbAo+IHByZWVtcHRfbW9kZSkKPiDCoMKgwqDCoMKgwqDCoMKgaWd0
X3dhaXRjaGlsZHJlbigpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHhlX3ZtX2Rlc3Ryb3koZmQs
IHZtKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgLyogVmFsaWRhdGUgY2xvc2luZyBGRCB3aGlsZSBr
ZWVwaW5nIGdyb3VwIGFjdGl2ZSAqLwo+ICvCoMKgwqDCoMKgwqDCoGZkID0gZHJtX29wZW5fZHJp
dmVyKERSSVZFUl9YRSk7Cj4gK8KgwqDCoMKgwqDCoMKgdm0gPSB4ZV92bV9jcmVhdGUoZmQsIHBy
ZWVtcHRfbW9kZSA/Cj4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUgfAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1hFX1ZNX0NSRUFU
RV9GTEFHX0ZBVUxUX01PREUgOiAwLCAwKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgbXVsdGlfcXVl
dWUudmFsdWUgPSBEUk1fWEVfTVVMVElfR1JPVVBfQ1JFQVRFIHwKPiBEUk1fWEVfTVVMVElfR1JP
VVBfS0VFUF9BQ1RJVkU7Cj4gK8KgwqDCoMKgwqDCoMKgbXVsdGlfcXVldWUuYmFzZS5uZXh0X2V4
dGVuc2lvbiA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgZXhlY19xdWV1ZXNbMF0gPSB4ZV9leGVjX3F1
ZXVlX2NyZWF0ZShmZCwgdm0sIGVjaSwgZXh0KTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgbXVsdGlf
cXVldWUudmFsdWUgPSBleGVjX3F1ZXVlc1swXTsKPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAx
OyBpIDwgTUFYX05fRVhFQ19RVUVVRVM7IGkrKykKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZXhlY19xdWV1ZXNbaV0gPSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIGVjaSwK
PiBleHQpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBkcm1fY2xvc2VfZHJpdmVyKGZkKTsKPiDCoH0K
PiDCoAo+IMKgLyoqCgo=
