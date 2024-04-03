Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC9CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 18:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3445E10EC40;
	Wed,  3 Apr 2024 18:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nA1bibaX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FD710EC40
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712168911; x=1743704911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YVgWrXft6g9QO+1hQG+1pliugruas3eKes+TC6g7s+Y=;
 b=nA1bibaXKlwV3/YflfYRGW/m++LYlOdadpV12s6H5+mF5Ph9WDpq97Th
 XzUf21BlJv3amFak/76FZpJV8e0aBP1z0SbTByxYXY2spDPJjtB7Wx8Op
 GxzfOZklEvg91W75j4bz4Z40xgTd14UOfwcthr+b1hm9dPQSj0Vo1/TGr
 NmfybxYIBJ0xC5Gqjemv5ez9eJo8rRjKddz5/SFDp36qo61hfcwSmiDB1
 7deuXuPs6Fbom+Xl52MO13yK3mUG0p0ibjUH9IuBi/xpxBzefcJi53Y68
 l3OJP+9wUMdFrVzfxvAvQJ7+IYQ+MJ3CrL8PKGVgMqe/OHvpRXYP3SgNc A==;
X-CSE-ConnectionGUID: A+ea8cpPQDmSWVyfm/+gIw==
X-CSE-MsgGUID: uFij8DmBSBaYVbqmsdU3sQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7656829"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7656829"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 11:28:31 -0700
X-CSE-ConnectionGUID: 6GMH9TQ0TKGGfuId71Dplw==
X-CSE-MsgGUID: GA4KGBPkTO6wFDaU2HBTVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="23011124"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 11:28:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 11:28:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 11:28:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 11:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzZlUPyvMYP4qt5CTR+hEwI4UPMCvPmqeVst4f+dP9U5ivV4xYOcR+wjtm19F5M4AhWi+RPWGiFytZ86fUHC4Vp1Quifu2QwC9C4pWAS+voQ+P66UHl3gR1LmSsfl51+NjXdcaNOQ+1ouHSFAoPTJAi5ntsGvADh/Xvry2qRhACaU/Ywn5nY41ZSjTEn55rdmV75rgICis/sWBH38ldosg8W2OxfkEZ6sR0MdbygC9t357sGMPiN/dXakeVa39GqWTTuE8cWZsH6Rx07uqrLQo2B7VY5iYuClbXAZNocTAPIkdJFW+SNCq8RMA/65csDosqZw+ivSllEeSVWMJqK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVgWrXft6g9QO+1hQG+1pliugruas3eKes+TC6g7s+Y=;
 b=WZ/eOJwUwUoSwBDZY23GCkoBzV25a7cYsrViMO0LXMLwVLjcyLH8JCrAddkga/qIkWHdjwq4Z6oJ3283g8BPL327WyXnUAxcM9ehEsNAmfiRSBX6J+P5Iw+Pj8I/+wfDNi1KEHlKkTDX51k22tOcSKmys+1mfgeWudKsXYOg9v2SRwup1Zprc+ceFMWaqcvVwfqS9n47IGqRH77AKPDisVhw1yfE9uEaDhWrcMAu4iDqzoYGCZRtgKENLaS7ILgEM9sJWvZ0XmGOwzupziO89x8lPOyHNGhM1tCozIQX5Sw06hMRXAwQBVyMUJnJ3y//DqpajYkhCXnz0oDVwdf7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB8167.namprd11.prod.outlook.com (2603:10b6:610:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.19; Wed, 3 Apr
 2024 18:28:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 18:28:28 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_busted: Introduce a new test for Xe
 device busted state
Thread-Topic: [PATCH i-g-t] tests/intel/xe_busted: Introduce a new test for Xe
 device busted state
