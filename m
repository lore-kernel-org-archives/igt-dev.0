Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDF6C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 10:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584010EFE1;
	Thu, 28 Mar 2024 10:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXBsup3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE5610EFE1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711621959; x=1743157959;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=uDa6iFlGrswJmL6/33hjutS29cy+2RF0cYwqawWDa0E=;
 b=SXBsup3ZjsyNAzU2n6Znx92GTZK5/gL9VzlJerk4KnXzeK6NjjNJQO6L
 GDRgXcXFScuDlTtPrs1pF4tlrEHZ/E9OkbVbV+1uO2oSLhKw8CeHk+EAU
 zHjKa4B0SLnq9a1qb0x4CU2VbuOYAnn940+3MjthvX2XOaoi7yASuXEwT
 j9QD5Qrd5lx9VV/h7/Hnka2JaSvUzrQCEQi7GXmkVtwwnT0iPB8o5M6b+
 xiNcqvAVipHH3wjBP4O/QXpz2smq5d7qYpdCQaT6dxzqHoYGDPeEIH7MS
 uM9gjO43MBzV1d0bija4MSryT8+3yqwKWUS5Le0QC79qnNAL2ZLpGFkEo g==;
X-CSE-ConnectionGUID: yKxpAYWwSeqkIfisO25RxA==
X-CSE-MsgGUID: FzNI5EzpSXeraHQXUlUk3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6627773"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6627773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21330345"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 03:32:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 03:32:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 03:32:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 03:32:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 03:32:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOMU92a0fVhiQdWR1xuhXqxLFmKELKyUzkQ1nLdlLhFtawBb6gAtfriTpVxUbE6QrIs9mvblST23wRMkhkQJEXz8Aht5CoFYZpRZ8E/4eXpz0ec6hyCYxB0zxEsRKw0632+HVKZ0gIvC9wykOhoVxO0lJzH7jK3nne3eDf658XBlR5ilIjSe8gD911kZf4x0eqEx/YLjAJTbyK5Y3RKsnoBP7EsNGcZd4FIgT4KsCldwUYUcT1H960pdPHofgjbOYw8+fxS7SusWaMr0wx0Fk1kEGZAQIgMNs9C/QE3c59UEWWJzTaDNy4oqMSF23kwtlqD+jdsftCrXy4ZToO6QyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDa6iFlGrswJmL6/33hjutS29cy+2RF0cYwqawWDa0E=;
 b=cr5AU9Idh+nmz6gVfhr0DKiM7kq0qRQBGzPJ4qWbi2HtJtDBQ2kRMUimZ762c9iLkj8nOMaehHcEwJOBnVk9VX8ufjWPfZNIusivAPcZ38nhABy6pwVjw8PJIkn9boKaA06wqq+tBdAbH//EFNxiJ7s4M11BI1W/0P9YIPHQAlGS5o/EjeJ47EkHtamu8D3EocSPrK0piPnXbXe27wjR76UAwpmLtYcJ3RuS4Kg2eQsW0/tqiugMZpEyjlyF81uuQJNdXnUUXav5kRyCTCNxqx9JkNNsSveuDTlb/9kj2SYa5O5kNTkcQT3hltj4CxZ0bTQOoAolGaZQVajsBLdatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.33; Thu, 28 Mar 2024 10:32:03 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::d317:e2a8:8e14:7bff]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::d317:e2a8:8e14:7bff%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 10:32:03 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_fbt: Skip fbcpsr tests on
 Wa_14016291713
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_fbt: Skip fbcpsr tests on
 Wa_14016291713
Thread-Index: AQHagApe4Xz2vENPNUynPUXOQ0XbgrFLg/OAgAFyToA=
Date: Thu, 28 Mar 2024 10:32:03 +0000
Message-ID: <4b739a3d7e09c2be96f2b90e1a412cacefac1b3a.camel@intel.com>
References: <20240327054750.159017-1-jouni.hogander@intel.com>
 <7d4e83557e56bea9fc347d3a8b71963d9733eeb9.camel@intel.com>
