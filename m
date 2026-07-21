Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C608EC4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 08:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4856810E304;
	Tue, 21 Jul 2026 08:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DML6qNp8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727F210E304
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784621581; x=1816157581;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u6zGoBqZwhEtvjjF6IG6k5jTYHoZ4YokTJtXJwLCJ6I=;
 b=DML6qNp8TrLRxMTpCoQzRjF+8V7EK8sK8d8s3Ma8JVi6lysL036O4ZNq
 POJDcjcmQ611tnkS7EhZlM1L0YsEUWskY9qxXtCt+PfzKQ9zn6jQwQptZ
 KjB1FgEc2OkTy/TO2a6CztO4ZMb7L3MJTYRz8NQ69xr+jIypbaD1npSTv
 ajd0zdU4bsoBOF3xZBfg+3UsUuqKgq7DiV4zOb68ZqLJrP1k9DX9EfNg9
 mL2ubK7elUm6/ztj3RGMe82jqMBv5fhrdTafbNnaVgX2RQ4MQFHH/uNPX
 V2nsgyL4Weg4SImmsMG3EnllmQTFghTsc/1TvQYXKan+x8hRH1fCn5JRC A==;
X-CSE-ConnectionGUID: M/DEiolvTEikyTldagl3GA==
X-CSE-MsgGUID: c+pYsA6gRGGmeFNjlm2X5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85069062"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85069062"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:13:01 -0700
X-CSE-ConnectionGUID: cs84SaQ1RWub1NOJOyHGlQ==
X-CSE-MsgGUID: dQg174z6TJmtf5zbCwBI8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="253344955"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:13:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:13:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 01:13:00 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 01:12:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMxsyd7GSsxdOIfjVx8DmQNcFj7KJnhiXhiez7iSSsjfG9FC0hHCW5k6pUq9tpChVS0z95cS5GowmQ4CFimS8RNyID2U65riwiBykCCTqbL2r5+a8/Eqd557ufS+r0GfpaXmgiwIWc9a2aJonR9cgTh20ZtTrKQqA397IudckNsExs/nsM3bNvDl/9Rj/fejm7w7vIZwsI6yzOkzJBeTEmm3T/ryzh8ipTLdAnP95Da1xxbF+bMRM51giJQ1q61dnubBukBbHaURq66NfyxlQUHnbBxChL5szhqj3jBBMuM1qZH8pr80rKRK181ueneAZYB0vXLbXl8IWsXfg88nEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6zGoBqZwhEtvjjF6IG6k5jTYHoZ4YokTJtXJwLCJ6I=;
 b=ya/N+bj9yxZf+lgyz1ppyXP1IX/fn06DlW4pQBIJuJQCXlVIWnni1oLTRWyi0D6UUFgDvCsMPQUPIfJjmu3yYei5XQGE8YaFGXNGJU0qqhYkNf3vvKktcTMLfwdUdQv0gBccuckfE/GEdmrggdnEnyp8G0XNzoQCO29+oozmm0S60z7XkyEbqEqcaPYBc3IMuKC2e2mZNsYMY3qCvb0az7VISp9J0WeQavAp4b3E9qPaqNKn8hf4iznqnb1i7nPa+veJNJoSBe/LOrzncr6ExwiZe8PwYsIrEAIrIC0BW0/k9mMsxnhesHyn5oh0eNYK6vJo6hUjL2CDYHtdM0fE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by PH8PR11MB9746.namprd11.prod.outlook.com (2603:10b6:510:3a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 08:12:57 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::7aa6:c6db:3d15:8973%3]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 08:12:56 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Grzelak,
 Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t v1 3/3] tests/sharpness_filter: limit #crtcs tested
 during suspend
Thread-Topic: [PATCH i-g-t v1 3/3] tests/sharpness_filter: limit #crtcs tested
 during suspend
Thread-Index: AQHdB6cMg4Qmg7BN8kCqH4NfSvwWc7Z3wgIw
Date: Tue, 21 Jul 2026 08:12:56 +0000
Message-ID: <IA1PR11MB6467C2DE35D451C7C0128A08E3C22@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20260629090740.2706320-1-michal.grzelak@intel.com>
 <20260629090740.2706320-4-michal.grzelak@intel.com>