Thread-Index: AQHadnVUqXOu7hNjxkaBO2CmB1bnorFW+wQAgAABf4A=
Date: Wed, 3 Apr 2024 18:28:28 +0000
Message-ID: <80f4e8e964eeb4ebd96709370ecfadb1065cffc7.camel@intel.com>
References: <20240315010843.194335-1-rodrigo.vivi@intel.com>
 <20240403182304.kwm52y3nzgvvqg3u@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240403182304.kwm52y3nzgvvqg3u@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|CH0PR11MB8167:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PBFpHeFtOPbtkeYzBQebnobUc79hUhkXQUvD3pOa9iChVq4KFHvvUlAHyL7ntXqVeyMjMekP+GWjkm6kJ+uowiLmnO8UHCUE0K8g6s94uT3hp13xOy2t0b+0COfoLcoNcBy826GZ1dxTMgVDKzwfvRp5DOM0Jzx2G9KM5ZAziQ3KU5QojeSfBJvDJZgfuSsOQHqDdY02otCKMMLXEE65zuSgQR38hGVDVRHipdQ/Pbtha2AKl7SVIaMH1WAw3kWYvG9SGZBkE9ehUJqYlwyZN5Lnt6nv8GnHx+necBhpKRhUou5UMDTPUnNDO6cwKdU7auAcvLY7mkyqH8ace5I1cMnC0PH5FZWynkItm5gBYbBJvVAA2O9v1urnN22bcVVPN7Pwo4qfB91chWK7IayIkNBmjW/e0XbzTuq+Kk1vT6dkWkSPza7AWd9ihBtmCuDdeOeR6tfG6WtFRZ7exjUVMmIknBdRJttQO+RKJshHQ+l4FsU/KPVhlQeJ4u7gVIGIdmjFsIBg8Oa1t9nvK7sNp8aySvOaPHl5zKUu1Un/Z6tyBzZxasZJO/B1ehROr0G6LG6ciMuIY20AjFugWTbq2SEwTHNq06598xU9nfEq3LXifCL+t9rjoGYhsD1cZRnQegO8r0DitXqVhEpocjCfu5or75rRz++1joYjpZ9YsPQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0VSMi80MWlNa3VpN01tLzA2V0FUZUdlVDlsR0RnNWlEMmF3azNPUjNoRmJV?=
 =?utf-8?B?YlZFeGRuQTZ2T1RNODJybzJEWGZkWHdLRzhyMTEwc0haYTJmVWpLanN3cWUv?=
 =?utf-8?B?cTI4ZW0yREJSdkNvemxMRW5JNGJjZXVsUVp5b1BFSUtxb1dla3V1aklCYnR1?=
 =?utf-8?B?VDBkdzVIc0M5b28ybnd0eGh3ZlhDc21SYzNnN0dLK08yb1hRa0w1MWJDOUxH?=
 =?utf-8?B?dUw0bGpUMWhPV1FWNTVtREZQVklreUVuRlFyY05QbFRqUlNrdnlSa0xuYk1x?=
 =?utf-8?B?Wlhjc2U3TXV2blF0L3J5YkZ0VUh1TkdwNGp4bG5mTGlqVlhFOFEyYTZjWlpT?=
 =?utf-8?B?Q0tIS3dPZ2hTNGdUbXdjOWhYeWFwUTFZaTBoajAwNndMQ0hUREcrY0d0MGI4?=
 =?utf-8?B?VngrTHRETVVBODJFVHlhT3FCbld1WC9ValRPWFFtQXJwcGpCMm11ZllQZDZR?=
 =?utf-8?B?RTJpYWlrVjljb09uTUxPOVJLcE8yeDNRRk8rZUg2TmR1THJOdzZPbWdDUkFh?=
 =?utf-8?B?V3FWOERxYXhIbE1Tb2dlZGpuZmVOOGFubC9Pc1R4b0R3c0tMbWtPbWVSRWlY?=
 =?utf-8?B?UUcrY3haekgvNHl6ckR5YVgyL2RiaDAyS0o4ZUd3dTY1Q3BwWlJDY0VzMFZE?=
 =?utf-8?B?azNkTVNTb3FLd3g0RXVnaUJnYzI1bFpZdnlEWXVpeGVoMURGaENzV0h3Mm16?=
 =?utf-8?B?MnExNWpMc3NuVng3ODhOejdlbURxejNLRTlvaDlNQXJhMis5ZnJwRkdIRDVa?=
 =?utf-8?B?NWlVSzRYTmQySnZScGNNOE9XMWlOSW56NUhqZHF3R2h3ekttSmpjV2N1ZWZB?=
 =?utf-8?B?OGQzK3lUenptb0s2cVNyWDlQL2J3VEFESFBQUzloQVRieW8zNzBBTVJ2OVBh?=
 =?utf-8?B?Y25IeTBUdmhkK28xTzlwRU91ZU0xa2V5RXcyeDIwSDRPZHgvZmxDeEw1MTY3?=
 =?utf-8?B?OGtVSXJvNXVMTnA5V3dkajk3c0JEVE05Um1seW01REkwSFJxNVlGekt4OHZN?=
 =?utf-8?B?UGF1N2txbDh2S3RzT3Z1NHcwcFA5MkxxRUVRS012SVQ1eGhVS1Rwb01SMzJy?=
 =?utf-8?B?WE5sNmh1US9WYy9XQkxqQlJkUHNGUWVVbVdWa3ZQRGxPRUROREZJYjZsRjFU?=
 =?utf-8?B?MGtub3BqbGxuUHlQclgrMHVaeWplMnNkWWhBOVhFaTdmcytEZUQ0TzJGQm15?=
 =?utf-8?B?RjFSd3JlM3VkeVVOcFVOQ0I3SndESnRzTmg0QmE5VmM5MXFoc3VhdHZQNitX?=
 =?utf-8?B?cW0xQ3VEQkFKc29hMjQ5bVNLbWRsbjhGRnZEQUw0RDBPWmpjbEJGUnN1TkJT?=
 =?utf-8?B?SUdYclhpVWwyVG1Va2gxTzhXN0Fkc0pDNWpYdk90S2g3SG9MREF6b1dEaXNu?=
 =?utf-8?B?eG9tSnBlM3hDMFFOeDFML3c0Z1ZSbGovV2hLUjJTKzU0UVJlZVB6TmlMNldv?=
 =?utf-8?B?Rlc4UlhpWFNDOWRCaWRGcGg2bWF5ZUsycFpCVFRjVnNTTU9hcmNsUTRWZUdz?=
 =?utf-8?B?OGtpbkxzRTJscXFIZE1tUyt1emhhYU5HRHl1RTl5WFdUVTlRTzQ1L2ZjeGU1?=
 =?utf-8?B?a3pZRXZQdFFINXpodWlXNDFodHhNVk1IY1hVK2FaNE1LL25XWkFaZzltK29R?=
 =?utf-8?B?dm5LcDVLTWNkaUhZR1Nqcm4rN3JuektrNFVnZ0Rmd0NqK3diT1RaUkl6UDho?=
 =?utf-8?B?b0xCdTR4dE81czBBMnU0SEVBck5nU0YrSUZiQ1hIbUFONjJsMmVoK3loUy82?=
 =?utf-8?B?QWo4VWRqU3Q3eERWb25OWUlEbnRpMlMxdFdjbmRFTW1jYmN3ZjdZbVF6VS8z?=
 =?utf-8?B?QmtoRGtIZ3FFcDdyS09EZGpneHBNMTFrbWxiQ29wQTQyYjZIay9YWDVYQkI2?=
 =?utf-8?B?NXkrbWdOK3M1NFpxbUs5SC9sZWoxaDJpWFdCaDJ4R0ZhS2NYeCs5eWk0aVdq?=
 =?utf-8?B?WXBkNjhjVmZhbW9TbUtremo3eS9EcHJPSGNsVGx2UExPR0haY0lwT0I2dGps?=
 =?utf-8?B?Z0praE5tS29KOC9DTUxMUWRIVXRzK2ltaUVEYlVGcjBUeGVSN3R1cjc1aW1S?=
 =?utf-8?B?cDJHZ0N2bHRtdEE0ejEvbm1kbVBhOGlzclB3dG9Nb2FKMzMwdnFXb0poUExr?=
 =?utf-8?B?SnEvOE5oZDFha0Fud0JmSlgyNUV3cExlU1FpMjYwZVdaeUNtS0NNenNlUFJj?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A121F88C56EDF43A121CDF0E4AE1C05@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fc554a-fa68-4170-0957-08dc540bdb59
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 18:28:28.0968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oWiU5Yx980vAHak5ijfkeEPvW1ugwDQBi6XcuBgI7NcPkpXxq2PLgqCD9bkIz1TvFIcOPcfaIJsM4BgJZHTNiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8167
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