In-Reply-To: <7d4e83557e56bea9fc347d3a8b71963d9733eeb9.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB4840:EE_
x-ms-office365-filtering-correlation-id: d52db770-874b-4f5c-c8d6-08dc4f124ede
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sTIDQepzvhsd2fgc+G8dMn3cBxOmOHL2PSSIltKxYRrwJPWKdsEKGpSu8HrA5iFfr5gBPJmwGv29pcWZEiZKWG7xgCpEmgRt19j6mEMMGl0YkYN0hJPn8Tu0jnmTVRvICgLuC0uur+Ehs5O4QogYU+/URU+lZ4iAEhBisOJsnDh1wio9vFy0Uts8dnQczPH1JL5nH9lL6wNj1ifwBmwmTO6p01jGdtfk40STIn4xIapUukfH/mWTbQUqMIhP7L1sP3/Xysu/Hhwfy/FyAVO7OfYJjqxyuHZ29GOYwndKuyitr+eOZsVI+ejRt9e6I6lIbAFJ/Xt2PCMBEtImOdyWcafMKpFx/snON8RCdRZOa306rkT25hybl1Q7+IsSEzwqlDnDXSoMKnCUxOVyNRwy4t0B5GWATfiNjA58AfIpDaRZg9EQen5sV+sCBE/bkg8p1HKNzbRyiQHdFTx2BvSV8oZHTrwXO1xpJ0h6XUF6cOlTlp9Apw5IiTjiIJGz4GOkN/si/G8BJwNrcOxPQ5pJLQ1BJEt7S+vbw/9nx/f+J7JVdG4CfLiy8V5clKqOfSTCLPEDkLNuFTklAGdsDzwBzaGfIzBoZuhVrEUHJGkkYsxz+AfsMZAEpaek6Io7whkkInHHyomYiTlvlR5dRfGmendK7ybpkEqXUcOswM7RoS8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHMzcSs4WStGQlJuMHZnTWVPb2pzcXlHTjN3R3k1OVNqdmJWWUtjMUdiVFVa?=
 =?utf-8?B?M2ZXZTJhazVOdExWdGFmQlJxSW9JK2pQS21vbkZ4M2lpS0RrSDJNaFZyTi9o?=
 =?utf-8?B?cXlMK3FLa1E5S0xXajJQR3VrNEJWRWMyT0x0MTluMjRyalUvTjRydWt1MStD?=
 =?utf-8?B?c0liL1Z3ZkZiSVVHanFYbkJTMXM1eHFNZmpMRGx0eG5OUWQyeTUrWXR4eFZr?=
 =?utf-8?B?STBzeWVibFEwbERESWREUG0wTTArajdTczJwbHU2YkRhbmd1cGsrNWhHZTZM?=
 =?utf-8?B?aWc3L3RYc1dBb3dubnVXV2hXVUNReFQ5WGdpWW91YXprRHNSUnAzZW5zLy83?=
 =?utf-8?B?N2dyZ1VyaUptTFBFdHpTeGVaK2FaVGkxL25IZmNZNkpPRGJTVFhhcUhGUk9i?=
 =?utf-8?B?U3BXdEQrL0VCdU5MdG12SGN6YnBoaklTY1hEbzRGYzRvNnRrUUhDYS9rZmMx?=
 =?utf-8?B?ZlEzeTlScDI5dUJWUlNFSVJEVVhDRlh4R2JTaWVBSXo1MkhPdGlaQ3RQOUln?=
 =?utf-8?B?cFhOcG1iMkVuNXRxMUptbGl6cFVTQ2poT3RDUGNXbzcwU1J1cTlDTmRyMmQ1?=
 =?utf-8?B?QzZmQVlzeU1vRklGYVRCQ3dhSjhVWkEyTkY3S3p5LzFVWEJ1OXJSMU50N3F3?=
 =?utf-8?B?VWJyMGNpM3R1WE5wZUlHQVBQSnB5TE9hV21JZFFXSUFUY2o3ZTZJQ3ZsbjJx?=
 =?utf-8?B?MzY2N3JZR1NPL21HcWlKaTNaY3FwS0RLNUFpVkc4bVp1d3k1eDRUMkE3SFpu?=
 =?utf-8?B?czBFNEs3aG50d1V3bVhqUWdHY1lSU1lVVFZhd1Y3WHNlQXFUL2swT0piVEpx?=
 =?utf-8?B?UmFIYVFVMXg4clZmZVhxemM4UlJHcXB3dXJqc0F3cXVvQXBJeEJRZnhTaWRE?=
 =?utf-8?B?a2EwYkNhNFU3MXZxeG42ZEFkc0NwWVc0a3I5RjlDUXFpNFh5Tk1YMU1PMUFD?=
 =?utf-8?B?eHlBZXNBSjU5anJNbm1LOVVvSnIrOU1qL2puMjJvMzBJUGdXNTVxYkhhZGJw?=
 =?utf-8?B?STczNlZycHQ1TWZyeGNEeHlOZHRKTUEyWXA5NjJQRkZPaENNTEdMb25hZHJo?=
 =?utf-8?B?b1FjNTlXQjZCcG1FOFVhUWgrRlFiTnh6YWZiZVFIQnpRRU9rbXlOcXZiOGFy?=
 =?utf-8?B?MFhwUHN3Q3J3SFhmVXpzSE0vaklQNjZwdkxTTFhCMFprY2FhQk5EOGczQ3VE?=
 =?utf-8?B?VDlxRXZ1MkZxMUV5Y1o0NllkS0k4dkdqSUszS083NCtYOWdsekRUZ1hieGY0?=
 =?utf-8?B?Ry9YcjFsRU1CZUg4U2wrWnJIc1FDTHhYUXpia1kvMHJhczRsRFdhSzV2YnJ1?=
 =?utf-8?B?YitkUFZxMTdjQktuMy9GRkNreis5RndMSFNIeHBiczdqQ1VZMnZBNXJsd2Zl?=
 =?utf-8?B?VEN1YVdyRmhlVWRzTHZ0NXFNWW00c3BIVS9DTG95dmhSMTN1aUtxZlMxK3Zh?=
 =?utf-8?B?UkpwNWRwQy8wQVJnenhQVXEvdTh2U0owbmpsL2lNaUJNLzI5MlpmVTFBTnd5?=
 =?utf-8?B?VFFGSHF2M1JzYlFJZVR1SE42Uk9sc3BlTWRveTE0Y2VPNFZpVy93TDFrT0lp?=
 =?utf-8?B?aURRaUp1U3U5NGk2VjNNK1VwZ0w5T3lQcEhsTFpqakp3UklvZGttL1Q5eG1s?=
 =?utf-8?B?dVhtc2ljUVpWNWRYN2xQdXpScXFFUWdaenhzc3FWd0NrRCsxb2tJYk9MbFIy?=
 =?utf-8?B?SUJKbTRkdWN5RUpjci9jamxOVFM0ekNaakJyTG5xLy95M3hEcWxqTXVXa2Qr?=
 =?utf-8?B?djVPUmNXYXJFY3lhMEVFUmlMd0IydE0zNzRHNVIzRnFSd1o3M1RKVmFTcTFt?=
 =?utf-8?B?WCtRUFlSbXp0S21DVjlqZHpyMk8vT1JKTDg0NWlzT0U1WkI1SVRxZlpEZ09x?=
 =?utf-8?B?MG5xTno5QVlRVytncXRyb050Ryt1d2RHeW5remVFMjI1TkxFeFYvbFhTL2Q2?=
 =?utf-8?B?cVN1bk9sbnNKLzFQZEN5d1F6Z1FMMThVbm1xTGdtcWpVOENKaHd3M2pOVjBs?=
 =?utf-8?B?dEdUbkxnVVlCZzRTMEpwZWUxaU42bUd0N0ZzYXBvbzBNdDl2eHV4OUtJQ3hQ?=
 =?utf-8?B?NTRaZ0FZZnVhN014dytSK0lKamkvRGg5QlZJYlNIVEoxaFdKaEYrOEdsUkhY?=
 =?utf-8?B?K2luN1llcDBMOFpFMGpOVUdRTXdyV1ROVlRtdVV1aGNzbUFRbkxPcFlmUEls?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2E7D526E90ADC4CA441734F8811F827@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52db770-874b-4f5c-c8d6-08dc4f124ede
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 10:32:03.0740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WC4gKchhe46E/J1ya79cqTvVteM9uhG2WK/r5q0Tq56YFLgN3V9Q1duyoOZqvMjTS4jujpA+ffVclP7s5dHFY03E0m1+YfRtaiBywp9mnFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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

