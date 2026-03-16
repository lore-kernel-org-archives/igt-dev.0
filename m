Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13440F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B707410E1CE;
	Mon, 16 Mar 2026 08:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvyKNll4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA2D10E1CE
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773650262; x=1805186262;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=xI7QNrYTDJ8Hy44/jSiLyJPvBHYSjNXFUEj8ZATRgQo=;
 b=MvyKNll4nb3zvcUeapO4Npc87M6BPPuXVXs/mZYhVj/VL5yOic3FLPtS
 jCL6HINmZiDRE6FheqgRfMVB3gIFbQnFAWT3oD69hnrXKSFUEdJE5L5NJ
 GfbeBGK/nhDPvSchjShVMCmNBk892weUZrK8lu2btmvXQh5Ydls2lsqBX
 MoEOE6uzfTwGSxNDhpbGCdVVFzr0D9kqc2dxf2jKIOx+baMWJjZQ2V+rl
 5V19WMYoBjj8/bUJGlUqophDeG5j+Peuj9WRr0ZVIPDOYEfmjO7m9IOKc
 o0u3szEBqWgiwmXwW63B8oqYBTBZIxfnH4hr/iaj2lkANFX+zpKs3sBRO g==;
X-CSE-ConnectionGUID: 0R+zpUMVTbKWV99UA4JAJA==
X-CSE-MsgGUID: GGE8xI6jSUaTpAl+vOudBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="73674923"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208,217";a="73674923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:37:41 -0700
X-CSE-ConnectionGUID: cOcaqZuPTy2Du7eQaFWUSw==
X-CSE-MsgGUID: GT0OPcW5SbaEj1pw6iLEEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
 d="scan'208,217";a="226509783"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:37:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 01:37:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 01:37:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 01:37:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czm1tr+/SVQ319FcAu6scoHk7fptGB/jNqpsuaoNPSUwCgbRtENHKvwbkFpwu+c+5W8yiTPfg1HCjtSeVm8OSuPh3a7vuedm//wi/GC1T3EciwUa4Z69YLhKFzcS3L1WArta0KtCoZU4CH/V95qcePwGLiXPxO/rKL9yBipPMhE570wBL3IOVuKIf1P7EIAoHnkRWhaTQgC4RwBgAnndztQ7TOBjJdQUESG8uJllmHv0xnONuwc9LVxRC/6TNPVGPpxRLqH9vi098NR73vS0kuY8e8QyCbfJk9GqQ0sXunEd61C6zBGmdEU4PPtkwbaWV8HsKDYHHM/sOusbJLyXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xI7QNrYTDJ8Hy44/jSiLyJPvBHYSjNXFUEj8ZATRgQo=;
 b=KRsClOnKsdfARXlgRgvZ8fQfIQCC2BL3ovDMNTV7Yp5XqYqEpjJ//G2V6hcZ84cEsuBXp5iHqH0sWlEB8CDraKU0kWIxWTvpFhkaSa5rG6OTa/TtzXB5j7HweE0jZVfI6KNS6lpAEPxdD4lsczwZC3d6btDzXA0xlSJ14oafe4hxsfB+hlsUFlAxSfGN4QPRUQyCPeTQ9M6jw4ZBUQj9qxLRZcgR6CQF6gavqS/dVq5gEhr+EIcrafMm88lBSaLTwNq3uHsZcTkj3hMWM6BwWvS+YDOFtlZr9UOtzD/G6NLgHP2eC3Zjeq71gt+YQrZdqAfBs4+trO00/cyREwyMcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by PH7PR11MB7003.namprd11.prod.outlook.com (2603:10b6:510:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Mon, 16 Mar
 2026 08:37:39 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::a2d0:b1a7:897e:7faf]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::a2d0:b1a7:897e:7faf%4]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 08:37:39 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: Fix invalid mode timing in
 igt_kms_get_full_edid()
Thread-Topic: [PATCH i-g-t v2] lib/igt_kms: Fix invalid mode timing in
 igt_kms_get_full_edid()