T24gV2VkLCAyMDI0LTA0LTAzIGF0IDIwOjIzICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIFJvZHJpZ28sDQo+IE9uIDIwMjQtMDMtMTQgYXQgMjE6MDg6NDEgLTA0MDAsIFJvZHJp
Z28gVml2aSB3cm90ZToNCj4gPiBMZXQncyBpbmplY3QgYSBndF9yZXNldCBmYWlsdXJlIHRoYXQg
d2lsbCBwdXQgWGUgZGV2aWNlIGluIHRoZQ0KPiA+IG5ldyBidXN0ZWQgc3RhdGUsIHRoZW4gd2Ug
Y29uZmlybSB0aGUgSU9DVEwgaXMgYmxvY2tlZCBhbmQgd2UNCj4gLS0tLS0gXl5eXl5eDQo+IFdo
eSBpcyBub3QgJ3dlZGdlZCc/IFdoYXQgaXMgYSBkaWZmZXJlbmNlPw0KDQpkb2ghDQoNClBsZWFz
ZSByZWFkIGl0IHdlZGdlZC4gSSBmb3Jnb3QgdG8gcy9idXN0ZWQvd2VkZ2VkIGluIHRoZSBjb21t
aXQNCm1lc3NhZ2VzLiBJIHdpbGwgc2VuZCBhIGZpeGVkIHZlcnNpb24gbGF0ZXIuDQoNCj4gDQo+
IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+IHJlbG9hZCB0aGUgZHJpdmVyIHRvIGdldCBiYWNr
IHRvIGEgY2xlYW4gc3RhdGUgZm9yIG90aGVyIHRlc3QNCj4gPiBleGVjdXRpb24sIHNpbmNlIGJ1
c3RlZCBzdGF0ZSBpbiBYZSBpcyBhIGZpbmFsIHN0YXRlIHRoYXQgY2FuIG9ubHkNCj4gPiBiZSBj
bGVhcmVkIHdpdGggYSBkZXZpY2UgcmViaW5kL3JlcHJvYmUuDQo+ID4gDQo+ID4gVGhlIGZhdWx0
IGluamVjdGlvbiBvZiB0aGlzIHRlc3QgaXMgZW50aXJlbHkgYmFzZWQgb24geGVfdWV2ZW50DQo+
ID4gcHJvdmlkZWQgYnkgSGltYWwuDQo+ID4gDQo+ID4gdjI6IFVzZSByZWJpbmQgaW5zdGVhZCBv
ZiBtb2R1bGUgcmVsb2FkIChMdWNhcykNCj4gPiDCoMKgwqAgQW5kIG90aGVyIGltcHJvdmVtZW50
cyBhbHNvIHBvaW50ZWQgb3V0IGJ5IEx1Y2FzLg0KPiA+IA0KPiA+IENjOiBMdWNhcyBEZSBNYXJj
aGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiBDYzrCoCBIaW1hbCBQcmFzYWQgR2hp
bWlyYXkgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKg
dGVzdHMvaW50ZWwveGVfYnVzdGVkLmMgfCAxMDcNCj4gPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gwqB0ZXN0cy9tZXNvbi5idWlsZMKgwqDCoMKgwqDCoCB8
wqDCoCAxICsNCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKykNCj4gPiDC
oGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94ZV9idXN0ZWQuYw0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9idXN0ZWQuYyBiL3Rlc3RzL2ludGVsL3hlX2J1c3Rl
ZC5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAuLjg4Mjc4
MjEzZA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9idXN0ZWQu
Yw0KPiA+IEBAIC0wLDAgKzEsMTA3IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBNSVQNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjQgSW50ZWwgQ29ycG9yYXRp
b24NCj4gPiArICovDQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogVEVTVDogY2F1c2UgZmFrZSBn
dCByZXNldCBmYWlsdXJlIHdoaWNoIHB1dCBYZSBkZXZpY2UgaW4gYnVzdGVkDQo+ID4gc3RhdGUN
Cj4gPiArICogQ2F0ZWdvcnk6IFNvZnR3YXJlIGJ1aWxkaW5nIGJsb2NrDQo+ID4gKyAqIFN1Yi1j
YXRlZ29yeTogZHJpdmVyDQo+ID4gKyAqIEZ1bmN0aW9uYWxpdHk6IGJ1c3RlZA0KPiA+ICsgKiBU
ZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gPiArICovDQo+ID4gKw0KPiA+ICsj
aW5jbHVkZSA8bGltaXRzLmg+DQo+ID4gKyNpbmNsdWRlIDxkaXJlbnQuaD4NCj4gPiArDQo+ID4g
KyNpbmNsdWRlICJpZ3QuaCINCj4gPiArI2luY2x1ZGUgImlndF9kZXZpY2UuaCINCj4gPiArI2lu
Y2x1ZGUgImlndF9rbW9kLmgiDQo+ID4gKyNpbmNsdWRlICJpZ3Rfc3lzZnMuaCINCj4gPiArDQo+
ID4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgZm9y
Y2VfYnVzdGVkKGludCBmZCkNCj4gPiArew0KPiA+ICsgaWd0X2RlYnVnZnNfd3JpdGUoZmQsICJm
YWlsX2d0X3Jlc2V0L3Byb2JhYmlsaXR5IiwgIjEwMCIpOw0KPiA+ICsgaWd0X2RlYnVnZnNfd3Jp
dGUoZmQsICJmYWlsX2d0X3Jlc2V0L3RpbWVzIiwgIjIiKTsNCj4gPiArDQo+ID4gKyB4ZV9mb3Jj
ZV9ndF9yZXNldChmZCwgMCk7DQo+ID4gKyBzbGVlcCgxKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAr
c3RhdGljIGludCByZWJpbmRfeGUoaW50IGZkKQ0KPiA+ICt7DQo+ID4gKyBjaGFyIHBjaV9zbG90
W05BTUVfTUFYXTsNCj4gPiArIGludCBzeXNmczsNCj4gPiArDQo+ID4gKyBpZ3RfZGV2aWNlX2dl
dF9wY2lfc2xvdF9uYW1lKGZkLCBwY2lfc2xvdCk7DQo+ID4gKw0KPiA+ICsgc3lzZnMgPSBvcGVu
KCIvc3lzL2J1cy9wY2kvZHJpdmVycy94ZSIsIE9fRElSRUNUT1JZKTsNCj4gPiArIGlndF9hc3Nl
cnQoc3lzZnMpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgaWd0X2Fzc2VydChpZ3Rfc3lz
ZnNfc2V0KHN5c2ZzLCAidW5iaW5kIiwgcGNpX3Nsb3QpKTsNCj4gPiArDQo+ID4gKyAvKg0KPiA+
ICsgKiBXZSBuZWVkIHRvIGNsb3NlIHRoZSBjbGllbnQgZm9yIGEgcHJvcGVyIHJlbGVhc2UsIGJl
Zm9yZQ0KPiA+ICsgKiBiaW5kaW5nIGJhY2sgYWdhaW4uDQo+ID4gKyAqLw0KPiA+ICsgY2xvc2Uo
ZmQpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgaWd0X2Fzc2VydChpZ3Rfc3lzZnNfc2V0
KHN5c2ZzLCAiYmluZCIsIHBjaV9zbG90KSk7DQo+ID4gKyBjbG9zZShzeXNmcyk7DQo+ID4gKw0K
PiA+ICsgLyogUmVuZXcgdGhlIGNsaWVudCBjb25uZWN0aW9uICovDQo+ID4gKyBmZCA9IGRybV9v
cGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiA+ICsgaWd0X2Fzc2VydChmZCk7DQo+ID4gKw0KPiA+
ICsgcmV0dXJuIGZkOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHNpbXBsZV9pb2N0
bChpbnQgZmQpDQo+ID4gK3sNCj4gPiArIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgc3RydWN0IGRy
bV94ZV92bV9jcmVhdGUgY3JlYXRlID0gew0KPiA+ICsgLmV4dGVuc2lvbnMgPSAwLA0KPiA+ICsg
LmZsYWdzID0gMCwNCj4gPiArIH07DQo+ID4gKw0KPiA+ICsgcmV0ID0gaWd0X2lvY3RsKGZkLCBE
Uk1fSU9DVExfWEVfVk1fQ1JFQVRFLCAmY3JlYXRlKTsNCj4gPiArDQo+ID4gKyBpZiAocmV0ID09
IDApDQo+ID4gKyB4ZV92bV9kZXN0cm95KGZkLCBjcmVhdGUudm1faWQpOw0KPiA+ICsNCj4gPiAr
IHJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBTVUJURVNUOiBi
YXNpYy1idXN0ZWQNCj4gPiArICogRGVzY3JpcHRpb246IEZvcmNlIFhlIGRldmljZSBidXN0ZWQg
YWZ0ZXIgaW5qZWN0aW5nIGEgZmFpbHVyZQ0KPiA+IGluIEdUIHJlc2V0DQo+ID4gKyAqLw0KPiA+
ICtpZ3RfbWFpbg0KPiA+ICt7DQo+ID4gKyBpbnQgZmQ7DQo+ID4gKw0KPiA+ICsgaWd0X2ZpeHR1
cmUgew0KPiA+ICsgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gPiArIGlndF9y
ZXF1aXJlKGlndF9kZWJ1Z2ZzX2V4aXN0cyhmZCwgImZhaWxfZ3RfcmVzZXQvcHJvYmFiaWxpdHki
LA0KPiA+ICsgwqDCoMKgwqDCoMKgIE9fUkRXUikpOw0KPiA+ICsgfQ0KPiA+ICsNCj4gPiArIGln
dF9zdWJ0ZXN0KCJiYXNpYy1idXN0ZWQiKSB7DQo+ID4gKyBpZ3RfYXNzZXJ0X2VxKHNpbXBsZV9p
b2N0bChmZCksIDApOw0KPiA+ICsgZm9yY2VfYnVzdGVkKGZkKTsNCj4gPiArIGlndF9hc3NlcnRf
bmVxKHNpbXBsZV9pb2N0bChmZCksIDApOw0KPiA+ICsgZmQgPSByZWJpbmRfeGUoZmQpOw0KPiA+
ICsgaWd0X2Fzc2VydF9lcShzaW1wbGVfaW9jdGwoZmQpLCAwKTsNCj4gPiArIH0NCj4gPiArDQo+
ID4gKyBpZ3RfZml4dHVyZSB7DQo+ID4gKyBpZiAoaWd0X2RlYnVnZnNfZXhpc3RzKGZkLCAiZmFp
bF9ndF9yZXNldC9wcm9iYWJpbGl0eSIsIE9fUkRXUikpDQo+ID4gew0KPiA+ICsgaWd0X2RlYnVn
ZnNfd3JpdGUoZmQsICJmYWlsX2d0X3Jlc2V0L3Byb2JhYmlsaXR5IiwgIjAiKTsNCj4gPiArIGln
dF9kZWJ1Z2ZzX3dyaXRlKGZkLCAiZmFpbF9ndF9yZXNldC90aW1lcyIsICIxIik7DQo+ID4gKyB9
DQo+ID4gKyBkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCj4gPiArIH0NCj4gPiArfQ0KPiA+IGRpZmYg
LS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+ID4gaW5kZXgg
YTg1NjUxMGZjLi44N2E1MzEwNTEgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvbWVzb24uYnVpbGQN
Cj4gPiArKysgYi90ZXN0cy9tZXNvbi5idWlsZA0KPiA+IEBAIC0yNzQsNiArMjc0LDcgQEAgaW50
ZWxfa21zX3Byb2dzID0gWw0KPiA+IMKgXQ0KPiA+IMKgDQo+ID4gwqBpbnRlbF94ZV9wcm9ncyA9
IFsNCj4gPiArICd4ZV9idXN0ZWQnLA0KPiA+IMKgICd4ZV9jY3MnLA0KPiA+IMKgICd4ZV9jcmVh
dGUnLA0KPiA+IMKgICd4ZV9jb21wdXRlJywNCj4gPiAtLSANCj4gPiAyLjQ0LjANCj4gPiANCg0K
