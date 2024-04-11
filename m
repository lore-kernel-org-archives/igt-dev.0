Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5827ACD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 10:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02EF10E5D0;
	Thu, 11 Apr 2024 10:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBR2aHKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD30710F9F9
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712830516; x=1744366516;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ps271XDHlXYpB2btetX628G1oKrX4Kqyan/4AgvlpNY=;
 b=TBR2aHKVoMBcpsgKs9tTyE69kT0dNrGaXHYSpiwzbMntCZqYMLSPGLsQ
 w2/821uEj6saV1/qFLVGoMh7ke/kjKysBlmR2G2hW2dhmNTaC9vekwvlK
 CBdTxyMZemXz3xIwI1b8xSMlUI8pEAJ/gT+OVGu/b52dj9cUfu5I/qJpg
 6P2W+9PrbwsWAN5J6QKMnXjpmVWEWPEx6Q5ri54Ygj3XadD5CC786pCbQ
 zpAhdVhXlIPmP5kT5K5knAomgG4z0Wwdf3lCe674p4ysHGnd4qsx4MWwV
 9s/5TdMtEUaYPccylzs0J51p2vOeWvsAQEwzLGpm2TihXG9796hcZXMFi Q==;
X-CSE-ConnectionGUID: 0u3cnivVTwinGAVi2AW/Jw==
X-CSE-MsgGUID: oFMCzo2iSbitDuNr4byiPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12021923"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12021923"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 03:15:15 -0700
X-CSE-ConnectionGUID: v7xQNZ0/SQitBY3azMAo7A==
X-CSE-MsgGUID: tVV0eYG4QuSXp90vpku1ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20907742"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 03:15:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 03:15:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 03:15:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 03:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeQpiVEIyNo0aD+OgW7icenaBJTZbp54CysDQ+wQQG8M9roRlJ+KbpNS1zhLlwFtZRIVixWunzWBPg8bt4lzrJ5zmb7dX6DKRBetR9M8f/m9i3YISCJqrZ8JictNoipx890FNdOQF30PtMHCLNJe27rqKpEsgzYtlAXe0bPcY2azwlo1sYsxZTtDqquntW5Z8rYk1fuGMUQ2Mc1qpThg0rg2sH1NbBzP1Ms84uWTR+YAbEY4AonPd9n5m/WYjcVm2X34XJT6CPEdNuVftjCk9b8Onegk/b83tJHN+SY7tbX86UKFB/4fRDOv4Fzu++uUeOMwlxAITpYZqQTwDGUnpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ps271XDHlXYpB2btetX628G1oKrX4Kqyan/4AgvlpNY=;
 b=V426TZ/GiwnCCWGMI8ez8hyyC35/LsW30w+5Qym+1XSttNMPAeX50PTB4gRfDyOVTqxX+MxxSWDQ5KGa46x9HEZNdOp3uo6zF2l07PTtnJuWpeNU9E5Rbwm0F+8G2uVp3nwxvbPNic5rouSUSS7MqudodBRzaU+Mh5OkpqPtyLCtGCx8SfjB2x2jPMY5rArq5eCdTCPcjLHnyxTsDM9gpm2QTYn+MRkowQsIN3ShEUNW6z4PAcKxkcuI7Tg8/UsEWrH524OpCI7fmp2/yKJL2vsvzgQ5coc6ih3yDli0UQe3m/0NSea4umR77nZRR4vzyAxPIk6r6j8kyne1+UhYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Thu, 11 Apr
 2024 10:15:13 +0000
