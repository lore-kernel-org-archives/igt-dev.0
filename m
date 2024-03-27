Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6875CD1289
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91B710FCBC;
	Wed, 27 Mar 2024 12:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2fRYoNY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16DB10FCB1
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542454; x=1743078454;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LxyAg+HXdc/yAV8lpGIVr761wPZrg9bH6WsmXz+0eMw=;
 b=O2fRYoNY3TFGF94K6NGnpwMHnrg7IqqCI3EtxyZCdEO4uDuhNW5cbOPm
 6P5jkYVeGa0zAInNnT7NCvQF/TrrzOUKpL2J1eoJPSaETwjY4VBPEWNbu
 E6H+ZUSGEjmxi3KSn2cbZzexv3I5P7TT5Jku3P2nK6RplOQxjH4mr21ig
 bjToJKrNUCvXAmNV3qK6O9DDcPaK2XL/cvNpnl1qyBLhw9U+7+8DULrgT
 g952f6WP+FG9JJ0I+mgcW8a//dLBv8IwGSNCx0xU6KkGKt/UbZIXEO4x3
 CNODoDvGOW1E4YA6dzzI4f8FDUfAmv/0Om4znqD/CdzSGyEswcgntSr1B w==;
X-CSE-ConnectionGUID: 8g84My12T8Gg0OLTrUXYuA==
X-CSE-MsgGUID: 5ikw+3E1R9y7HSQh1g7X8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="18069806"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="18069806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="53758006"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 05:27:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 05:27:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 05:27:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 05:27:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibGEpKCd6fs64nhsV4gJqa7Pu5ryQrGgpkMKD3bSPLSMR5yQlUUsHI6UB0MbMn0SaqRc2Gg3k7podzyNH4XmSycyMcTOmpgU+3y1KKEd/G4FSc2PmqeTK/EYsKzKznTx4QQkPPiU47E5E+B3xqH98Rf17d4gQtBwhmR9dnBSOnV9V5D62iJXiSFhBHaBKW0xmlVV2lLDpdU4UimON4j2kmnaSTTHRZzsiDF0xqqjbIMyWMBB/NPCoQ4zJnvLX2OvbSgZXapCXgeKPBhfcsvZm21x+WMy4MyjfjCHbcu6hwIzXHOSTYM+krcYvMjyCQxjglSlps1WYsm4ZJeNCw+fjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxyAg+HXdc/yAV8lpGIVr761wPZrg9bH6WsmXz+0eMw=;
 b=i/uc2+zzXmkAL797awfEh/S3nZO0eFJjzgyj/hnS+vFZyLbuQaGvzaXyY5sWzbWZhmWHw/pSZOUq6X3aXlmofok3e1F+UVldl6h9hNJLrEiDlkKTH95gwGht35Dhykcn3WdS4vFFScdMc9hqtNROUpO826K8+h1tu1nRX7ydh3StHfaPosYC91RPgeN16dePT6KUe0WAtyD5ehgu5bjZxR2C3UM7W9ftN4fX5RpAHfsb+r87mEqE+Gr991/pLxvUCDvDznsiR1ssv4E9NexCplYk2Tsaz7ThxIGCbR782eGhZp5L2CPxgpt8j6Vk+0jquM0UBQ5+PTpECnOUENKS4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Wed, 27 Mar
 2024 12:27:28 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::f:d87:3265:6573]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::f:d87:3265:6573%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 12:27:28 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_fbt: Remove checking
 display_ver for fpcpsr tests
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_fbt: Remove checking
 display_ver for fpcpsr tests
Thread-Index: AQHagApi89GFNnUZ9kaIB5ju0dQDfrFLhC2A
Date: Wed, 27 Mar 2024 12:27:28 +0000
Message-ID: <bdcf2a2255098ee411f9f214acfff1a2511bb509.camel@intel.com>
References: <20240327054750.159017-1-jouni.hogander@intel.com>
 <20240327054750.159017-2-jouni.hogander@intel.com>