Thread-Index: AQHctR47cqp/K28OIUaR9GEU4LRu3LWw1e+A
Date: Mon, 16 Mar 2026 08:37:38 +0000
Message-ID: <CY8PR11MB6889F4ACE8978E647F5A1A66DA40A@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20260316082053.3333398-1-mohammed.bilal@intel.com>
In-Reply-To: <20260316082053.3333398-1-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|PH7PR11MB7003:EE_
x-ms-office365-filtering-correlation-id: ea24a134-07c7-46c1-9270-08de83374822
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Au77ME1rv+NQXt2MzkkuNR7W8C7yid0nFWRkUQfAYIiUbVdbimwq65dHcVYEJxyG1yJmwEqMHhDAFxIRW/PpNgF2yqJNSQmpiWs1PiNTowHYj8oi040UMNQNVtH9qupDfsCbF9PAGdV0Q2WZ77GIS7XvTY+/gKXo8Qj4bw8h5pTJjNyGAGIg25gorwvLowAPUw+JcTig4zUwAsgkI+fYYThcY9paVVOCEXtquXiT+1aO/7Yw38Svbd2mc0YB/CRA/n2IVCv2E5LSntxXfH8wqAFTOdbW+cFsRHPkbifDl8DVeU36BGYUxzyNFiYrZFKlAvKjePFnleMB19eZAX5Xh20haXgACCAiyrj55bbKWRtIdxH8fOOKTcDi/yKvC/9NnEY5KygeMyDYMJbc66EdoGW9vSn4OPHxIoKDiN1koNP+o102VwQmDOwxHoAvtxnFb0qVcQpFCg2hVw7ZNlk25g2O14FKu79ad+pc2C8UqtamSN4mJsaloVEIlkC7M3FqQy8qzLhOFenhUsZ1T+1+SD+Y2MZlRL7waGafBpmfxD483+Lgr6idGk44K+ePsijrqYBI/5xtI9nPO74m6AI/Dn1SO7HPMVy65DHca57CqQFh4+ttqjh+7rlcwxGLzFcoBrhyc9xeL+A7WHln2BJsm5xo76C5r6YjXBjCr2KrABVDmSCTv7RjkvuV6dePTXWecz9l3pafkeaLbr/kY4pXEJSpM1WkX6sBGg/0+Gxj8Ec/h8HL+277TzihEExMCsmX641Sd/ClcMEohDQBmyhErlQC8wcgUSMXP/lONOpsZsw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?i4gA9mKhd4gY47hylaCYdS/NWxkUpsmYdnLMpV5xyUksRsvot0NB4VG0Gr?=
 =?iso-8859-1?Q?sS2T4mq+I/7DuYe0H29/izESGSDRqhbkcl4ucEsefUuOoy8WwqNNFnpN3c?=
 =?iso-8859-1?Q?Uw57i0C8Q/fcHSGtuiuKVVNKfCd46BJ/7kNnf/3//mMyp0x4uHv1+2o7ng?=
 =?iso-8859-1?Q?SIvtg1qV9eO28E3Fv+1wwZK4dY6pGNyLE95PMtUtVzKDYw3E16dW7akgAg?=
 =?iso-8859-1?Q?YkEcEgMTkm+xn1oIvNuKI4gc+UmlhAOkpoRlSFeqlLnoRaFgGuooAwPedC?=
 =?iso-8859-1?Q?iZFm0fJB7tkbzmH85fIg+VBXs7Fn66G+f9VYMR16P1b2eydywgqSMpm5/Z?=
 =?iso-8859-1?Q?FL7K7VubgaOjbB+MoqyKyyGdVzzmQtu56LxoI/8SuNHebN1nw2whCT3YKg?=
 =?iso-8859-1?Q?384cPVGJg5CpVey1yFumS8qHH+igyKQlZ1hY6G8PXih0lVPpUMWfcn6j0H?=
 =?iso-8859-1?Q?W1lA2E+72I/RptuOHaY2I+cyfrImsEzCLvoMU4hMTrgZbrurQH9frF1rwN?=
 =?iso-8859-1?Q?EV/e92gtNE+f1SLf/IYgu7DRSmmQlFcdxZG7cKBSer6g7+myCJK64j0fuh?=
 =?iso-8859-1?Q?9kC1H61P8casybji7Fek6+01PW28z3gXIwOjL3MUzo9euQxppzO7trKPew?=
 =?iso-8859-1?Q?a26unZBOtihYJChcPFbRU7nmDbRnK7xCD4Fwj8kni2T/cKOcQpjCcJUxAe?=
 =?iso-8859-1?Q?UmyOI8vbj7VThxiMCavLnmHEts44Ym2ZCYs++DCmzb/+1TLdMruUpxnVGA?=
 =?iso-8859-1?Q?EbM+QwB49loXDp9HSuicDeEnpCQWOYXaEo7EBy3SAFANIJU0SXgoZb4G03?=
 =?iso-8859-1?Q?XR3rN6bMDhysjlnKOV3n9s+l9L/CRKYS4wzRj+3jS+WtBvAqV+ZUAhy2T5?=
 =?iso-8859-1?Q?fDwkbKJ7yR7zB+Poue1hFjb9iFWGCLmGUm4nixyj0PDy1BiVKO67G7AyEO?=
 =?iso-8859-1?Q?IRSoW7jYayqjJEddp7tPF12LQriAdo5X2rT15FFh/Zrk6xNB3j/eU8poaT?=
 =?iso-8859-1?Q?tuw5SXHdi84FafbpRtMTKVDq9uqfR/YLwgAo7p3T/oK3SmDRQe8HYsgGNT?=
 =?iso-8859-1?Q?QuNx1nOCcD/s5hQ4wseJ1GIyAETowIgy6RN9B+cCzM1/wHkmbgcNu0jT2Y?=
 =?iso-8859-1?Q?9lVp04gNSuC5sEtLqwmL5aMVNLfE8IWc5Ypj6j/VlsmL9mvN6jaZ9JqZps?=
 =?iso-8859-1?Q?6SbICa5o7VZDOz+sSKCvKfXqzF9Ab+0Po1jCjXfPwOeXKODNKbyY4RPMPZ?=
 =?iso-8859-1?Q?xRpDlQN9ong8Iag7z1khDh0+u39T98OxYcZTZ7x4zZoRdX+5g9yFktbdgK?=
 =?iso-8859-1?Q?5U+A0KFVRkjQFvithAX0rQqJOvn7eKBniYHds6ylQPnZVBOgVZFE1PHf+N?=
 =?iso-8859-1?Q?3fFPxOidBVNJ9Svy9hGOXBzZf4kkHk6SJ9GVFLzqAIhYb9SkZ+HAxedbQ/?=
 =?iso-8859-1?Q?9UkGTA4kAf/+wA2iMpdx77b/m9THPyA56OdkotLoEk4AGCxnw4X24+Qj/D?=
 =?iso-8859-1?Q?rDjIuctbLYq1etHmIb/GR5ObMvYmvAYVMLv759bLXyc5bczC+DwUoPiYaK?=
 =?iso-8859-1?Q?Zl4gH+gWoLl7Zwm4iTa9IfpyNTA/L7GLeEfjfDLZ6igkr0MZggAyY3jtfi?=
 =?iso-8859-1?Q?FS4OGfGObMrIFImmUhIHNPVT5VjT5bI1MS5Dw10jO1Xqgo40SvDY3bHQl7?=
 =?iso-8859-1?Q?21C25FMI9fr4eZJS1Zjg0y0Ha12vbr7qqVHoX7pHE7XnjF6j3B/Kke+kB4?=
 =?iso-8859-1?Q?pidKcboyPA9XHqtSl3VF1g2d8JYEx4oGD+shuhFqlw4oXE06VgeL6Z6tVM?=
 =?iso-8859-1?Q?VEBdjIe8Uw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CY8PR11MB6889F4ACE8978E647F5A1A66DA40ACY8PR11MB6889namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hMOtQ1b25TcrZO0XZ8ICokx7RKNMXjj+Zd0aUZhRerYB69SujLq4ntdjg4Dzijl6Tnt3V2xURXdPXPT2MD+xRDOTFR8nvyvAliJteT7OVbIkqFiIXIJ92DZqHQFmnwzMBKY5E4OBvRGCFzzzTpNNOJJ8Jzg5wpENxZME2Fk1vCgi1aGJofVVZX8oFCbk9pWIZLIrZEvIEDTRIX1szCZkgrXMR2hxGHlFbXbWguU6nXesFeGUgtAN9tTTv8pCerP5Bom6xYG+umLQMkjWJ9wu8KFheuC/AKymfo8Xnqs1NZ318NzKrrnIgEoCgkh7ozFQfXzWL84Nsa21+dhDBvzoZw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea24a134-07c7-46c1-9270-08de83374822
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 08:37:38.9646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cR4yxZNilsy6/07yF797PVvmI0pybLWlt1fSHrJnpNH2Hx+K7tYO+WCByoOW1UajReBIupsQCiLS4g/ALV+ASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7003
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

--_000_CY8PR11MB6889F4ACE8978E647F5A1A66DA40ACY8PR11MB6889namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>




--_000_CY8PR11MB6889F4ACE8978E647F5A1A66DA40ACY8PR11MB6889namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<pre style=3D"margin: 0px 0px 10px; padding: 9.5px; border-radius: 0px; dis=
play: block;" class=3D"elementToProof"><div style=3D"text-align: left; text=
-indent: 0px; line-height: 14.3px; white-space: pre; font-family: Calibri, =
Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=
=3D"elementToProof">Reviewed-by: Kunal Joshi &lt;kunal1.joshi@intel.com&gt;=
<span style=3D"font-size: 11pt;">=0A=
<br>=0A=
</span></div></pre>
</body>
</html>

--_000_CY8PR11MB6889F4ACE8978E647F5A1A66DA40ACY8PR11MB6889namp_--
