Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DEAFCD0A7
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 04:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE9010E696;
	Wed, 18 Mar 2026 04:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJjgHibD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2154D10E696
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 04:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773807464; x=1805343464;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=C+pGFGKZpMAuzlUz1SS2erJXpPFDcsJGXDGbfttSN9o=;
 b=SJjgHibDnZugpaYDB/AljjqJKRPKCePXJ68oyUIQrbB10pm4YMZCHnmi
 RXdyxJERhG3MYp0B9c8vqerGmKYWNbdWvFnE2wgmodXlI4YW9s9Tbdqds
 sxI+jsC+KzkhFF59Q7Kc6M8M3feau1nmVQ0eINcexcU/b6ZGXwBAzIIKf
 gl8z0cOjfQ9ha7bzAURWyb2Ww9t1s+hq8dRVkCgC0iy5vSobj8GAtp50D
 4OqZ4JYn7a1+PyeUcddHnDWn60fTrinmswpArgPmuVBZBm1jDYBuWEoYF
 KTecvsJmdbK8zEZfTd21myEop/lEeT+amOxZVRttnG6xqGgqNj+sV81yS g==;
X-CSE-ConnectionGUID: JBrlusu9TmGoM+MGqRtoHA==
X-CSE-MsgGUID: 9yu5iy4jRnex+xOEqVRguw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="62419846"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="62419846"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 21:17:43 -0700
X-CSE-ConnectionGUID: /XHKXlu1TSacMEG2EgMfew==
X-CSE-MsgGUID: xm4HmGMRRrahwXZ1Z7pGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="219551596"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 21:17:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 21:17:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 21:17:43 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 21:17:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0vWSdP90s2qh7f89TQZB+SOUZpEcq9oRpQ3BtP8A9lkFGW6wtexME8fEUMPdjyyCIjpIOn+Y7687qyvKZpGK6/jAlKnd3I96Sr3Yr8tVKm1Rlyf1DLFrOEHhuma3OBCbV9dqMZ08Gr/a3VnazYpO2jAJ+6j/nNVavgNV/3AkotrYqcdw8JT6vaL45AZySeNVaQy8giI8bAdhyPfEmYvODjOxA/sPjm0xQsnStWVOs92K997/sQm0WM+0UStH8jSE7/s6zrdsfndn1TSIBHwmtUc61NKVzd3u3Ojgf7KBT81NO/Xn1E9EcoZ+wkjWa8z72yH59BoPgw6Lg+rklMuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+pGFGKZpMAuzlUz1SS2erJXpPFDcsJGXDGbfttSN9o=;
 b=U2ltVB6z5guYVsp9YO1MZoZhhgjllsrd6eJ0cxU1Qo605a7tRb5cKmaSjg3tQZ+3/w76KJ6THZ68/vGKvctRI1MDJz61f/5KeBQaRyp+/WD82jP6/0ddzHQTbvGDxnj8K+GaX546wo73EyT+ptRB/768b8FNYdE1xrkCu1QCcSgCxnhPMTtYXolr1rZl/qrBoJs0CvsEyP6JJVrOY027rBT2n0zsJrIA85L5YwOC3n2rbmLVMYKCLdvjpnp0nYk9mLAgnXth0kVA8zT/y+QA4yUMHOl9E61gozBzmcvPFkMgWSXcu1AvAOR7cmerRgVfMpt6SgnyjdHiMtn+pYqe9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM3PPF960565C2F.namprd11.prod.outlook.com (2603:10b6:f:fc00::f39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 18 Mar
 2026 04:17:40 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 04:17:40 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
Thread-Topic: [PATCH i-g-t v2] lib/igt_psr: Fix Early Transport status handling
Thread-Index: AQHctkSIKI5kBuVxEkykoEp9wnp8UrWzr2Yw
Date: Wed, 18 Mar 2026 04:17:40 +0000
Message-ID: <DM4PR11MB6312F58BBDC1860EBBA5D43C904EA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260226094251.3986123-1-ramanaidu.naladala@intel.com>
 <20260317193058.722290-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260317193058.722290-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM3PPF960565C2F:EE_
x-ms-office365-filtering-correlation-id: 07ffdbf6-95ed-4a31-21e4-08de84a54b59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: oKBY1NOxgIKY+n9DQjIGnPkkVL8SGHWl/aE0b9xpbyXcDtjkOOF2kup19HoNoUWnmlrMZrmWORzSY/OKJm1HGyRGcEb0uxi0ZjreuxmUo+T6blWb2FI1OxX3K1U41b2zvpD2iqfT3nXbILDYLyhBegdifX5f4ouNYi8GpKxXdonI3r0qy6hUxYGTyiZJEkxR9YBB6X2+CWANcvgiuFZ2x7C0nEIbPkZCFUkao7ULPwkQRcRvl1t4d2rbD0R1Rha6xUlDcIW/+PVSDcgxI1rTtjwfu/DNgChqppdXJqR/oGPGOvg+z+LW2ofnXChEhTsmxx5AyVs1K65vbflBI0hv0S2rj+xZojN6Yan5qndGhD1pZi4NloG/8w1DQtrjeinOrvlDMlcCg2oygLMLInvT0oS+HGkak3ZhQVfbxxHb9AOPMlxSpwHCsMMza730Bj64K/eLLH9e2vs9doS0KQLNisVi0fBmWCCXkov22CTWC1C6/uLyak4HaSgU7YY31uIsmE3QbImqg6Ta8uaMRTzIXB/Y/TGIEVGEPcGv95LwvkTThDTv9bqW6ASNflgBHDfNYCrpVnCpdeK7te2ZSZDqrbzcIuoMV1Ce0q60bQ/u2W+vFcPytK2wBaiwPE8/uKZuzM9ldwS3+p0NBK8qFU5KdiiYGst7lRnwDR1UUsU2wmb+IZhaX1vg6xGfZQymIKHqHoMs3TQMm01UB0wRz2ftb1Ba2rSbv/Ap8vlsGNDI2QhQPPr6uO1m9qqmKxWp5MJf4hT0pJ2Oupmanv5zHxXKDZgyj9Z/kjRVNtKWQxvW/nM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3VwRzhRNHpXcjVmT3NTb3V2YmlwM3JBSXRUcFI2Z3dWNUl0a1dIemRZK25Z?=
 =?utf-8?B?Z1IyRExqakZFYlNMdjlBTGcvbWFVWlNqNTIxUkExUzlGNlptNjFJN2w4OFpw?=
 =?utf-8?B?RlpjcnUwbFVUMHFTVlFMZ1lsTUZ6aXRUZjZvTVNWcEYyUkljTHFlUjRSeEhG?=
 =?utf-8?B?VHRqakhNRDZhbnQyRk1xZ0p3TCtWMlcwWVJhK3dNUHNSWkZTMCtqcjV5N3FM?=
 =?utf-8?B?WGYvakVHVDRRSWYxK3dzV1ZhRW9VTDlpbGJwZ28zSWEwaE5IeTFsT0oxdUhH?=
 =?utf-8?B?bmEvM0tCREdrd200WDNQWVhncnNjZEpyNXRSazZKUGFCMm92cW5MWXd6MXc0?=
 =?utf-8?B?MWVHK05wQ1hyWmhIR3d3VXdIem5xZWM3bHVqTDQxQ0g0K1NRZHB5TjZ3cWJ2?=
 =?utf-8?B?bDJteVpuRERVUzJJOFJGRzNlNlE0TnhVL1ljU3VGOERrNStPTWJGY0RqZzd6?=
 =?utf-8?B?enpMT0ExdmxrWWo5Ryt2UmJMQzE1eXVKN250d3I4Z2MzM3A0cDFpeG5Gc0tu?=
 =?utf-8?B?Wjc1RVh5bjltekhTZnFrRG9RdHJJR1NvLy8xL2puYXBvK1JiempQSVc5WmRy?=
 =?utf-8?B?OU5CNWw0YnJxK0J6T1Q5aXFIdHhMVkxxUzR5R2dFb3NWdnozdnh5Y3llSGl4?=
 =?utf-8?B?N21mMDR1am45by9DdXlLT1FhemNmaXg3UjRDeFVPbFpxWlk5WVhqMllIUm9O?=
 =?utf-8?B?RE5LSEJqN0RwUVJJZ1NLdnpEdjRZWjBVK0k4YkNmMWN1b1haOUhaWEJvYngz?=
 =?utf-8?B?NE1QTStRV3hLak1NdEMwaUw3M3RZQnIxdEtkMzBaOXZEcFAwMStMY09hd09p?=
 =?utf-8?B?VWNkQWpETEQwRi9pWXF6WVZ3WmluL0NDVFYwWWxoY3MwQW5yMUhoNVNaWXQv?=
 =?utf-8?B?T3NMdE1leVAvekFSZjArVFhxeStzUlRYNmg4T0FNaE93eEJRaVhtWEEzTHo2?=
 =?utf-8?B?SGNBYXhMeDVRWmNTd1lua1AvRFk2K3lNTzZDRVp2WHVLaEZ1TG1yNkRZN2tq?=
 =?utf-8?B?b2JJZ2Q4Z3NhMGl2elRXN1RQcy9yYUwzL2Y4Nmp0ejhjVU5MMXFNeFdJNzlQ?=
 =?utf-8?B?K0puWGJzRVNPbGRUL2tsY29WeGJTUTlvSUFMOFFrUzdZTm5aWGk1akVrVjJV?=
 =?utf-8?B?WVRXQmJvVGM3KzlqbUFJZXJaOTFtMEtiTlJpVmt6VGVmY0d0enAwL0pQcElH?=
 =?utf-8?B?UFg1L2IwQ20zWHFrYkJrbmErVFVmM1hrOC9TWCt3b0dRenhYZmtvS1dyS1ZT?=
 =?utf-8?B?Nzg3WllNNmNsZ0daU29nVHFIcGgyMVJxbUxDOXE4SjFFUHVIYThFOWtVdHVN?=
 =?utf-8?B?Z2Z6aXAxSFIxaHlyaEE0dVl1RHZ0M1Zpbm1McDRubGRlR0trcUZqK0xYZmRs?=
 =?utf-8?B?bEsxTnZzc2U1Y3NRYUFFc1FzQlNSWGlqajJGTlR5VWlLaC9vem5ocDZDU2pq?=
 =?utf-8?B?dzJSTUxLUmZVUkNPemtLcG4wYWIwaGdCU3ZrR0ZPS2tsOURmVnMrSjRtOVlQ?=
 =?utf-8?B?MXJTRmpaWm1uYWJwRmpVQ3hxQmtXbzJyVWc2RlJQblJtd1JUWFdlbWVvdURB?=
 =?utf-8?B?cmJSL1JGdm9wbmtrQnlmUllMMHlXNzlLcENoQmVWaDZxRUFZNTVuS2RySkNl?=
 =?utf-8?B?bVVwRkF2S1pWa1ljbHk1eGo0WlMvWlN5UlJ4T0x1Zzd5S1dNS09XN01rb012?=
 =?utf-8?B?amMxT05jcXMweDJBbi9IcmRHK3lQNGw5ejNqOHVlcGhDMVovK0h3U0wrT1k4?=
 =?utf-8?B?V1VqMDNuclFpZEV3Y3diWkMvZDdCdzlIVlhXanlvYkc5ZkFmMFdiZ0VqSDRW?=
 =?utf-8?B?TUR5a29yNkx2Y2pmaldSTE1hSVlQU2RHamlkTGFZcFpsaVh1MEYyTFdKeks0?=
 =?utf-8?B?SHVqVyszcE51MXN0VWJPUVFIeW1FdHpidy9XWUo1VWVnVG43c2VCcU54NmVU?=
 =?utf-8?B?UitKTDREVjBGbkpyS2pWdmFvOUtXUjk0MDNrS3hHS0xmMWFDeWVYS0oxM1I1?=
 =?utf-8?B?bXI5RU1uRXF1VHlSZEphQ3FxNkcyMHpYRWdPQnJWaWgrYWpHQkJ6Z0Q2ZFNQ?=
 =?utf-8?B?TFdZQjMxTm40a1BrbW1TcFROWEVzQ1dqTzk4WUtlWnpyNUtwNWdVcHNTbkx1?=
 =?utf-8?B?VC9xQ2k5TzdFeXh2MmN5UDBSeVpnVzhPREsrUERBMjBhem9wbG9xRk83bXpa?=
 =?utf-8?B?Z21JVmgwbFZSd1NiKytSRE9jaHdRaVhxeXhWMThtZzFzWVJ0dms0VjRPSHQ2?=
 =?utf-8?B?QTM0QU50ZGpjTXdIcDZEakFIeEFUcVMrWFlzYmNTb3IrR3U5UnVUY1YzQmNj?=
 =?utf-8?Q?d+/uD2rpLvkOu0QPF1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RfyIDk9QycrVr1JoBYro5dHZ2CJlHJOgzh7pXxGvYgjRNhMwwkhaD92jfvjLQPYSMPdcSVWH/QcKXpXevENJ0Bq6HAU37XZRxLtjyKr20JU+QeIk77Ss30neu49NHo7XlrYjbHjcJiLPI9pwPsrGu3cPpQFRkHD0Cibr8VVM1lOma5eBhK0QkJwU0tOyjR37ZmAYYTWfK5N5qVyu5bwsrHrGLmxWr2oB/gENhubl71HZ5McsrZpVrl050B6T/kIWj8toQIx1l9AVnMxelneJ29tdm7d6ZQ8b72gq4sBZKxnmD1UtoQfRUbkdnoM4I6GpnoanHesm7QrwKj2RusUung==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ffdbf6-95ed-4a31-21e4-08de84a54b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 04:17:40.1599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UQD8SPNQD/zNM7WR1aruYJMlhXKY4iLogzCx0CpJWhi61ZmkNB30yjs2u9zYboDgb7PaqkyEtxWsAt8dwVLotg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF960565C2F
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOYWxhZGFsYSwgUmFtYW5haWR1
IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNo
IDE4LCAyMDI2IDE6MDEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47IE5hbGFkYWxhLCBSYW1hbmFpZHUN
Cj4gPHJhbWFuYWlkdS5uYWxhZGFsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWct
dCB2Ml0gbGliL2lndF9wc3I6IEZpeCBFYXJseSBUcmFuc3BvcnQgc3RhdHVzIGhhbmRsaW5nDQo+
IA0KPiBTd2l0Y2ggUFNSIHN0YXR1cyByZWFkcyB0byB0aGUgY29ubmVjdG9y4oCRc3BlY2lmaWMg
ZGVidWdmcyBwYXRoIHRvIGF2b2lkDQo+IGFtYmlndWl0eSBvbiBkdWFsIGVEUCBvciBtdWx0aeKA
kW91dHB1dCBzeXN0ZW1zLiBUaGlzIGVuc3VyZXMgdGhlIEVhcmx5DQo+IFRyYW5zcG9ydCBzdGF0
ZSBpcyBjaGVja2VkIGZvciB0aGUgY29ycmVjdCBjb25uZWN0b3IuDQo+IA0KPiBVcGRhdGUgdGhl
IEVhcmx5IFRyYW5zcG9ydCBkZWJ1Z2ZzIGhhbmRsaW5nIGluIGxpbmUgd2l0aCBjaGFuZ2VzIGlu
dHJvZHVjZWQgaW4NCj4gS01EIChjb21taXQgYzM5MGJmMDc5NjFiLCAiZHJtL2k5MTUvZHA6IEZp
eCBwYW5lbCByZXBsYXkgd2hlbiBEU0MgaXMNCj4gZW5hYmxlZCIpLg0KPiANCj4gdjI6IEFkZHJl
c3NlZCByZXZpZXcgY29tbWVudHMuIChqZWV2YW4pDQo+IA0KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNTEwMTUxNjE5MzQuMjYyMTA4LTgtDQo+IGltcmUuZGVha0BpbnRl
bC5jb20vDQo+IA0KUGxlYXNlIHJlbW92ZSB0aGlzIGV4dHJhIGxpbmUuIA0KV2l0aCB0aGlzIHBh
dGNoIExHVE0uIA0KUmV2aWV3ZWQtYnk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQoN
Cj4gU2lnbmVkLW9mZi1ieTogTmFsYWRhbGEgUmFtYW5haWR1IDxyYW1hbmFpZHUubmFsYWRhbGFA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfcHNyLmMgICAgICAgICAgICAgfCA4ICsrKysr
LS0tDQo+ICBsaWIvaWd0X3Bzci5oICAgICAgICAgICAgIHwgMiArLQ0KPiAgdGVzdHMvaW50ZWwv
a21zX3BzcjJfc2YuYyB8IDIgKy0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIv
aWd0X3Bzci5jIGluZGV4IDdlNTBjM2RjNi4uMDljMzRjOTdkIDEwMDY0NA0KPiAtLS0gYS9saWIv
aWd0X3Bzci5jDQo+ICsrKyBiL2xpYi9pZ3RfcHNyLmMNCj4gQEAgLTY5LDE0ICs2OSwxNiBAQCBz
dGF0aWMgYm9vbCBwc3JfYWN0aXZlX3NpbmtfY2hlY2soaW50IGRlYnVnZnNfZmQsDQo+IGlndF9v
dXRwdXRfdCAqb3V0cHV0KQ0KPiAgLyoNCj4gICAqIENoZWNrcyBpZiBFYXJseSBUcmFuc3BvcnQg
aXMgZW5hYmxlZCBpbiBQU1Igc3RhdHVzIGJ5IHJlYWRpbmcgdGhlIGRlYnVnZnMuDQo+ICAgKi8N
Cj4gLWJvb2wgZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKQ0KPiArYm9vbCBl
YXJseV90cmFuc3BvcnRfY2hlY2soaW50IGRlYnVnZnNfZmQsIGlndF9vdXRwdXRfdCAqb3V0cHV0
KQ0KPiAgew0KPiAgCWNoYXIgYnVmW1BTUl9TVEFUVVNfTUFYX0xFTl07DQo+ICsJY2hhciBkZWJ1
Z2ZzX2ZpbGVbMTI4XSA9IHswfTsNCj4gDQo+IC0JaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVi
dWdmc19mZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYsDQo+ICsJU0VUX0RFQlVHRlNfUEFU
SChvdXRwdXQsIGRlYnVnZnNfZmlsZSk7DQo+ICsJaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVi
dWdmc19mZCwgZGVidWdmc19maWxlLCBidWYsDQo+ICAJCQkJc2l6ZW9mKGJ1ZikpOw0KPiANCj4g
LQlyZXR1cm4gc3Ryc3RyKGJ1ZiwgImVuYWJsZWQgKEVhcmx5IFRyYW5zcG9ydCkiKTsNCj4gKwly
ZXR1cm4gc3Ryc3RyKGJ1ZiwgIkVhcmx5IFRyYW5zcG9ydCIpOw0KPiAgfQ0KPiANCj4gIHN0YXRp
YyBib29sIHNpbmtfc3RhdHVzX2NoZWNrcyh2b2lkKQ0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9w
c3IuaCBiL2xpYi9pZ3RfcHNyLmggaW5kZXggNzYzOWY4ZDQ2Li41M2FiMDQ0ODMgMTAwNjQ0DQo+
IC0tLSBhL2xpYi9pZ3RfcHNyLmgNCj4gKysrIGIvbGliL2lndF9wc3IuaA0KPiBAQCAtNDksNyAr
NDksNyBAQCBlbnVtIGZiY19tb2RlIHsNCj4gDQo+ICBib29sIHBzcl9kaXNhYmxlZF9jaGVjayhp
bnQgZGVidWdmc19mZCk7ICBib29sIHNlbGVjdGl2ZV9mZXRjaF9jaGVjayhpbnQNCj4gZGVidWdm
c19mZCwgaWd0X291dHB1dF90ICpvdXRwdXQpOyAtYm9vbCBlYXJseV90cmFuc3BvcnRfY2hlY2so
aW50DQo+IGRlYnVnZnNfZmQpOw0KPiArYm9vbCBlYXJseV90cmFuc3BvcnRfY2hlY2soaW50IGRl
YnVnZnNfZmQsIGlndF9vdXRwdXRfdCAqb3V0cHV0KTsNCj4gIGJvb2wgcHNyX3dhaXRfZW50cnko
aW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90DQo+ICpvdXRw
dXQpOyAgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUg
bW9kZSwNCj4gaWd0X291dHB1dF90ICpvdXRwdXQpOyAgYm9vbCBwc3JfbG9uZ193YWl0X3VwZGF0
ZShpbnQgZGVidWdmc19mZCwgZW51bQ0KPiBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0X3QgKm91
dHB1dCk7IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jDQo+IGIvdGVzdHMv
aW50ZWwva21zX3BzcjJfc2YuYyBpbmRleCAxY2M1N2FkMzUuLjc1MDNjNzY4MiAxMDA2NDQNCj4g
LS0tIGEvdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9rbXNf
cHNyMl9zZi5jDQo+IEBAIC05NjEsNyArOTYxLDcgQEAgc3RhdGljIHZvaWQgcnVuKGRhdGFfdCAq
ZGF0YSkNCj4gIAkJCSAgICAgIkZCQyBzdGlsbCBkaXNhYmxlZFxuIik7DQo+IA0KPiAgCWlmIChp
c19ldF9jaGVja19uZWVkZWQoZGF0YSkpDQo+IC0JCWlndF9hc3NlcnRfZihlYXJseV90cmFuc3Bv
cnRfY2hlY2soZGF0YS0+ZGVidWdmc19mZCksDQo+ICsJCWlndF9hc3NlcnRfZihlYXJseV90cmFu
c3BvcnRfY2hlY2soZGF0YS0+ZGVidWdmc19mZCwgZGF0YS0NCj4gPm91dHB1dCksDQo+ICAJCQkg
ICAgICJFYXJseSBUcmFuc3BvcnQgRGlzYWJsZWRcbiIpOw0KPiANCj4gIAlkYXRhLT5zY3JlZW5f
Y2hhbmdlcyA9IDA7DQo+IC0tDQo+IDIuNDMuMA0KDQo=