In-Reply-To: <20240327054750.159017-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|MW5PR11MB5858:EE_
x-ms-office365-filtering-correlation-id: e026e664-9c85-428e-4f9d-08dc4e594467
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1W0oTI/5yVaZhQYpS/pm0f6nI7+kDWGQySw605pze2kL03EzzZtF6M+65ipOG1in34exVuw5NCgv/tzw40K2Lz6LNpJWvuLDYljLMiarFSxSUFO9J3z4qxpmQ17E41aT98bBrH1YaYUSxjfUX3hyu3A0ynFKn/kv1A9Jpj0C0clBpMOKKp/dQhkXBxamxMFZmOtXolAsHbQ/coPbFWOfpa1PGsKOkkFb18CXglh9+5A4PuPyo0XDTQUlDEGP23GsEYMiJWXtcvl2ORNOuAektiAXCKnQHP82/qfvr3ixQj3JYDQ+6FMkqFrN76Gh9QUsLuhWg6+VscCvz3NKOvja2OkRDjmCMNonrnzWZghc2BPxjzKZJUN1n47T5BYSMdheiOiLd6+/GqdYHwUQEunzAUROicMNvq+3z2K8bWMGhipo3VGMJ47mnKWx2az6wriw1XzjEhfFXI2wVvZc0379IL9SmUdlrKChOXoWIG6YRlqUyIzMXJilkuMC/Yw6gl3rMREH1jqJNPmwiwEui96AcCTOvHFzvtKkF6JmBaDSEP9vSulzLeAvoM7j4Qn3th+xiC/QHXWiWgB/VLN7+zG3XiBVjAE1rLv+1OeXkW6MSzhn9LRT1nraSV3C+PSYGKMVT7eSzXgHq8eF2p9J9MkwL+6RrX0nHUetaBUQnmW762J8ja1cdq1RuYyxhg+Jks2iLLdU9NXeJEEgiS5KaQ5oNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1lneDZ5c09JL1BPY0dHZTJJcjdaaVF4REFIWmt1NmpmWjdhWlArWHNOY0Jk?=
 =?utf-8?B?TkVQOW1lOXF0c3BSY0FCdnFKTE5lSUphRG1Qa04rY1QvbTBnTHlOM0JQWjRh?=
 =?utf-8?B?L2VPcHFXQnhZSDFYUktLYjBITHV5UW93MWIyV1cyYnVOK3luV0laTzFUVDhT?=
 =?utf-8?B?bCtxWnF5a2ZsN0Y1QUpWOG9GVGFsWlJaYVprUXp5eGhlUkxlZmJjTExDVVhs?=
 =?utf-8?B?Mk9pdVZEMlNwRSszN1RWT2svQ0pEQThVOEtwUUlPOXNQWEZ0b1dHV1kwZ1NB?=
 =?utf-8?B?bWhYSEcvbWVINnU1cTJJdWJVb2xLWFJiWUxsL3dRcllxcFN6TUs2eE1JSkhO?=
 =?utf-8?B?eE5YdDRYNlJDQjF0cjYxMkJpbnpNS2pkUlZWOElLdXZWemRob0ZSV2tJR3M5?=
 =?utf-8?B?b0k4SzVUcjRKaTh1U2w1a1IwWEhMRjBTTWZGdVZTKzZRWGtWdHg2S0J3ank0?=
 =?utf-8?B?ZWhiSERMMXd6SlNyQ210YXNkMmZUTTZmZVB0RGdxcm1nbllWem05YjM3NFE0?=
 =?utf-8?B?alZvVEhDWTBvSzRoUk5RdVNPdmhYa3BjT0k5Um9hNjNmYUwwRUVCeWJ4cGZi?=
 =?utf-8?B?NG5TR3lFL0I1OXNhS3YzMTNCVnJZNHFDNHpEL3dCaDhjTFBvVXpyK2VVWXRK?=
 =?utf-8?B?QmRwWWFJK0pqbGpUdzNiQmFrRWpXZHp2LzdSeHJRc216d21PS21XWTNqa3RJ?=
 =?utf-8?B?angydmRtaWh1cDVnWVlPN0JKVWc1SmhEUnJLMmU4bkdKWk9QY3EwYTkrc0k2?=
 =?utf-8?B?VXZ6anRGMUNWUUNNN29vbFBscjNSTmlsMDhvZlBGRzUyWTF3T0ZCYUtkcFN1?=
 =?utf-8?B?QTVkTlVCRDNCa0dHZjdDS3VDc0xNRXpqNk54d1pQd0pMczBRZnlibVFLYjBY?=
 =?utf-8?B?bm96VUpvVUo1cFVnL29rN014VTRXUFZSL0FhN2pkMzVDSDhIelBwUURLelNQ?=
 =?utf-8?B?YnZieGI2eXp6NEZNSTJadHB5QXk5d244RGhTY2VpcWFvVTNzWTJHVUorMUl5?=
 =?utf-8?B?ZmVLQmJaVlBHcXhWRXcySndrMm5kQ2hJTXJFZjdBWlFWV2xhbU54dEZMTFRM?=
 =?utf-8?B?bHUvZ2p3Rk1lVHdnRlhwQTRwVHNsYld3ZDlYMHRkcEFVTmg4ZVR4VGtsUHlj?=
 =?utf-8?B?c2pmRjh1REsrdllSaEJ5SDFhZ2NEclhjMjA2ZU0vdEFlaXYyRmovZ1FwY0RZ?=
 =?utf-8?B?T1E1VFFVbHptWmk5Qk9YY3U5ZkFYc1kwb3lhTm40b0tQTldUTTJsdjJTNm9Q?=
 =?utf-8?B?NEg0bDBTaUxxNGRqREh6bkNPR2tXa20wa0FIVTZVVE4rZFBtYVJpa2xRc0J6?=
 =?utf-8?B?WEd1b3RwdUt4SjR4RUowcGpwS2tKeS9UZDVRNTNDY01uNmlUS2hpcWhDZWpl?=
 =?utf-8?B?bU9vb1pUWU9BTTNRcUorcGx2bzd2YVRIMU8vUFVQaUNUV2RLeGlONmdzWm40?=
 =?utf-8?B?R2Rvazd3amsxSHpLL2RSVEtXR1lyOGtqeWcvUkN0a1djaG53djR1dnEzRHVx?=
 =?utf-8?B?YXZrcy92MW1rcWd0V3NtQ0lTbWtCUU9lUXJNV0ppYUxXalVBSHJOOEMrWldD?=
 =?utf-8?B?cG9sMytRclE1WmtiNzJxV1YzOXFhQ0x5QmdhdUFPUVlhcmlvVUo5Z1hYNFU3?=
 =?utf-8?B?N1U4OXdRN3QyZDhTcHBFZTFyTjlyWkZxNDZ1L1N1aWhDTURlby9RRjVEYW9U?=
 =?utf-8?B?U05kSit3WWhFc3Nrdll6UGdjTVc5UTJSM3djNlc2dE9RVituRHd4NXZFdzcy?=
 =?utf-8?B?U0hFUTNBbWVUUXVGaE9JejdUeUNwank3bjByVmptWXZEeXdadktacDRxLzEz?=
 =?utf-8?B?Rkk1ODNHUEhFRCtveWJzUlhKNEttOGZPR1BIcjJlV2dDSVNwRXlQcCtCajZJ?=
 =?utf-8?B?N1U0UnR3V2VqSFNlWlJPbm1lK0dLUnVyN1AwZWk3RHluWlpRdTRCVmdKcWpo?=
 =?utf-8?B?bEFvZmUzNXVSRlJ1cVFwaytWc2ZGWXBLcERyZi85WUpmbVNnWmY0c25NNXFK?=
 =?utf-8?B?emhmakZWd3dkSVMyckREQjhoTDNDRVdHOW5TRmxwZFg4U0EwMnM4SnJrN1hG?=
 =?utf-8?B?eDdsOWo4ZkV3SFBrT3puc2ZGMi9Ob0R4TkhxenFZOURnaUkwbUZudy9xK3cw?=
 =?utf-8?B?OTRUVElKdTBlREFKbk5CSDFISmN3aGN1MGxoS2QyeU13dklEcWtQb0R6dXJH?=
 =?utf-8?Q?ftgc/9GghpJWc/kMqJri2/w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0077135B0D1213438D72568546DD1686@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e026e664-9c85-428e-4f9d-08dc4e594467
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 12:27:28.5863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUzaOPyYDxyxC2E4xLLqvyGlP/zfh7wCqdplTSAqI97W3vwVQH2KY4L+YuQ7Xek41ws2d7qWbkqYpuDDn2MmYbOlhQUOvJFqu1otXVYFqI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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