T24gV2VkLCAyMDI0LTAzLTI3IGF0IDEyOjI2ICswMDAwLCBHb3ZpbmRhcGlsbGFpLCBWaW5vZCB3
cm90ZToKPiBPbiBXZWQsIDIwMjQtMDMtMjcgYXQgMDc6NDcgKzAyMDAsIEpvdW5pIEjDtmdhbmRl
ciB3cm90ZToKPiA+IFdhXzE0MDE2MjkxNzEgaXMgZGlzYWJsaW5nIEZCQyBpZiBQU1IgaXMgZW5h
YmxlZC4gQ2hlY2sgdGhpcyBmcm9tCj4gPiBGQkMKPiA+IGRlYnVnZnMgaW50ZXJmYWNlIGFuZCBz
a2lwIGN1cnJlbnQgdGVzdCBpZiBGQkMgaXMgZGlzYWJsZWQgZHVlIHRvCj4gPiBXYV8xNDAxNjI5
MTcxMy4KPiA+IAo+ID4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2ludGVsLy0vaXNzdWVzLzk1MjUKPiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8
am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiDCoHRlc3RzL2ludGVsL2ttc19m
cm9udGJ1ZmZlcl90cmFja2luZy5jIHwgOSArKysrKysrKysKPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKQo+IAo+IFJldmlld2VkLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2
aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4KClRoYW5rIHlvdSBWaW5vZCBmb3IgcmV2aWV3
aW5nIG15IHBhdGNoZXMuIFRoZXNlIGFyZSBub3cgcHVzaGVkIHRvCm1hc3Rlci4KCkJSLAoKSm91
bmkgSMO2Z2FuZGVyCgo+IAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2Zy
b250YnVmZmVyX3RyYWNraW5nLmMKPiA+IGIvdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3Ry
YWNraW5nLmMKPiA+IGluZGV4IGRiMmRiMGZmMS4uNmQ1Mzk1YTBjIDEwMDY0NAo+ID4gLS0tIGEv
dGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKPiA+ICsrKyBiL3Rlc3RzL2lu
dGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4gPiBAQCAtMjAyNSw2ICsyMDI1LDE0IEBA
IHN0YXRpYyBib29sIGZiY19tb2RlX3Rvb19sYXJnZSh2b2lkKQo+ID4gwqDCoMKgwqDCoMKgwqDC
oHJldHVybiBzdHJzdHIoYnVmLCAiRkJDIGRpc2FibGVkOiBtb2RlIHRvbyBsYXJnZSBmb3IKPiA+
IGNvbXByZXNzaW9uXG4iKTsKPiA+IMKgfQo+ID4gwqAKPiA+ICtzdGF0aWMgYm9vbCBmYmNfcHNy
X25vdF9wb3NzaWJsZSh2b2lkKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoGNoYXIgYnVmWzEy
OF07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBkZWJ1Z2ZzX3JlYWRfY3J0YygiaTkxNV9mYmNf
c3RhdHVzIiwgYnVmKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBzdHJzdHIoYnVmLCAiRkJD
IGRpc2FibGVkOiBQU1IxIGVuYWJsZWQKPiA+IChXYV8xNDAxNjI5MTcxMykiKTsKPiA+ICt9Cj4g
PiArCj4gPiDCoHN0YXRpYyBib29sIGZiY19lbmFibGVfcGVyX3BsYW5lKGludCBwbGFuZV9pbmRl
eCwgZW51bSBwaXBlIHBpcGUpCj4gPiDCoHsKPiA+IMKgwqDCoMKgwqDCoMKgwqBjaGFyIGJ1ZltQ
QVRIX01BWF07Cj4gPiBAQCAtMjY5OSw2ICsyNzA3LDcgQEAgc3RhdGljIHZvaWQgZG9fc3RhdHVz
X2Fzc2VydGlvbnMoaW50IGZsYWdzKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZ3RfcmVxdWlyZSghZmJjX25vdF9lbm91Z2hfc3RvbGVuKCkpOwo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfcmVxdWlyZSghZmJjX3N0cmlkZV9ub3Rfc3VwcG9ydGVk
KCkpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfcmVxdWlyZSghZmJj
X21vZGVfdG9vX2xhcmdlKCkpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGln
dF9yZXF1aXJlKCFmYmNfcHNyX25vdF9wb3NzaWJsZSgpKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKCFpbnRlbF9mYmNfd2FpdF91bnRpbF9lbmFibGVkKGRybS5mZCwK
PiA+IHByaW1fbW9kZV9wYXJhbXMucGlwZSkpIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnRfZihpbnRlbF9mYmNfaXNfZW5hYmxl
ZChkcm0uZmQsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAKPiA+IHByaW1fbW9kZV9wYXJhbXMucGlwZSwKPiAKCg==
