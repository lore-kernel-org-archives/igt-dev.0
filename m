Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3165FC3600C
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 09:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975D110E038;
	Sun,  6 Apr 2025 09:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDlFVwwF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB5A10E038
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Apr 2025 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743932365; x=1775468365;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dtks5xzbl7GmywUlj41WJdECQv3K2+81BvnLjh0EqpY=;
 b=dDlFVwwFC4Omb5FKs5VoCeBzJ3ozIPNdXVzavIg8byaoo35JdtT6Uf/8
 hKHc9TWQMDjeaDc5VQV4IG7WTzabEaW8SnkeDcn5XpqxxdlSVBfL//td0
 oQONcd7x/2nSITdZ++f0KXXDCGb0fBzCNmxfnh1R3d6o3+a5uopakYv6K
 hYklpYqvfEvqiqMpInNBo4ORsYnxNRFHRynj9U2mX7OU8ECc+5UykMR8j
 O9OszoCBrlPMR3loNuGgLJoh3ziUOO2yfurYG4iIUSSja5BCE1Mk3ypN/
 c4mLfAxputYi16ViS6m5I8mKzNiz69Q43WTXj83kH0VLoanMRFQ14eLbC w==;
X-CSE-ConnectionGUID: O2DPHhGNQHGRXhWG5IWuVw==
X-CSE-MsgGUID: CCe+T4LBTXyl73yXwmEANA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="56690691"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56690691"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 02:39:25 -0700
X-CSE-ConnectionGUID: UFIkJA5MQLa5CMGmmf9efw==
X-CSE-MsgGUID: jUZnAjuMQWuZ5JDVRIj9Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="132537317"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 02:39:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 6 Apr 2025 02:39:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 6 Apr 2025 02:39:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 02:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0ZVLTUBZSAjL7T2gttLuFa960C4mVoPPaGIAYgugfa9DymUElhFCGREVfmdVg757iakHhJ4ItkIaB4ttRxlMtiQjxu9P5VRPkwUPKzMqdw5XXH+Sp2zUcrxa59FNM7/pC82PPyNyrq5/tirKmpdslRXhpm6sTaCWbwmTZ5GmRv6lx/hJJqXfPNoSsvIlbOYOH88V1kHhNN6qTLZUTDgGJyqsXd7PqV0s+aT5eKHDxe/lRUJKH+zWmchZx0vOMlwUQl0KRdm5yz0f9l4HYGdMwHGxKprrevWPVSS6Gmczbgg9hyNZ+lalDyFomOG6wzdiK9ft88gDeKufHxZiCROIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x39cReOkc3ft2/jN5CQHbx1Rt7gchhrfSYG5BGOkzfM=;
 b=kF7SHV+ZhBTl6tOSZ+/eHs2HTVawo4frIdAAKUkZGtbEeMJXmu29OZU0sc0ZDp7nro3hJi/egpK4xLf3h0qm9+sEwadBlRaiCEilU7gFEaUdFLZAjvCqg5RmU0c+Fr9gUScuMNSA6Z4GbJRen734sNl77JDSj73koUmjdhBlrMORF2Dt3l+S8Ue3rqyDPMF4d7zGRf3Kn2bp567orL8E6ePy2WotZcpQ/T7nlZyrpTRuKSzcdLyDuk3QM3VGH90x6E9CEPzze7chvtpjs+YyYBf6Bv6tGUs+sEFVick4TgGb9RZdAa4QRBBr+jOrGdVAllNwVBiPlJtHihcQ+ncgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS7PR11MB6294.namprd11.prod.outlook.com (2603:10b6:8:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Sun, 6 Apr
 2025 09:39:14 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 09:39:14 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [PATCH i-g-t,v3 3/3] tests/chamelium/kms_chamelium_color: Fix
 ctm-limited-range subtest
Thread-Topic: [PATCH i-g-t,v3 3/3] tests/chamelium/kms_chamelium_color: Fix
 ctm-limited-range subtest
Thread-Index: AQHbpTKclc9pssnv3kSTKJTBSXD8+rOWZPzg
Date: Sun, 6 Apr 2025 09:39:14 +0000
Message-ID: <SJ1PR11MB6129A59E599CA4A66A5F3557B9AB2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250404072930.695363-1-swati2.sharma@intel.com>
 <20250404072930.695363-4-swati2.sharma@intel.com>
In-Reply-To: <20250404072930.695363-4-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS7PR11MB6294:EE_
x-ms-office365-filtering-correlation-id: 7030c541-8e69-48e5-335c-08dd74eee49f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+JYIQwIw954mVxFi57Giso2m3hIYHcbmLs+CubQE5r5qTWfW3kj3MF8Sq/Q+?=
 =?us-ascii?Q?MnEBBc+5fNa7Orf0wAh0mtLytVB864RMHqhbXLK9MSRD/eX4a7Al2yQcSrq4?=
 =?us-ascii?Q?fkHrB3C3mFCmC01LOiNAfdT4GgAtyeck2g9TziDT3D5yGC9f7G1vRX4D/7kS?=
 =?us-ascii?Q?p73irR/mimGQNQScKBCf02fbLzijc2t/E//AEnuxpYrZmisuN/eWeebROCOK?=
 =?us-ascii?Q?4MwkiPLkpSyQrqjC5iCoGfFZi35TSHUeY0v1taWwwnp477ZAQPodWfM+wOZT?=
 =?us-ascii?Q?EePyIs8wHWkftaHzFP9yLV2bC4ElpLX+QGpkhDwmZXaZI0pDsJa7WhczyYKK?=
 =?us-ascii?Q?qgkbtxx7e1YdRuuyPvkRuu0gfPof8qHlArV9GoHGV5502kFCzq/iKDrkUCvu?=
 =?us-ascii?Q?DLV60m5J/fAlCbWWsIxdIXBCv5gjpxLNq09PS3nNUsW5+xKi/n+nFyGbHlnB?=
 =?us-ascii?Q?2Neu4zHEc8dS5f7RizADfJZ070JWP/7jzU1r79xOMmlUpvnIcCYyZ1UzJiRk?=
 =?us-ascii?Q?5qxMlcqPRUyFGJGDxFa5JARk2bNdxa/Z07o9PBS9OljY/gwm9R6rb6Ww519V?=
 =?us-ascii?Q?0lL7m1lGj7nlCRjWCBBiuzorEnXFPI8gIbWLqj4JhpqMxpOC0g1GKMG7Z8IF?=
 =?us-ascii?Q?oIK9ub2LwNUzNQ9TpT4ga7b1RBEHI41nFc479E0cSejzbuh0Zm/JicPGqEgp?=
 =?us-ascii?Q?0JLaYZ83IlZmSnn387afy+YAdmascW4xB6Po7OHEKdmH6VLJsJTljiAxARfC?=
 =?us-ascii?Q?o8G7vyzjLX5iXZXHWoGEZvVJisKLRWYdUkOqmu4KDf1bRDDYw6Sa25mjOio+?=
 =?us-ascii?Q?IKapI08jBvCmLFAKKCt1hzbTDCCHocut+DS+UbFV8wbMPqb7kUFZdzQhdUUP?=
 =?us-ascii?Q?+YSobvQoVOzcEBtQtGQ0Oa5oCbl8Nz7YQw9ZZlWrJwmtaOXBNtM4chsT0tIz?=
 =?us-ascii?Q?xFsDIO+RCEDdi1XP5dn2RQbBh9T3W8KG/ZH2KraChcgiDQtk0HFjeRNAOjtp?=
 =?us-ascii?Q?w5HSX+SQwfaPgOWyjCn0GdAIH4llUCxrsijn/h7aMmyDSHW6vukdaP3yomGc?=
 =?us-ascii?Q?CIC3u5n7mzA69Td172yZ2DsFd5oS9goLKoFt34FMDg3zELKWoXYGFh0nUaFH?=
 =?us-ascii?Q?oHqe1hMi+Vmzo7S5sYFUBsi0NbzzhQOyHWhuU7neuNEB8UDYDdruVnI4eNp2?=
 =?us-ascii?Q?8/0Ba23OJRiCxpf07iWafxxTw4zBbRv5JslfX2LGnF2FzKCuLWuIbStAExVK?=
 =?us-ascii?Q?oI2I68JvkwAT1ZkeYsivmy/4OGawTkVkrfmCONj79HFUimvVfyuICyTzP7o3?=
 =?us-ascii?Q?k/TfDu4ced/flVUYw4GzqFPBNvXNarN80WUgVSMz3NfR0zcLbDm/uGzuIBzk?=
 =?us-ascii?Q?cFP1QuAIuUnjT8cj0jlLE516XKjyUwda3dlz5od6GAUIwXKj1vrqFMAN4H8I?=
 =?us-ascii?Q?CcblkrhOWqzkL7BYv6HBc3MqjTFNYS/9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6iZPafJ0PjVgyX8Y6Jmm7X/h5ToSvpjrreFU8kYpdjXSUpOdhLmaMCze6Ub7?=
 =?us-ascii?Q?yO5QtmP7OQQIeJjsY+p8WCYmjJbFXu6MYqKpM9dT/7xMAjtmyt9qEKq6moID?=
 =?us-ascii?Q?5pugbW8ELmBXEgeWN3pXsjQgNHjMPLIkg06/C24aJc5xiR8D89fwZztz6pcF?=
 =?us-ascii?Q?epzYqO6oR1jMlV8h3Tc0zJzX0KVqWssWczKdoRfISJXZ14YTsVHBq2jGIZuD?=
 =?us-ascii?Q?m6i2P0Z3ON6cGrkOQ8N4pcaorkMbT9xrY9EakzXRXZ2M30IV5Xio3168jLM9?=
 =?us-ascii?Q?KLC4NgDs2t3ZhmEq4fKbg/4U2VwbPaLFLBgs4AznTNDO6e+q3Dxx0Y1TiA3f?=
 =?us-ascii?Q?QRGb2NrqLpAja4RFazuK7mjof6G/Dd/xlVwSKxQY2y3ezmzro7ONWbua9TVF?=
 =?us-ascii?Q?WotHt+Hn0pIRm70fhLib6N4743TEG0jSAaNLy8tZJidZEtj9Tzux3I9KdX8d?=
 =?us-ascii?Q?IM7gy8wEYLhDO9FUUK/uvMWGwuum8dd/gKuVAgLW5PbZZ89tZFjODYmuChaH?=
 =?us-ascii?Q?lsQwhhegxANOEOq8lBZMWGbLkiAxivKVnQLeYaBOpytDNz0v0nj4r/tN6wcd?=
 =?us-ascii?Q?yGigkSsuSFnMyV1bZoLy5e5DN1mMphyMf/xM3EjhQbundrISzQHIrK6BbK9E?=
 =?us-ascii?Q?/DGX50bNOP5ILT6Q43dMluXGlPITRsboAhlaxwJVM4nts6v6Z0hz6IQExCfg?=
 =?us-ascii?Q?wBzDvjHzFafZQGKr+N90GUR+ZI6JC11H7KL2WSiH7K63l2ZlpDjG3z3ztDOT?=
 =?us-ascii?Q?c+irDSD0jln6Uygft3XxPllEkPGnGYkj0jslGDHS8aLPk5FDb/cnb+kSa/xy?=
 =?us-ascii?Q?SEaRp8FcIzE7NQLJSRV2+Eos4vs3VQIwISBcRSmtmuJIDtTpYOsIxMb/xQaT?=
 =?us-ascii?Q?op9tdNPhKmLC3Sza0NPviX1bSduD982i/Fe6JhfGpEwOhUpvCEFelKB1DnQj?=
 =?us-ascii?Q?Y1cbAStRAzP4d4k5gINyQ1DZie4tsA4eIjn/cIyE6Mc1v4mmlEJrwnzWAqpH?=
 =?us-ascii?Q?u3AVzhCzJEsjOUgsEHSNX3Pl7m7aouAkJFFjkHELdhUjXrwCW+EhAhO+WUKu?=
 =?us-ascii?Q?rKSNxm+PT2UBeMK2ouf58ci/nERMfV29EYSskYWh4j6VpxKSppQRrnQp4uOn?=
 =?us-ascii?Q?F6/3PbUOZRXgRnay4qTnJcJxVNLG5WngAksGU8w04pRGrjV+1lMAYOst2I43?=
 =?us-ascii?Q?OKK8qj5bck8n5E1ZF7g0X9QqRgqmK8iY45cEMSr5epO9dRvy6BRxciw8gBA9?=
 =?us-ascii?Q?c0dOBYtbk2zETbl15hOBuHR3rZBuecQ2Srn5YJ7WYMCgN2m2CdrPru/FK4h/?=
 =?us-ascii?Q?UkioPjs9X/iSTXeUi2Vvsvfnx16/phlwfYwON2wWcg83dBI4G2m5dIv1aROf?=
 =?us-ascii?Q?smEzL1kqaUbPeKgxAfTKProQFsnmxFU0ctDYMAMO0sMxrKittKkU1e5Ot2f/?=
 =?us-ascii?Q?dY4ZMFXBAAMxMXxybhVx1oTLs0U4kjLj8PEmTGEBRp3lYzWt15sN4yfpDIny?=
 =?us-ascii?Q?DlgWRuSTQamQ6ufro3DpDu9zzUGjL9Br9tsJZ3svX6nzf713F9hfFONvv5mR?=
 =?us-ascii?Q?f6RI3FVGutt4/0myQY3PHAq11zqgPbrYQ3w1H8c+kblbxIBNKXUu2AeNnniU?=
 =?us-ascii?Q?PA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7030c541-8e69-48e5-335c-08dd74eee49f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2025 09:39:14.2536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XqWhd2ufQK4lDQ94vtvQRAtP9jyK8ziRYZ6c7akguMZnk+Ri2diNW2mrA7uRnRHCZtuP1eHRnvpc752PLF4954WBy+agZu3gfmoVJI/n2oI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6294
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



> -----Original Message-----
> From: Sharma, Swati2 <swati2.sharma@intel.com>
> Sent: Friday, April 4, 2025 1:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; juhapekka.heikkila@gmail.com; Shankar,
> Uma <uma.shankar@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t,v3 3/3] tests/chamelium/kms_chamelium_color: Fix ct=
m-
> limited-range subtest
>=20
> This test verifies the connector's capability to clip RGB values when swi=
tching
> between full and limited range output.
>=20
> Steps:
> 1. Render a frame with full RGB values (0-255).
> 2. Set the connector's range property to **limited**
> (BROADCAST_RGB_16_235).
>    - Despite the full-range input, the output should be clipped
>      to limited range (16-235).
> 3. Commit and capture the output frame (Frame A).
> 4. Render a frame with limited RGB values (16-235).
> 5. Set the connector's range property to **full** (BROADCAST_RGB_FULL).
>    - The output should now match the input without modification.
> 6. Commit and capture the output frame (Frame B).
> 7. Compare captured frames from steps 3 and 6.
>    - The frames should be identical, confirming that the
>      connector correctly handles limited range clipping.
>=20
> v2: -remove unused fb (Chaitanya)
>     -remove computation of reference CRC (Chaitanya)
>     -add details of test (Chaitanya)
> v3: -use 2 fbs to avoid issues in future (Chaitanya/JP)
>=20

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/chamelium/kms_chamelium_color.c | 88 +++++++++++++--------------
>  1 file changed, 41 insertions(+), 47 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_color.c
> b/tests/chamelium/kms_chamelium_color.c
> index 68611ec6a..5f61bc2ec 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -342,19 +342,19 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  		{ 0.0, 0.0, limited_result }
>  	};
>  	color_t red_green_blue_full[] =3D {
> -		{ 0.5, 0.0, 0.0 },
> -		{ 0.0, 0.5, 0.0 },
> -		{ 0.0, 0.0, 0.5 }
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 }
>  	};
>  	double ctm[] =3D { 1.0, 0.0, 0.0,
> -			0.0, 1.0, 0.0,
> -			0.0, 0.0, 1.0 };
> +			 0.0, 1.0, 0.0,
> +			 0.0, 0.0, 1.0 };
>  	gamma_lut_t *degamma_linear, *gamma_linear;
>  	igt_output_t *output =3D data->output;
>  	drmModeModeInfo *mode =3D data->mode;
> -	struct igt_fb fb_modeset, fb, fbref;
> -	struct chamelium_frame_dump *frame_limited;
> -	int fb_id, fb_modeset_id, fbref_id;
> +	struct igt_fb fb0, fb1;
> +	struct chamelium_frame_dump *frame_limited, *frame_full;
> +	int fb_id0, fb_id1;
>  	bool ret =3D false;
>=20
>  	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> @@ -365,48 +365,49 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  	igt_output_set_pipe(output, primary->pipe->pipe);
>=20
>  	/* Create a framebuffer at the size of the output. */
> -	fb_id =3D igt_create_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &fb);
> -	igt_assert(fb_id);
> -
> -	fb_modeset_id =3D igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> -	igt_assert(fb_modeset_id);
> -
> -	fbref_id =3D igt_create_fb(data->drm_fd,
> -				 mode->hdisplay,
> -				 mode->vdisplay,
> -				 DRM_FORMAT_XRGB8888,
> -				 DRM_FORMAT_MOD_LINEAR,
> -				 &fbref);
> -	igt_assert(fbref_id);
> -
> -	igt_plane_set_fb(primary, &fb_modeset);
> +	fb_id0 =3D igt_create_fb(data->drm_fd,
> +			       mode->hdisplay,
> +			       mode->vdisplay,
> +			       DRM_FORMAT_XRGB8888,
> +			       DRM_FORMAT_MOD_LINEAR,
> +			       &fb0);
> +	igt_assert(fb_id0);
> +
> +	fb_id1 =3D igt_create_fb(data->drm_fd,
> +		               mode->hdisplay,
> +			       mode->vdisplay,
> +			       DRM_FORMAT_XRGB8888,
> +			       DRM_FORMAT_MOD_LINEAR,
> +			       &fb1);
> +	igt_assert(fb_id1);
>=20
>  	set_degamma(data, primary->pipe, degamma_linear);
>  	set_gamma(data, primary->pipe, gamma_linear);
>  	set_ctm(primary->pipe, ctm);
>=20
> +	/* Set the output into full range. */
>  	igt_output_set_prop_value(output,
>  				  IGT_CONNECTOR_BROADCAST_RGB,
>  				  BROADCAST_RGB_FULL);
> -	paint_rectangles(data, mode, red_green_blue_limited, &fb);
> -	igt_plane_set_fb(primary, &fb);
> +	paint_rectangles(data, mode, red_green_blue_limited, &fb0);
> +	igt_plane_set_fb(primary, &fb0);
>  	igt_display_commit(&data->display);
>=20
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame_full =3D
> +		chamelium_read_captured_frame(data->chamelium, 0);
> +
>  	/* Set the output into limited range. */
>  	igt_output_set_prop_value(output,
>  				  IGT_CONNECTOR_BROADCAST_RGB,
>  				  BROADCAST_RGB_16_235);
> -	paint_rectangles(data, mode, red_green_blue_full, &fb);
> +	paint_rectangles(data, mode, red_green_blue_full, &fb1);
> +	igt_plane_set_fb(primary, &fb1);
> +	igt_display_commit(&data->display);
> +
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame_limited =3D
> +		chamelium_read_captured_frame(data->chamelium, 0);
>=20
>  	/* And reset.. */
>  	igt_output_set_prop_value(output,
> @@ -414,18 +415,11 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  				  BROADCAST_RGB_FULL);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> -	frame_limited =3D
> -		chamelium_read_captured_frame(data->chamelium, 0);
> -
>=20
> -	/* Verify that the framebuffer reference of the software
> -	 * computed output is equal to the frame dump of the CTM
> -	 * matrix transformation output.
> -	 */
> -	ret =3D chamelium_frame_match_or_dump(data->chamelium, port,
> -					    frame_limited, &fbref,
> -					    CHAMELIUM_CHECK_ANALOG);
> +	/* Verify frame dumps are equal. */
> +	ret =3D chamelium_frame_match_or_dump_frame_pair(data-
> >chamelium, port,
> +						       frame_full, frame_limited,
> +
> CHAMELIUM_CHECK_ANALOG);
>=20
>  	free_lut(gamma_linear);
>  	free_lut(degamma_linear);
> --
> 2.25.1