In-Reply-To: <20260629090740.2706320-4-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|PH8PR11MB9746:EE_
x-ms-office365-filtering-correlation-id: 730d0b1c-27e8-4f35-ebcd-08dee6ffdf2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|4143699003|3023799007|56012099006|11063799006|5023799004|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: +KU3cnacNq9Ghmm2dHSonG68GtmnjDoL7ICIO7uPFcC6QsQDg0Hg3v2mV4DU/n8so8gPdQsNdpVPtQh6qVdbJclgMxR1hqCQxgl1eGBZtPhMgOa+uxj84p4qNLp6Mg5n3Vp3MIibd7ISgn4jj7fNe4WQwd84754avGj4lEkvWyNfuV3NCM9/GIiwO7UXBUcTKvdbHir5OuQdCu1za9DoGPQpR1LmGdlN/HFyCh0eJBUNO1nGfiREkh7uZtAHPKn2XternErfOhpfUebilkjirDuIu/msW9+dWHW4SGpEapmMQdpqTqFXmHW4fPdDhR7V3XYE+Usb0Q92yQ3mOmQPYS0PzPrdpKOAaeBLTwUVrx0BTMbEFivHvwB7jXmZYe2G24D2i1YPNXDHQqrIeIERIn84d3gBsU60cgSfvMyxbS2jLL+sz4eeNIdPZH/J1OyD3m9HgbISd8K3CQd/Cm8+62LQdtzUW76jX/MSIY9OQTDhIWbwjpekJ8fQYUWDKLxVsL7FpIYkvKY+3FlBjHR4cGUJuO7anZbhzZ8NELWovVRn26tl6Amw7i5AkW0Fad85OjJiGSTlI5Vlv9r5UYgXwpYjXnhbEqfEtcw4fy9BqArcEqDBwr6/OQhEUeoFbR1jfYQAx2lprp3ICaS1P3Wy/p6peGg1RFlZrlMpMZwXoAY1M9WDQfb6FBKvFe/uwjiAHrF+hhqiedUu6UBPEBhJqQUja44OuQKnb24740l9nbc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(4143699003)(3023799007)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tkd3U0lMazNGUzRUUjlQa2pxcHc3d1RaU2pzRFQxZ2VNZUEycnBLNEZmU0Zq?=
 =?utf-8?B?SGIyajJKSVcwTnczemlPREN3VndWeWRmUzVIVnFuSkdjRkJzY1g2c1FoSEFz?=
 =?utf-8?B?a2dYTjI1YStvOXo4eHVCekdPS0k0TXltaEFkMWl0akNMOUtHck9UT3JUZnJ3?=
 =?utf-8?B?YktTNFhiSFMyZjg2YzRqR1lUbU1mc05NWTRJb1hKVTRHaXN1MUxyNW5mNjhm?=
 =?utf-8?B?VGxhVzF5Qm1aUFA0d1dRczEvTVRFWGF3TGtxWFhhM0ZPK0E2SzYyNXMxV3Zm?=
 =?utf-8?B?UUZibXpraFBhazRuT0V4VXFzT3dSSEdzb3NXWnR4OGxVVVdidDBzc3V1dXZJ?=
 =?utf-8?B?b2toNTYxQkh5S3dMWU1rSktDUElQRHBPbCtHTEFWK1pmeE9jYXo5SXh6Q2lh?=
 =?utf-8?B?UUdPUkprS09McFFDdGp4b2hMTDBlM281WHlCSmJTU0V4eEh0T1BOdEowTUhp?=
 =?utf-8?B?Nm5lQkg5OVZnYzRTTDV2bTlMWGFzdXE0UlA2TEtvZHhQekd3UTNiSGwxZUxq?=
 =?utf-8?B?MmNML1hQU3crNnJkN2V6c2RZdkhhVEk1TlJFcko3ZnFUQWNFMEJ1cFVoOS9O?=
 =?utf-8?B?eXA4S3Q4QUN5ZUVjTGJad0M1cVkxUUhkVk4vUkl3Z2dyRDQ4VElnVFgrdzBo?=
 =?utf-8?B?cjU3S1JkamNVaGg4RndxUUFoU0pEbTIrdVNDMVRWdVhuWjh6WXBzZUZNRmIy?=
 =?utf-8?B?ZE8vWnJyUVQ3c0w1YXZIVHFKZ2FzU2ppMk9SdlRzQVRvQXllUVVxanprYUhF?=
 =?utf-8?B?Tmd5VW9yUjBDaVN6WkZNL1E4OEpWNmlmZERWbmUxbWU1SWVaUDlpSlBKYzZr?=
 =?utf-8?B?SEczYW45WWZaSHNtNzV5dVl6T1VuWkhQdDdrczBHS29QQkNIZ0s1U0NESjUz?=
 =?utf-8?B?RHVXQWQ1dFVMYU9CRWlJK1FkSkRROWp0S1dXeXAzbmQ5SFZ6eDJ0Q0pzM1RS?=
 =?utf-8?B?UE9PQytzakFacWdReUJ4K05GTkZKbzE2WXhiZ1hoL0ZqTkVqN2tycDhEMm5a?=
 =?utf-8?B?ZGpVOEZNVWRHUnJpeS91dzNxcXpZN3dDN1dYTWhmVUI3STRVVGRlV0E3SG5C?=
 =?utf-8?B?aUxvR0lMVGlKcEkxdk51UVE3elhyTmxYdzIvMVZtTDY4QzZxUU91YVE1Q2JB?=
 =?utf-8?B?dSs5ZXgvWGFyWFZtMDNrQzEzVnprODFrcmdVQjgrSEozaDZNQ2F1aE85MmFL?=
 =?utf-8?B?ZHhyc1RjbUtTQm9jRUQ3eXlQLzUvNnJiOUhEQ1pkczRnMFdaNFBJNFdnb2NI?=
 =?utf-8?B?Z09xb3UyOU5FVzZVNzYxcmxXa0F5WVhDYTlhNys1QkdONFFVY3dya2hOZEg1?=
 =?utf-8?B?S2RkcjhMN3dMVUdKWEVYMkdIYW5WOG1oYTZCeDd3dUF4SnFDQWtERUczL05F?=
 =?utf-8?B?NGF1T1RYZDVVT2VJV29qY01wOVBlVWdIUnJmQ3VwSGpSOTNFUWFtVjZzbmth?=
 =?utf-8?B?c1hYTWEzY290QWUxTlN4VUY0c3NNZnFqMDNLSzQ4aXI1ZkFjY0xOdlJuTXpX?=
 =?utf-8?B?ZG45T2FVWjc3MWtiTDJGeGkyWjZtMlBka2Z2MWZvVldVZW5heEc2NkhtVkpT?=
 =?utf-8?B?bDNzbGwya3VhUXgzL0d6WW1RVko0dDFBaVluM3RHNURTak9mVzUxKzVlREh4?=
 =?utf-8?B?T2ZNdlF1cGUyUEhmdEFGck00OU5CaGsrd2Qxa0Z5VXBNZmpsUFh6djdneTFH?=
 =?utf-8?B?SGlYWTFTcmN2dm81MUdZdldCM3lFckRXM0k5SnZwQzVsM3gvTUs3NEdXc2Qw?=
 =?utf-8?B?K1I4K1l1cHpXbmxCRUJYRjMvTWNMRWpKVTN6b2szeWtZcUpwMjhRc053ZU5C?=
 =?utf-8?B?QU0xYStKS0ZGczlpaHpsajdwcklKZ3dLN3FXTzBRazJ4TGFwQndHZkVHRzJi?=
 =?utf-8?B?Q3ZpcmUrUGw3dmpyUmVBU2VBdWFXSVEzVkI3VkI0dXFxVDRRRWl6MFRpcU5u?=
 =?utf-8?B?b3lBRmtBNGRJSnB5dHNuMWZCWHpQTXZXMEhUMHBXcGZuVkVCYXo1ZnV3cHc5?=
 =?utf-8?B?TnlYejRsWHdURFl2clJEWGY1K2pNTTNCdGdMR0hkUE5xUk9VQ1VrdSs5TC9l?=
 =?utf-8?B?ajVsNEFjVWpCOGJZOGJGdmxRVEhaZFBqUXFoYlExQTdRMWlsZ2pMNXJtMkJ6?=
 =?utf-8?B?b1FHVGJvcXJONzU3TlIwUGRuUlJUVmljM2wrYS8vdmFlaFlzRmw2NlhjNjFq?=
 =?utf-8?B?WWsyayt2a0V0Q0FINGk3UUQ1RTlEOXAwZkM4NGFVN25JbTdyMzVhTGdldTlY?=
 =?utf-8?B?TEk0NW9MY1Z0TGNMdlloeUFIUU15eDBQVjRPMDUrS3ZDYTNPTStnK1NudGtI?=
 =?utf-8?Q?SAPbHCbpCyulJZuoaZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TnLsX6KOwgl1vI27tM7hhfnEx2M3QXzS3HRJg2Cccw0e6PSIRsd3h/QredAmREcXBOkbolfmxh+Fe1vFs641if3PzV4YzN+g7fOBR9XJwJN3bvnF+29m9cnDTOaUNlR0uCJ6QmMFRyFlTxASZ8cqC0ld8o3P7wRRTEZDUF0r2AW59ngtJD72X+enJiM5oJzglhhYxiRRv/587ke+NfwhQ03efzqjFYWU7SKfcQvjyWn7lQDI77fFDzxJjoosSLURv+aRPF5nQ+TyLE7FBJDqBEImffIBTKI0pbRsWyZYf7qc+YZTiqpwv2X8w9Cf+0UgGHxKr7ZP5IMjYRQLRDc/4w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730d0b1c-27e8-4f35-ebcd-08dee6ffdf2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 08:12:56.8246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDf+Lg7u1hxLfcuMseFi71oCrXWnWHcpLjxQnwAWwU9lmmZyWh2fsEtKDovf+p7GkyfmQOGWFZgEg0ZJ3dBxag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9746
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1pY2hhxYINCj4g
R3J6ZWxhaw0KPiBTZW50OiBNb25kYXksIEp1bmUgMjksIDIwMjYgMjozOCBQTQ0KPiBUbzogaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGp1aGFwZWtrYS5oZWlra2lsYUBnbWFp
bC5jb207IEdyemVsYWssIE1pY2hhbA0KPiA8bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjEgMy8zXSB0ZXN0cy9zaGFycG5lc3NfZmlsdGVyOiBsaW1p
dCAjY3J0Y3MgdGVzdGVkIGR1cmluZw0KPiBzdXNwZW5kDQo+IA0KPiBXZSBhcmUgaXRlcmF0aW5n
IHRocm91Z2ggZWFjaCBjcnRjIHdoaWxlIHRlc3Rpbmcgc3VzcGVuZC4gVGhpcyByZXN1bHRzIGlu
DQo+IGV4dGVuZGVkIGV4ZWN1dGlvbiB0aW1lLCBpbiB0dXJuIGxlYWRpbmcgdG8gaGl0dGluZyBD
SSBlbmZvcmNlZCB0aW1lb3V0LiBMaW1pdA0KPiBudW1iZXIgb2YgdGVzdGVkIGNydGNzIHRvIGZp
cnN0IGFuZCBsYXN0LiBUZXN0IGVhY2ggY3J0YyB3aGVuIHBhc3NpbmcgZGVkaWNhdGVkDQo+IGNv
bW1hbmRsaW5lIHBhcmFtZXRlci4NCj4gDQo+IENjOiBKdWhhLVBla2thIEhlaWtraWzDpCA8anVo
YXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnpl
bGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwva21z
X3NoYXJwbmVzc19maWx0ZXIuYyB8IDE2ICsrKysrKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMNCj4gYi90ZXN0cy9pbnRlbC9rbXNf
c2hhcnBuZXNzX2ZpbHRlci5jDQo+IGluZGV4IGZjNzA3NGIxYzcuLmFlNzAwY2I1YjMgMTAwNjQ0
DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19zaGFycG5lc3NfZmlsdGVyLmMNCj4gKysrIGIvdGVz
dHMvaW50ZWwva21zX3NoYXJwbmVzc19maWx0ZXIuYw0KPiBAQCAtMjMxLDYgKzIzMSw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc3VidGVzdF9lbnRyeSB7ICB0eXBlZGVmIHN0cnVjdCB7DQo+ICAJ
aW50IGRybV9mZDsNCj4gIAlib29sIGxpbWl0ZWQ7DQo+ICsJYm9vbCBhbGxfY3J0Y3M7DQo+ICAJ
Ym9vbCBhbGxfb3V0cHM7DQo+ICAJc3RydWN0IGlndF9mYiBmYls0XTsNCj4gIAlpZ3RfY3J0Y190
ICpjcnRjOw0KPiBAQCAtNjAxLDYgKzYwMiw3IEBAIHJ1bl9zaGFycG5lc3NfZmlsdGVyX3Rlc3Qo
ZGF0YV90ICpkYXRhLCBlbnVtDQo+IHRlc3RfdHlwZSB0eXBlKQ0KPiAgCWlndF9vdXRwdXRfdCAq
b3V0cHV0Ow0KPiAgCWlndF9jcnRjX3QgKmNydGM7DQo+ICAJaW50IG91dHBfY250ciA9IDA7DQo+
ICsJaW50IGNydGNfY250ciA9IDA7DQo+ICAJY2hhciBuYW1lWzQwXTsNCj4gDQo+ICAJZm9yX2Vh
Y2hfY29ubmVjdGVkX291dHB1dChkaXNwbGF5LCBvdXRwdXQpIHsgQEAgLTYxNyw2ICs2MTksMTIN
Cj4gQEAgcnVuX3NoYXJwbmVzc19maWx0ZXJfdGVzdChkYXRhX3QgKmRhdGEsIGVudW0gdGVzdF90
eXBlIHR5cGUpDQo+IA0KPiAgCQkJaWd0X291dHB1dF9zZXRfY3J0YyhkYXRhLT5vdXRwdXQsIGRh
dGEtPmNydGMpOw0KPiANCj4gKwkJCWlmICh0eXBlID09IFRFU1RfRklMVEVSX1NVU1BFTkQgJiYg
IWRhdGEtPmFsbF9jcnRjcw0KPiAmJiBjcnRjLT5jcnRjX2luZGV4ICE9IDAgJiYNCj4gKwkJCQkJ
CWNydGMtPmNydGNfaW5kZXggIT0gZGlzcGxheS0NCj4gPm5fY3J0Y3MtMSkNCj4gKwkJCQkJY29u
dGludWU7DQo+ICsNCj4gKwkJCWNydGNfY250cisrOw0KPiArDQo+ICAJCQkvKg0KPiAgCQkJICog
RklYTUU6IEpvaW5lciArIENBU0YgY3VycmVudGx5IHVuc3VwcG9ydGVkLg0KPiAgCQkJICogUmVt
b3ZlIHRoaXMgY2hlY2sgb25jZSBzdXBwb3J0IGlzIGltcGxlbWVudGVkLg0KPiBAQCAtNzUxLDYg
Kzc1OSw5IEBAIHN0YXRpYyBpbnQgb3B0X2hhbmRsZXIoaW50IG9wdCwgaW50IG9wdF9pbmRleCwg
dm9pZA0KPiAqX2RhdGEpDQo+ICAJY2FzZSAnbCc6DQo+ICAJCWRhdGEtPmxpbWl0ZWQgPSB0cnVl
Ow0KPiAgCQlicmVhazsNCj4gKwljYXNlICdjJzoNCj4gKwkJZGF0YS0+YWxsX2NydGNzID0gdHJ1
ZTsNCj4gKwkJYnJlYWs7DQo+ICAJY2FzZSAnbyc6DQo+ICAJCWRhdGEtPmFsbF9vdXRwcyA9IHRy
dWU7DQo+ICAJCWJyZWFrOw0KPiBAQCAtNzYzLDExICs3NzQsMTIgQEAgc3RhdGljIGludCBvcHRf
aGFuZGxlcihpbnQgb3B0LCBpbnQgb3B0X2luZGV4LCB2b2lkDQo+ICpfZGF0YSkNCj4gDQo+ICBz
dGF0aWMgY29uc3QgY2hhciBoZWxwX3N0cltdID0NCj4gIAkiICAtLWxpbWl0ZWR8LWxcdFx0TGlt
aXQgZXhlY3V0aW9uIHRvIDEgdmFsaWQgcGlwZS1vdXRwdXQgY29tYm9cbiINCj4gLQkiICAtLWFs
bC1vdXRwdXRzfC1vXHRcdEV4dGVuZCBzdXNwZW5kIHRlc3RzIGZvciBhbGwgb3V0cHV0c1xuIjsN
Cj4gKwkiICAtLWFsbC1vdXRwdXRzfC1vXHRcdEV4dGVuZCBzdXNwZW5kIHRlc3RzIGZvciBhbGwg
b3V0cHV0c1xuIg0KPiArCSIgIC0tYWxsLWNydGNzfC1jXHRcdEV4dGVuZCBzdXNwZW5kIHRlc3Rz
IGZvciBhbGwgY3J0Y3NcbiI7DQo+IA0KPiAgZGF0YV90IGRhdGEgPSB7fTsNCj4gDQo+IC1pbnQg
aWd0X21haW5fYXJncygibG8iLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsICZkYXRhKQ0K
PiAraW50IGlndF9tYWluX2FyZ3MoImxvYyIsIE5VTEwsIGhlbHBfc3RyLCBvcHRfaGFuZGxlciwg
JmRhdGEpDQo+ICB7DQo+ICAJaWd0X2ZpeHR1cmUoKSB7DQo+ICAJCWRhdGEuZHJtX2ZkID0gZHJt
X29wZW5fZHJpdmVyX21hc3RlcihEUklWRVJfQU5ZKTsNCj4gLS0NCkxHVE0sDQpSZXZpZXdlZC1i
eTogTmVtZXNhIEdhcmcgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCg0KPiAyLjQ1LjINCg0K