Received: from SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016]) by SJ0PR11MB6789.namprd11.prod.outlook.com
 ([fe80::2e00:6a0:1e21:b016%6]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 10:15:13 +0000
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_async_flips: Extend the "async flip
 needs an extra frame" logic
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_async_flips: Extend the "async flip
 needs an extra frame" logic
Thread-Index: AQHafJjOhNZ+ukJBZk6kiCz4/oD4PrFi+EGA
Date: Thu, 11 Apr 2024 10:15:13 +0000
Message-ID: <SJ0PR11MB6789E9C9539F077702D9FBDF8D052@SJ0PR11MB6789.namprd11.prod.outlook.com>
References: <20240322203726.16637-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240322203726.16637-1-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6789:EE_|DM4PR11MB5293:EE_
x-ms-office365-filtering-correlation-id: 06e1e22a-3871-47da-7bfc-08dc5a1046a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wnHLzJPgB81+h6R68BK/C8DWIPij3+rzZ5kCCqrziadx5JAimLsUgOW59SH5CePHKtEQbgc6t+beuXidrnMGdGTglOssr5lIHArj5I06tbErj+nV22sErgDjH7LsQLDi8BbwSEf5xecF8Oj0GPP0u9R/3f9lQpaAZTWweBRrIdPl4Lyr9dCEtMT68hkkbfeR3MGF7UROFDw2DNWcpH6m2I0KBNxhcoqi2uaAVtA4xWYcyRf5T7SMeD49MoO09ZXfyzS3+r0zlEZMEyR0qUiudhpMxFrbji4dLTi+d7Y/6VRTzBiL46bMKskisjUQGjkyb5UX2C2jQvIcZy5jl3TFLsmxDTD0Fd0uldfJEimdrqft7GUVqQKPOuoDf23CYyXQ4e8X/ozPu+MByzokpXe4LZDoC9RFVoCCjx9jnl9e9KNtjD1ZKxLCLvExMz/HUAKYFF/h8+NNY3uDtRVWdoyG7RkH/J/LrPClZia4gYjbWwwkuu2RxHw6OVWisjuH4M9BpkuYYiJbYQYrj5R33Zrzu/LFtH5CXr0xOhSDR6rxR0wQhgH8LCgKtnnczLksWNmaE1VkgjSLdFdxaISPPMEGEIvN/yZMRtqV7nAebhUN+3pZpjaTdxdXPyXDcC9BTb2Q+V06Fyaajt7IO+JSIdqHzDkM4lKv6JhR2+hL+kJC8lNMQ1f36zb7UlGDkT+Teejg5X8iJnno377BNjMBM0fXyh4Yu33qK4wCPZsWUBad5ZE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6789.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWdTTUdIdndvMkg1TGVBWDJac1BjUnhEZXRUUjRtSVZtcEpSUHNOU3FFR0Y3?=
 =?utf-8?B?MmlFK0RiL0hoakRUU2hWRldodkxFc1ZoeXBIeUk3b3U5U0ZCcGNoVCtmd0Y1?=
 =?utf-8?B?a1RCN1RlTzRxYWZNL1FTTlhTeDREK20wM0puczAzb0d3cjZKUm8xUk9UakYr?=
 =?utf-8?B?R2RXR28yY3dsbjhwY3JWVUNKK0hVVEUvd0h3UHVIeGtFL1VmNUs1RDkwR2ZY?=
 =?utf-8?B?Wm9HSDlLNHp4RmN2SlpTSlRVWDBENWQwT284Y2xyV2d1N0hJeStYa0tvSEdz?=
 =?utf-8?B?OXdVM2hGUE1YSlZCVTRVaTJ2S3hCenRyUXNwa3FNdmEzZzUrZHA1c0RmaUhj?=
 =?utf-8?B?eVFBMFlTS09uSHNTdDNSOW5ES3hlS3FHY2NUK21SSEFGbmVUV1hwK1cyTGNy?=
 =?utf-8?B?dWhYNSswc2NQMVZhKzdsQ2JMV1lWN3krTXJ4U3FoblNGWVlUUEMrRkhlMFRT?=
 =?utf-8?B?TDF0dFVHeSttVzV6KzhjbjFCSHRHSW5xVnBHYXVjQVkzSExTbkNvdllnTXAv?=
 =?utf-8?B?S0NQVklaTW5HS0NORkxuK0Njc2duc1dibkRseVhicDdrUE1SSUhEV2xZeGs0?=
 =?utf-8?B?QWlVaENkWmVvQWhyWXE4aU1lZDc4RzczVVd5dTU3WnViaTRwMnFUTXNSNzJh?=
 =?utf-8?B?SCs4bWZoZmtXR1RzUU5yenRvK3lsY09vMllGMDcxT3NWRWJQNjc3blV3aWVo?=
 =?utf-8?B?T2xqZnFsRGwyMlI2SDlvNlUwQ0hvL0NCVGEvY2lvNDF4d1dmZDQwSGg5Vi91?=
 =?utf-8?B?TVN6Wk11RlhpWnQ0WlZ3RTRJcUU3aGdpdlNIVE11KzhOeDBXUWlFYW8wU3BE?=
 =?utf-8?B?S2pveldEcEJ2UHlUbHJTalo2R0JneFFIRStXNFVQejRKVzRWTDRqZ3Fmcllu?=
 =?utf-8?B?a1FRSHJrOElScDFRMGdEc1B1MnQzRG5RbVNObXNLMW5kUVhWQjdNbitwamFK?=
 =?utf-8?B?MDNwajM0WkpMUXA1ckdQdW5Dd3p1WjJZY0RLbkxMOFpjdnRQV05xR0U2K2NZ?=
 =?utf-8?B?UFRtSm1pM2taRDRRbFBORHRVcUtnZ1dvQ2Z6SU1PaVFjdHREQXhLK1BGN2RC?=
 =?utf-8?B?Yk1NQnhjZFYveUxNbEF0ajRUYVhsbmNjZnZqOWVPWlJiS25vMzNoRWhqNjl0?=
 =?utf-8?B?eUdzQStvNXlVcWF4MEpScXhWM3l2TEkveUthUXZNN2t1M29xRWpJZk5vT3lm?=
 =?utf-8?B?NitNZGhrUU5lZ3RLTXV3Z3VZUC9TcTcxaHVEVlh4TExCRjRRK3prNlRGSFcy?=
 =?utf-8?B?eVVSaTBOMEUxcTFEZ1V5SEkvQUF1WVBodHl5WWdGaCt2U0lvRUNzK01ISStp?=
 =?utf-8?B?TENBL203R1BzR1lDVHVTVld5Y1BlcFVBa3lBa2k4Y25oL294VTN6YWIxcXB2?=
 =?utf-8?B?eVZkMEVCTjFlMDlXU1NZWlBwbWVTVzc0Y0MvUmVaYlFKamZNRE80cTF5bFB3?=
 =?utf-8?B?YzVJclRoTXk1YXRHbGdRK0JBdExuMGovZjFiYUh3RFZmWGxkTWpIYVpiOXQw?=
 =?utf-8?B?VVJ3S1VOU2EwdlFpMENQU04zS1R4LytnM3Y3c2JyR3JLdEM5Szd6cGVONDVO?=
 =?utf-8?B?MmlrS2F4dVpNc1hocEtodWdmSllnRmI2c0Z4TzJ2Q2F2c1BCeU9XZkMrQnhI?=
 =?utf-8?B?dDRCMU5PK09lVXQwL1lFNk0yb2t1VFZTandqSnIzOXZuYXp5N2JZdkN6NWxp?=
 =?utf-8?B?Y0VEaXFKRUJNUEVQNW5YNzI5clo3UVplTG5lOFQ4QkRldjZNMXFWaCsxREhT?=
 =?utf-8?B?dmR1SWZ4ZVZkMXFXQlFTTlFxeVJTdjhjcCsrVmZBR3RlSGdleW5DYXlBVHBa?=
 =?utf-8?B?UzY4RkNyRWo0T0Rrck5ScjlLRjBrdThjaVJITXVsekordVlyL2lla2xVZGxV?=
 =?utf-8?B?OXBHRC9xMERUNlJqb0NUbU82WGJnUi9xdU9lbjBpQkU4ZkdEVThXSkVMd1Ez?=
 =?utf-8?B?ejFTb0t3Y3FOUUoycDQ3UjZ5SkNBKzA4dFZ1MVlaNkxOakl2RmhmczErVURE?=
 =?utf-8?B?WXgwUU4yNmExbkE3ZzlTemZjNFcxMVc5dm03Tm15Ykxwb00vUjN0ZHpVQXBv?=
 =?utf-8?B?WHBQM01paTBNbEZJTXVCY2lkK1ZNUjArNGFaY2FnVFhMbmVZNUJHak54Tmk5?=
 =?utf-8?B?SE1FZVVNcVl3R0dEM3YxUWlFcWdOK3EvOHRrK0lGOTllZ29tZXp2ek9JN0hs?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e1e22a-3871-47da-7bfc-08dc5a1046a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 10:15:13.0593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VzAu2gqesL0PwH/j3Q0v/NrJ8rJHG2znqqy1KygC9LJBY/wYInkU7mUVKQAPya/foj3CeZjwDeEqBMQPfmstLvZf3bRf6uRtgdNgPHZ2AmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlsbGUNCj4gU3lyamFs
YQ0KPiBTZW50OiBTYXR1cmRheSwgTWFyY2ggMjMsIDIwMjQgMjowNyBBTQ0KPiBUbzogaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIGktZy10IDEvMl0gdGVz
dHMva21zX2FzeW5jX2ZsaXBzOiBFeHRlbmQgdGhlICJhc3luYyBmbGlwDQo+IG5lZWRzIGFuIGV4
dHJhIGZyYW1lIiBsb2dpYw0KPiANCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IFNvb24gaTkxNSB3aWxsIGJlIGNvbnZlcnRpbmcg
dGhlIGZpcnN0IGFzeW5jIGZsaXAgYWx3YXlzIHRvIGEgc3luYyBmbGlwIG9uIFNLTCsuDQo+IFRo
ZSByZWFzb24gYmVpbmcgdGhhdCBYb3JnL21vZGVzZXR0aW5nIHR5cGljYWxseSBhdHRlbXB0cyB0
byBjaGFuZ2UgdGhlDQo+IG1vZGlmaWVyIHdoZW4gaXQgaXNzdWVzIHRoZSBmaXJzdCBhc3luYyBm
bGlwLCBhbmQgd2UgY2FuJ3QgZG8gdGhhdCB3aXRoIGFuIGFjdHVhbA0KPiBhc3luYyBmbGlwLg0K
PiANCj4gRXh0ZW5kIHRoZSBsb2dpYyB0byBjb25zaWRlciBhbGwgcGxhdGZvcm1zIHRoYXQgbmVl
ZCB0aGUgZXh0cmEgZnJhbWUsIHdoaWNoDQo+IHdpbGwgbm93IGJlOg0KPiAtIEJEVy1HTEsgZHVl
IHRvIHRoZSBhc3luYyBmbGlwIGh3IGRvdWJsZSBidWZmZXIgZmFpbA0KPiAtIFNLTCsgdG8gY2hh
bmdlIHRoZSBtb2RpZmllcg0KPiAtIEFETCsgdG8gb3B0aW1pemUgd2F0ZXJtYXJrcy9EREINCj4g
DQo+IE5vdGUgdGhhdCB0aGUgJ0FUX0xFQVNUX0dFTihkZXZpZCwgMTIpJyBhbHJlYWR5IGluY2x1
ZGVkIFRHTCBpbiB0aGlzIGxvZ2ljDQo+IGRlc3BpdGUgdGhlIGtlcm5lbCBub3QgYWN0dWFsbHkg
Zm9yY2luZyBhbnkgc3luYyBmbGlwcyBvbiBpdCBwcmV2aW91c2x5LiBTbyBvbmx5DQo+IElDTCB3
YXMgYmVpbmcgY29ycmVjdGx5IGV4Y2x1ZGVkIGhlcmUuIEFsc28gQkRXIHdhc24ndCBiZWluZyBp
bmNsdWRlZA0KPiBkZXNwaXRlIG5lZWRpbmcgaXQgZHVlIHRvIHRoZSBkb3VibGUgYnVmZmVyIGZh
aWwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPg0KPiAtLS0NCg0KTG9va3MgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5
OiBWYW5kaXRhIEt1bGthcm5pIDx2YW5kaXRhLmt1bGthcm5pQGludGVsLmNvbT4NCg0KPiAgdGVz
dHMva21zX2FzeW5jX2ZsaXBzLmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jIGIvdGVz
dHMva21zX2FzeW5jX2ZsaXBzLmMgaW5kZXgNCj4gMjg5NTE2OGY3ZGM3Li5lZmJjODc3OGQ3ZTEg
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jDQo+ICsrKyBiL3Rlc3RzL2tt
c19hc3luY19mbGlwcy5jDQo+IEBAIC0yMzMsNiArMjMzLDI4IEBAIHN0YXRpYyB2b2lkIHRlc3Rf
aW5pdF9mYnMoZGF0YV90ICpkYXRhKQ0KPiAgCWlndF9wbGFuZV9zZXRfc2l6ZShkYXRhLT5wbGFu
ZSwgd2lkdGgsIGhlaWdodCk7ICB9DQo+IA0KPiArc3RhdGljIGJvb2wgYXN5bmNfZmxpcF9uZWVk
c19leHRyYV9mcmFtZShkYXRhX3QgKmRhdGEpIHsNCj4gKwl1aW50MzJfdCBkZXZpZDsNCj4gKw0K
PiArCWlmICghaXNfaW50ZWxfZGV2aWNlKGRhdGEtPmRybV9mZCkpDQo+ICsJCXJldHVybiBmYWxz
ZTsNCj4gKw0KPiArCWRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLT5kcm1fZmQpOw0K
PiArDQo+ICsJLyoNCj4gKwkgKiBPbiBCRFctR0xLIGFzeW5jIGFkZHJlc3MgdXBkYXRlIGJpdCBp
cyBkb3VibGUgYnVmZmVyZWQNCj4gKwkgKiBvbiB2YmxhbmsuIFNvIHRoZSBmaXJzdCBhc3luYyBm
bGlwIHdpbGwgaW4gZmFjdCBiZQ0KPiArCSAqIHBlcmZvcm1lZCBhcyBhIHN5bmMgZmxpcCBieSB0
aGUgaGFyZHdhcmUuDQo+ICsJICoNCj4gKwkgKiBJbiBvcmRlciB0byBhbGxvdyB0aGUgZmlyc3Qg
YXN5bmMgZmxpcCB0byBjaGFuZ2UgdGhlIG1vZGlmaWVyDQo+ICsJICogb24gU0tMKyAobmVlZGVk
IGJ5IFhvcmcvbW9kZXNldHRpbmcpLCBhbmQgdG8gb3B0aW1pemUNCj4gKwkgKiB3YXRlcm1hcmtz
L2RkYiBmb3IgZmFzdGVyIHJlc3BvbnNlIG9uIEFETCssIHdlIGNvbnZlcnQgdGhlDQo+ICsJICog
Zmlyc3QgYXN5bmMgZmxpcCB0byBhIHN5bmMgZmxpcC4NCj4gKwkgKi8NCj4gKwlyZXR1cm4gaW50
ZWxfZGlzcGxheV92ZXIoZGV2aWQpID49IDkgfHwgSVNfQlJPQURXRUxMKGRldmlkKTsgfQ0KPiAr
DQo+ICBzdGF0aWMgdm9pZCB0ZXN0X2FzeW5jX2ZsaXAoZGF0YV90ICpkYXRhKSAgew0KPiAgCWlu
dCByZXQsIGZyYW1lOw0KPiBAQCAtMjU5LDI2ICsyODEsMTQgQEAgc3RhdGljIHZvaWQgdGVzdF9h
c3luY19mbGlwKGRhdGFfdCAqZGF0YSkNCj4gDQo+ICAJCQlmbGFncyB8PSBEUk1fTU9ERV9QQUdF
X0ZMSVBfQVNZTkM7DQo+IA0KPiAtCQkJLyoNCj4gLQkJCSAqIEluIG9sZGVyIHBsYXRmb3JtcyAo
PD0gR2VuMTApLCBhc3luYyBhZGRyZXNzDQo+IHVwZGF0ZSBiaXQgaXMgZG91YmxlIGJ1ZmZlcmVk
Lg0KPiAtCQkJICogU28gZmxpcCB0aW1lc3RhbXAgY2FuIGJlIHZlcmlmaWVkIG9ubHkgZnJvbSB0
aGUNCj4gc2Vjb25kIGZsaXAuDQo+IC0JCQkgKiBUaGUgZmlyc3QgYXN5bmMgZmxpcCBqdXN0IGVu
YWJsZXMgdGhlIGFzeW5jIGFkZHJlc3MNCj4gdXBkYXRlLg0KPiAtCQkJICogSW4gcGxhdGZvcm1z
IGdyZWF0ZXIgdGhhbiBESVNQTEFZMTMgdGhlIGZpcnN0IGFzeW5jDQo+IGZsaXAgd2lsbCBiZSBk
aXNjYXJkZWQNCj4gLQkJCSAqIGluIG9yZGVyIHRvIGNoYW5nZSB0aGUgd2F0ZXJtYXJrIGxldmVs
cyBhcyBwZXIgdGhlDQo+IG9wdGltaXphdGlvbi4gSGVuY2UgdGhlDQo+IC0JCQkgKiBzdWJzZXF1
ZW50IGFzeW5jIGZsaXBzIHdpbGwgYWN0dWFsbHkgZG8gdGhlDQo+IGFzeW5jaHJvbm91cyBmbGlw
cy4NCj4gLQkJCSAqLw0KPiAtCQkJaWYgKGlzX2ludGVsX2RldmljZShkYXRhLT5kcm1fZmQpKSB7
DQo+IC0JCQkJdWludDMyX3QgZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEtDQo+ID5k
cm1fZmQpOw0KPiArCQkJaWYgKGFzeW5jX2ZsaXBfbmVlZHNfZXh0cmFfZnJhbWUoZGF0YSkpIHsN
Cj4gKwkJCQlyZXQgPSBkcm1Nb2RlUGFnZUZsaXAoZGF0YS0+ZHJtX2ZkLCBkYXRhLQ0KPiA+Y3J0
Y19pZCwNCj4gKwkJCQkJCSAgICAgIGRhdGEtPmJ1ZnNbZnJhbWUgJQ0KPiBOVU1fRkJTXS5mYl9p
ZCwNCj4gKwkJCQkJCSAgICAgIGZsYWdzLCBkYXRhKTsNCj4gDQo+IC0JCQkJaWYgKElTX0dFTjko
ZGV2aWQpIHx8IElTX0dFTjEwKGRldmlkKSB8fA0KPiBBVF9MRUFTVF9HRU4oZGV2aWQsIDEyKSkg
ew0KPiAtCQkJCQlyZXQgPSBkcm1Nb2RlUGFnZUZsaXAoZGF0YS0NCj4gPmRybV9mZCwgZGF0YS0+
Y3J0Y19pZCwNCj4gLQkJCQkJCQkgICAgICBkYXRhLT5idWZzW2ZyYW1lDQo+ICUgTlVNX0ZCU10u
ZmJfaWQsDQo+IC0JCQkJCQkJICAgICAgZmxhZ3MsIGRhdGEpOw0KPiArCQkJCWlndF9hc3NlcnQo
cmV0ID09IDApOw0KPiANCj4gLQkJCQkJaWd0X2Fzc2VydChyZXQgPT0gMCk7DQo+IC0NCj4gLQkJ
CQkJd2FpdF9mbGlwX2V2ZW50KGRhdGEpOw0KPiAtCQkJCX0NCj4gKwkJCQl3YWl0X2ZsaXBfZXZl
bnQoZGF0YSk7DQo+ICAJCQl9DQo+ICAJCX0NCj4gDQo+IC0tDQo+IDIuNDMuMg0KDQo=