T24gV2VkLCAyMDI0LTAzLTI3IGF0IDA3OjQ3ICswMjAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
Cj4gV2UgaGF2ZSBub3cgc29sdXRpb24gdG8gY2hlY2sgaWYgZmJjcHNyIHRlc3RzIGNhbiBiZSBy
dW4gd2hpY2ggd29ya3MgZm9yCj4gYW55IGRpc3BsYXkgdmVyc2lvbi4gUmVtb3ZlIHJlZHVuZGFu
dCByZWxhdGVkIGRpc3BsYXkgdmVyc2lvbiBjaGVjay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3Vu
aSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4KPiAtLS0KPiDCoHRlc3RzL2lu
dGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgNyAtLS0tLS0tCj4gwqAxIGZpbGUgY2hh
bmdlZCwgNyBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2
aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4KCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIGIvdGVzdHMvaW50ZWwva21zX2Zyb250YnVm
ZmVyX3RyYWNraW5nLmMKPiBpbmRleCA2ZDUzOTVhMGMuLmU0NWQxN2RkNiAxMDA2NDQKPiAtLS0g
YS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwo+ICsrKyBiL3Rlc3RzL2lu
dGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4gQEAgLTI5MjUsMTMgKzI5MjUsNiBAQCBz
dGF0aWMgdm9pZCBjaGVja190ZXN0X3JlcXVpcmVtZW50cyhjb25zdCBzdHJ1Y3QgdGVzdF9tb2Rl
ICp0KQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChvcHQub25seV9waXBlcyAhPSBQSVBFX0NP
VU5UKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUodC0+cGlw
ZXMgPT0gb3B0Lm9ubHlfcGlwZXMpOwo+IC0KPiAtwqDCoMKgwqDCoMKgwqAvKiBLZXJuZWwgZGlz
YWJsZXMgZmJjIGZvciBkaXNwbGF5IHZlcnNpb25zIDEyIGFuZCAxMyBpZiBwc3IgaXMgZW5hYmxl
ZC4gKi8KPiAtwqDCoMKgwqDCoMKgwqBpZiAoZHJtLmRpc3BsYXlfdmVyID49IDEyICYmIGRybS5k
aXNwbGF5X3ZlciA8PSAxMykKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3Jl
cXVpcmVfZighKCh0LT5mZWF0dXJlICYgRkVBVFVSRV9QU1IpICYmCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKHQtPmZlYXR1
cmUgJiBGRUFUVVJFX0ZCQykpLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiQ2FuJ3QgdGVzdCBQU1IgYW5kIEZCQyB0b2dldGhlclxu
Iik7Cj4gLQo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgdm9pZCBzZXRfY3J0Y19mYnMoY29uc3Qgc3Ry
dWN0IHRlc3RfbW9kZSAqdCkKCg==
