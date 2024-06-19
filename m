Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCDFC27C79
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 15:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDB510ECFD;
	Wed, 19 Jun 2024 15:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRXyoPLh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B8B10ECFD
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718811235; x=1750347235;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=j/EHg9YwuQlaPMeKyQvTCCAXuKsszuolmrN264oCXQU=;
 b=jRXyoPLhwt4728yuBzamxl+FYv9eoSJ7Tu/GX6vVNfzCWAQxUxq48aeE
 Uz1vz+ucUfFyncITb/sQUNSsJOEjliNL7kvVe/n2931kiNryEccZAQ/g8
 sTew2+tOt4R4OCoQXbv2Jgm7QjonhjSNbfSt4DRO86WegImtE+HanZekg
 w7E6Oo2bTpFIVRAEgmFVAy6xibWtkFJDwIV8sCrqbpKnUBp1MvUuQOU+M
 A8kBGHi0Eo7p4ZmN+maSuI9t66ZPlPHWY/OG5VPasdyEYkhgWoSpXevZ8
 u5sojp3Wl/KAJUfdgo3Qzg1ihP57Zerpd8icyNC2yjjcbunKJ1jPR1dnm w==;
X-CSE-ConnectionGUID: EtNIDyFBTXKHxH7KIMa35g==
X-CSE-MsgGUID: 5/JrjMRwRP6Wl2ZbTGyPdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26395325"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="26395325"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 08:33:54 -0700
X-CSE-ConnectionGUID: h+kQdHfuSoWXA3+ifr/07w==
X-CSE-MsgGUID: tt10fyoqSIei1rJgoVeF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="65198804"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 08:33:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 08:33:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 08:33:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 08:33:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsRVOr4vBgYupwP0s4UvRdvuCQnq2ciHLW36f8phexyOCZa2B07DwrCDVSGoJ/RtYypkI3V4YdCKavQUehWbEOi7vRfgrYv96CE1GusgyaJ7QZWN1lgvy+Q+4/JeCAYnUgla/ob3G4ki8+GY3tCCYuewUurUSOVkNo3paplvaf9Ec9q1byZLXVKiQSB4oTcubOQzrtYFWZorTov7461B48E2y053fWhSpK2XwoRUJxo7iQt/yKLojBrgX5JSBe+Fe19GiGz6A2EDOhZNhUrzkIXh3LNnyANL0DZSoJfQ2GQGrjCz73VrPHaPi7ikHiEXXWOWPRkwkUpgZqQDN6Ur9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/EHg9YwuQlaPMeKyQvTCCAXuKsszuolmrN264oCXQU=;
 b=YjLJlnU4nMhGSbZJFMcKvrRNUken6WkovRXgR6L/USW/LFxhyanwD01hhcL4zD7cnloAXhU03/hXHICBgmJHsRRgklL45FwGUG+DTiCjHeOLAQBaBM7WGZsJEQq3Ao/+Nuoz8O1Y7q8TbgxEJXf7Zou14OjC4AG1eOIEZb7V5RFjvg0VmJ+qQ1LXoVJ0/PFgy3vmD0D1wpZDJjjj/3RGRBZf7NPRRPisKBr97V7bvCBrdht8fClIr0il7padKhMiwuVTcOJ/sJGltQz771fhhinVxNH7w3epMLjx1PSeZ0A50dAWLy7ttjfZ6gWLYr23Fa7z2rkRGxx9f/b3cUVI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA0PR11MB7188.namprd11.prod.outlook.com (2603:10b6:208:440::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32; Wed, 19 Jun
 2024 15:33:50 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.019; Wed, 19 Jun 2024
 15:33:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Thread-Index: AQHavLeNFuLwhCW1NE6sxuFlTAR6VrHFgxMAgAm/IUA=
Date: Wed, 19 Jun 2024 15:33:50 +0000
Message-ID: <DM4PR11MB63128B2380F2295C35CB35CE90CF2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240612110645.1110374-1-jeevan.b@intel.com>
 <20240612110645.1110374-3-jeevan.b@intel.com>
 <0638aa69b474837dc2d0bde5ec3a3235567a36e0.camel@intel.com>
In-Reply-To: <0638aa69b474837dc2d0bde5ec3a3235567a36e0.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA0PR11MB7188:EE_
x-ms-office365-filtering-correlation-id: 0d8b54c5-eea9-47d8-a036-08dc90753828
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?djFtdE5yNkk3WmZlRXJvenp1YW5pdVFmTGF4V0VScytkdWtHeFBJWis0U1F5?=
 =?utf-8?B?RmdGYzZ5Nk9ub3FPYnBnTXk0U1AyYUlqKzBrSWYveHFUaDRFZnJFWmhMcFdz?=
 =?utf-8?B?SXRNaE0xS1RKT3E2VTVPU0hCeHJPSlk1SXZWWm5McXVkMUdmQUQwK3E2T2p4?=
 =?utf-8?B?RlM2ci9VUWI2MmVxRjA3bTh6VzZoaDVxSFFlZHhtSU1GRHBIYmZSS0FpZVNz?=
 =?utf-8?B?VzdWZFlUYlJyMjY3Vi9PZ0llSUxsUVlpZ0ZnNDlRNkVvRkkzNlZtVWEvRm9k?=
 =?utf-8?B?ZnZGUk1LdHZTSUtGU25YRjhKSXVvQnVwRUEyTHdaNkxBd3dxMk5xb3FjUnBn?=
 =?utf-8?B?YjBQcU1rMk45OFFWN3BvZnBSYU9IdU9xanJ0RnMvMkZoUmo0OWttNWg2UHNi?=
 =?utf-8?B?NVlWQWpwdjU0LzVIQlptQ1I1THhNWGhwYkpqN3g4RzVYbFhLZFhVVUhIbitE?=
 =?utf-8?B?M3FnbStsRkdvbGtvSGNFa2FrQ1lVeWIwWlllZCtZTCtHNTNNZTk4YVBtK2tV?=
 =?utf-8?B?dG1BZVNzQzJnbkV6VnFleHg2Z0RyWVAyek5QMXlkVmJkVDBKTFIra1BQRyth?=
 =?utf-8?B?N2I4ZDRCZnM0Y0wyNkx1ci93cHJ2RkFmaS9aVW9zbStOaWljVVIzUnI0eTF4?=
 =?utf-8?B?VU43SmFWbFVKWnhBQ2R1MU55MmRpdEVYSHNYcTVXbEp2cHZTNlp3eDFMeXJk?=
 =?utf-8?B?b3RTSkozdElYVUYyTFYrQnI4b0QxMTJwUUN6L3VmWlZiNzcwSk1UMlY2Z0N0?=
 =?utf-8?B?VlN5dVBYdmo2VUdTcWVlU252UDhlL3NLdFVOQ2dJSGFIam5TWnMzWFI3Y0FJ?=
 =?utf-8?B?aGh3MXJmU2R5RGl5Z0VTazlpZnVlbzhlU3l5aFhmaTNxemxhaUptTzNtakFr?=
 =?utf-8?B?VCtwbjFkakJ4TitsbnFKQ1B6bEhxZjNDODUvOFdSQUwxSk9HNFVFT3I4ZTVM?=
 =?utf-8?B?L0pGbU83Uld3QnhpSTA5Z3JCV0Y2ZFJCbEVFRWFrN2trTkgycDRCSVNuVUt3?=
 =?utf-8?B?RTFreGpKMVZMYkFuNXIvNnArdWdSMHE3dmExQzZoOHlvS2huRXUrNDVkRzR1?=
 =?utf-8?B?ekhXcy9UUXh3TzhKdXRLRE4xdTBCcm5TR2gzQ0lhdXYwYXBkNVZHV0pCU2Zs?=
 =?utf-8?B?UzlVclh3ZTJHZ3BKTXBOS0ErWDFGYmpxakhJM3BwTUphaXlhVDVZaHNTYnEr?=
 =?utf-8?B?elAyV2c4eVo0djh4SDBKazJ3Qm5XZ3c5VXlFOUVrUHlxdXJkeitVbWF3MHZN?=
 =?utf-8?B?NmtOU1BpSEVYczVGYjczZlUyelViTkd6Z3RIMmhGYVBabkhEeXlwNGp0ekRS?=
 =?utf-8?B?eldlOU81SzBEZ0c2enNmNFh0MFg4bVRHTlVzV2FCSjlHZ2ZOVkxGbVdOOXVF?=
 =?utf-8?B?YklJNTN4QmNESGFIRlVjaERrUmdGcVh5amQrS0o3aHJVK05UbnR4OUVPZzZB?=
 =?utf-8?B?aUdvUFltdElmYmRSRUl3SHNnUk95YmppdmhZVXVBZ0xzVEJ5UTF4Szd0V056?=
 =?utf-8?B?dDgwQk5vM2ZtT2JORFIvRnAyVDdLdjN1b20zQVJRam5VMmZmb3gyV25sYmZE?=
 =?utf-8?B?aVJOTDdzOElNZmdJeXpXbkk3UVIyMTVvMjZTNW9QOWZ5RkVPVmwyZ09vT2tY?=
 =?utf-8?B?dGxsc3haWGhxdFNuOVRTWHZVTDl6eUtuYUZ1SCtQZncrVkhTUWJQK1gyUXpu?=
 =?utf-8?B?NS9LNitFWDZ6QmZSTkpXTHhtZVd1WStTWWxJaGVjY1ZDUXU5ZW03bVZ1U2Qv?=
 =?utf-8?Q?L/usPG4MtPisO8Qupzb4atVlqO8AssRmOHUmPDI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWp6elZqZERQU2dIakZORDVrZkdrK1pSTUYrOFc3ZTNHR3pWa2hKcUdGZnFO?=
 =?utf-8?B?Sk5vT1lBOWhUWk80b2pJSmZtVnhaUG1hWXErbGZnc0Rhcit3ZXltcWc4NXRS?=
 =?utf-8?B?NTBQbWlZZEVYL0FybVRZSVNqekY2Y3hwQklQVE8ySkd5K0oxcjVaY3FDSXNK?=
 =?utf-8?B?VzdlZG1IWWdEeE1WM0RVaXdsOG5HakRoQlNXdEpFcWNxZU5CV0VKSG44dENp?=
 =?utf-8?B?eDNJdVJUTlkzdklDdkE3Q0FzdlplZ09rSStQM0N1REpzb0h4Wm9hNEZEUncy?=
 =?utf-8?B?ZXJyWG02S093NFNKV3pCbnNuWUlCQUd2WG5DbkF6M0UyVmJ0NDRYSThQVFcx?=
 =?utf-8?B?SE51b3NyOXdHSVhZYXU0aG05Zzh5NjYvYVJhdDFXTTl2T2o4T3lIR0Ywamhm?=
 =?utf-8?B?dW1XZ0FyWkpTRWlkNm1zY1ZyTWtoTVFTekhIMXVrN2lVblRCdFJOK21WWGJ2?=
 =?utf-8?B?Y01VOWJKUlZsaytTRm1hUmZ0aFZhVHBDWjlrOGp3bHNuSkNEaDF0ekVlVzNr?=
 =?utf-8?B?em1xS08wNWFudS9ydUxQNnFtSW4wMDRuaUJyMEJabmFGTXVUTVp0ajFZWWc1?=
 =?utf-8?B?WllXVDIvT3NKU3BFdG0rQXEzUkUwUGdEQ0xuMkdZQk5iVVlHWVE1dHNEbVdo?=
 =?utf-8?B?aWkzazNSRTNqRS92SVhnSFU0NjlLZlVPTjl1WHN3RnNabDhaSWhBVUJDVi9i?=
 =?utf-8?B?SGUxV0dnR2dTd0ZZRmlQYktDOHh5SFRTSTNNYnFoUkx1YVFWOFdTNE4xSGtn?=
 =?utf-8?B?SGUvMlFpdFFaa1hueDZTUmpxbzVobVkvdUtNLzBxRzNTUzR2a1pkd0hBcGhU?=
 =?utf-8?B?aVI2Q2NadHhZTzZDaFhDU3hQZ0NFbUdIaW5yS0Z2OThXVlVWQWxzTk9tTklT?=
 =?utf-8?B?WWtLZGVrNU53ZHFYeHlUY1o1Nm54cW1HbDZUcnN1WmNwY2g1TytoZlFtVVlk?=
 =?utf-8?B?T3BqUW9mQUpiWGtEYTVGRU1KUEFta2ZpaG42V25Bbm04WlRicHozR1QwMm94?=
 =?utf-8?B?Yk5ZSytxU3d0akFuWnR1NjBuWDJFSlhHRnV2Qm82c2dUbzUxMmhxbzZtRk5u?=
 =?utf-8?B?ci84d3N6NFZ5NWpjWEpzcmxGeTI3YXpqQTRRalVaNnY5VUhwNzkvOForSTJ0?=
 =?utf-8?B?cnNNWC9XdHQ4TUlObTJidFJ3eHpjM1htdTZ3cTBLSG41KzJ2eWZaNVUwQW9I?=
 =?utf-8?B?cnVCblN3YmFpQnBTYlBQQVV0eDZHd0ZVejd4RlM4N2IrbEErbDBKbVE0ZXQ0?=
 =?utf-8?B?UDh2WVFiRHJlMU12L2hzOHVDSEJzeHVtaXBQdWQ5VFVJcnZGS0l4N1hSVnVS?=
 =?utf-8?B?VkJFSDhLTXZmdFZKVi91V0RXb2w3TkNXYTdUM1NZMXhybWFxdGJHc2oxeEZx?=
 =?utf-8?B?YWpydmNMd2hCSW5HK3JxRVUxTExJdEtTd3gvNHh4Z0pvejFwcExJdWxSc29a?=
 =?utf-8?B?akpUWTUxSGN5SXZkZUpJWmdzeG85dzhodkNIVGRNZFJid3JyVWc2dTJpSm9H?=
 =?utf-8?B?NTYyWjZVS0hBTG84WDl4MTRxOFRsODJrRmEwaUc1bmtDZXc2c0FoZWQzcWdN?=
 =?utf-8?B?NlNOcVBuZHhHTFg4b2xrUjV5NHJQL0ZNbXVHaWpUalh4cmtTUEVjaWlOaCs5?=
 =?utf-8?B?MlZyZktSZmV4b1I1VnFIOWFFOGQzZ3UrZEhodlJCUU00QnBoYnptaklrV1o1?=
 =?utf-8?B?WHE1enZva1RZUHpqcHNQQVFOemE4cjdIR0hPMW1UVFdzbkhSQlNlbDlFSXAw?=
 =?utf-8?B?elJ6bG90bGJtSU1qT05xbnU3c2htSnJwNFZHZC9rdTVRWEZLSWhOM3NpRHcr?=
 =?utf-8?B?ZkZ2YU9KL3NGOENLdDMyRzc1V1NvMFl1azBhSmxFTk03bHlnR2pvYUk5VE14?=
 =?utf-8?B?UktvMnVDWWxXblJrL3RtVm96NTN1WWpWaTVRTCtHVC91TDlVbVR6b00wUDQ0?=
 =?utf-8?B?SEhER2NCS3FrT09ONVFDL0MwKzBOTGlwL1kxeDFwUFRBTEtzUTJ2KzZQcnJB?=
 =?utf-8?B?ZDNEbzFmeHU5Mi9ncndwQ3Ruak01WTJhTkRveUI0YnI1ZXBmYUxKU3kwblFC?=
 =?utf-8?B?bnI4b0l4M1pkU1B2blo3U2ZLRzdyb2JmWTdTMUE5eWcxK2VjT21sTlI2eTVC?=
 =?utf-8?Q?MLis=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8b54c5-eea9-47d8-a036-08dc90753828
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 15:33:50.7087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9PFQv9UlOJzkCEqXFjPY3OtAeEJIBi8gqWILv4QmuQqrRPXHIskI5RL5Ojk5ZNt/RPzGgaPWLCGw1AeURRsWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7188
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIb2dhbmRlciwgSm91bmkgPGpv
dW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1bmUgMTMsIDIwMjQg
NDoxMiBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEIsIEplZXZhbiA8
amVldmFuLmJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IDIvMl0gdGVz
dHMvaW50ZWwva21zX3BzcjJfc2Y6IEFkZCBjaGVja3MgZm9yIGVhcmx5DQo+IHRyYW5zcG9ydA0K
PiANCj4gT24gV2VkLCAyMDI0LTA2LTEyIGF0IDE2OjM2ICswNTMwLCBKZWV2YW4gQiB3cm90ZToN
Cj4gPiBBZGQgY2hlY2tzIHdlYXRoZXIgZWFybHkgdHJhbnNwb3J0IGlmIHN1cHBvcnRlZCB0aGVu
IHdlIGNoZWNrIGlmIGVhcmx5DQo+ID4gdHJhc3BvcnQgaXMgd29ya2luZy4NCj4gDQo+IEdlbmVy
YWxseSB0aGlzIHBhdGNoIGxvb2tzIG9rIHRvIG1lLiBJJ20gbm90IHN1cmUgaWYgYmV0dGVyIGFw
cHJvYWNoIHdvdWxkIGJlIHRvDQo+IG1vZGlmeSBwc3JfZW5hYmxlIHRvIGFjY2VwdCBQUl9NT0RF
X1NFTF9GRVRDSF9FVCBhbmQgUFNSX01PREVfMl9FVC4NCj4gV2hlbiBQUl9NT0RFX1NFTF9GRVRD
SCBvciBQU1JfTU9ERV8yIGlzIGdpdmVuIHRoZW4gaXQgd291bGQgc2V0IHRoZSBFYXJseQ0KPiBU
cmFuc3BvcnQgZGlzYWJsZSBiaXQgKDB4MjApLiBUaGlzIGlzIGhvdyBJIHdhcyBkb2luZyBpdCBm
b3IgUGFuZWwgUmVwbGF5L1BTUiBoZXJlOg0KPiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzU5ODUzNy8/c2VyaWVzPTEzMzg2NiZyZXY9Mg0KPiANCj4gV2hhdCBk
byB5b3UgdGhpbms/DQpIbW0gQUZBSUsgRVQgaXMgZW5hYmxlZCBieSBkZWZhdWx0IGlmIGF2YWls
YWJsZS4gU28gSSBkb27igJl0IHdlIHNob3VsZCBhbHRlciBpdC4NCg0KQlIsIEplZXZhbiBCIA0K
PiANCj4gQlIsDQo+IA0KPiBKb3VuaSBIw7ZnYW5kZXINCj4gDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgdGVzdHMv
aW50ZWwva21zX3BzcjJfc2YuYyB8IDE4ICsrKysrKysrKysrKysrKysrLQ0KPiA+IMKgMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jIGIvdGVzdHMvaW50ZWwva21zX3BzcjJf
c2YuYw0KPiA+IGluZGV4IDRjM2UzNGFhMC4uZTYxMmI4MjY2IDEwMDY0NA0KPiA+IC0tLSBhL3Rl
c3RzL2ludGVsL2ttc19wc3IyX3NmLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfcHNyMl9z
Zi5jDQo+ID4gQEAgLTE2OCw2ICsxNjgsNyBAQCB0eXBlZGVmIHN0cnVjdCB7DQo+ID4gwqDCoMKg
wqDCoMKgwqDCoGlndF9wbGFuZV90ICp0ZXN0X3BsYW5lOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBi
b29sIGJpZ19mYl90ZXN0Ow0KPiA+IMKgwqDCoMKgwqDCoMKgwqBib29sIGZiY19mbGFnOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoGJvb2wgZXRfZmxhZzsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgY2Fpcm9f
dCAqY3I7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHVpbnQzMl90IHNjcmVlbl9jaGFuZ2VzOw0KPiA+
IMKgwqDCoMKgwqDCoMKgwqBpbnQgY3VyX3gsIGN1cl95Ow0KPiA+IEBAIC0xODQsMTEgKzE4NSwy
MyBAQCBzdGF0aWMgYm9vbA0KPiA+IHNldF9zZWxfZmV0Y2hfbW9kZV9mb3Jfb3V0cHV0KGRhdGFf
dCAqZGF0YSkNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBzdXBwb3J0ZWQgPSBm
YWxzZTsNCj4gPg0KPiA+ICvCoMKgwqDCoMKgwqDCoGRhdGEtPmV0X2ZsYWcgPSBmYWxzZTsNCj4g
PiArDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChwc3Jfc2lua19zdXBwb3J0KGRhdGEtPmRybV9m
ZCwgZGF0YS0+ZGVidWdmc19mZCwNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBQUl9NT0RFX1NFTF9GRVRDSCwNCj4gPiBkYXRhLT5vdXRwdXQpKSB7DQo+ID4gKw0K
PiA+IFBSX01PREVfU0VMX0ZFVENIX0VULCBkYXRhLT5vdXRwdXQpKSB7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN1cHBvcnRlZCA9IHRydWU7DQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGRhdGEtPnBzcl9tb2RlID0gUFJfTU9ERV9TRUxfRkVUQ0g7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRhdGEtPmV0X2ZsYWcgPSB0cnVlOw0K
PiA+ICvCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAocHNyX3Npbmtfc3VwcG9ydChkYXRhLT5kcm1f
ZmQsIGRhdGEtPmRlYnVnZnNfZmQsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUFJfTU9ERV9TRUxfRg0KPiA+IEVUQ0gsIGRhdGEtPm91
dHB1dCkpIHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN1cHBvcnRlZCA9
IHRydWU7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkYXRhLT5wc3JfbW9k
ZSA9IFBSX01PREVfU0VMX0ZFVENIOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2UgaWYgKHBz
cl9zaW5rX3N1cHBvcnQoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5kZWJ1Z2ZzX2ZkLA0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBTUl9NT0RF
XzJfRVQNCj4gPiAsIGRhdGEtPm91dHB1dCkpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgc3VwcG9ydGVkID0gdHJ1ZTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZGF0YS0+cHNyX21vZGUgPSBQU1JfTU9ERV8yOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkYXRhLT5ldF9mbGFnID0gdHJ1ZTsNCj4gPiArwqDCoMKgwqDCoMKgwqB9
IGVsc2XCoMKgaWYgKHBzcl9zaW5rX3N1cHBvcnQoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5kZWJ1Z2Zz
X2ZkLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBQU1JfTU9ERV8yLA0KPiA+IGRhdGEtPm91dHB1dCkpIHsNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN1cHBvcnRlZCA9IHRydWU7DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkYXRhLT5wc3JfbW9kZSA9IFBTUl9NT0RFXzI7IEBAIC05
MTYsNiArOTI5LDkgQEANCj4gPiBzdGF0aWMgdm9pZCBydW4oZGF0YV90ICpkYXRhKQ0KPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9mKGludGVsX2ZiY193YWl0
X3VudGlsX2VuYWJsZWQoZGF0YS0NCj4gPiA+ZHJtX2ZkLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkYXRhLQ0KPiA+ID5waXBl
KSwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIkZCQyBzdGlsbA0KPiA+IGRpc2FibGVkXG4iKTsNCj4gPiArwqDCoMKgwqDCoMKg
wqBpZiAoZGF0YS0+ZXRfZmxhZykNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWd0X2Fzc2VydF9mKGVhcmx5X3RyYW5zcG9ydF9jaGVjayhkYXRhLT5kZWJ1Z2ZzX2ZkKSwNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJFYXJseSBUcmFzcG9ydCBEaXNiYWxlZFxuIik7DQo+ID4NCj4gPiDCoMKgwqDCoMKgwqDCoMKg
ZGF0YS0+c2NyZWVuX2NoYW5nZXMgPSAwOw0KPiA+DQoNCg==
