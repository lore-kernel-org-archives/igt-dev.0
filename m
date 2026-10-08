Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240B8CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 09:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD08F10E299;
	Thu,  8 Oct 2026 09:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtcWWHRN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4183C10E769
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791451557; x=1822987557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U+TuabMdWCJ/Cly4G1I/mppWeO2A0aiOsHfFMtGazf0=;
 b=OtcWWHRNSKLmDmqXEFGAsbYJOiJLead4YDbaxG4lhhrclO5aM9ZYIyXj
 c+C5PFeEms64o1IPUIMhnymz72aGj1Dp5zYCFGMlYUVBynteHpmcO3yIk
 ghqXUa01H7FKkVE0w8diDydjy//4OYLNleuLmx8kKCu23uxdZBacg3To5
 fYyaFpmhUpCNgqjCdssIXWDf/ihOXpKJFnSXgHsr5Kk9zTDOr+gnThPTy
 BWbGiuxNb52Slmh/ZaXJtVxacNtgshUH0s0NuE0VYKGyLvJ3xFIZqZwrd
 khZ8CnlJgdR0tlB2YVRQGunQAtmahdmGWoN5JPfZLuijh71jdecNSsxOP Q==;
X-CSE-ConnectionGUID: OXOIuMKeRE25bouIZsRcqg==
X-CSE-MsgGUID: XNam77D0SoSaP2fx79PSBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="106017"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="106017"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:25:54 -0700
X-CSE-ConnectionGUID: AG6TF0ijTTGrrlnS2WH/eA==
X-CSE-MsgGUID: 0mqxvdMdQXOW73DXzLgUcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="338916"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:25:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:25:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 02:25:52 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:25:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrnSXP3xCcdqXxhDxfhzOJQ/era1PY8r8+CgJDceUvr9glBOTpX9neKoDPfI5gLYqSa2jzqWFe+K65KDBVLcZ9mGKzOcffZuXBXabtIUt5aQdI3UHhlpj/UrBSITL//Y5dKoRDkZZMVU9nno/lVT24891TDwyLVFJO/ULwV84eUEhLEfgKCXJ5sXvmpEdYu/U9U5iBW06RedRVnZoGZxqBk3o/JBihhnzvbxXYQuFO8vFgM2ccn/zus+hHZB6dJGKIqvtYe+KiiJUxP5tq418e29q2i4BFqk0XT971I4W1Mc8POn9pKvAKcLUebM2K8d/LTTzjy6Xq1aVe5+EIu+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqghKEgUTZCw2EZ9V1n8p3pq7tq+Co+eSTsO4mSgh0o=;
 b=RFQEmcuzLcXoNV0fpaz1dDepqsXHVqmttkNG/91qB9XDClPtWbbeqgNf7Dggvk3xHT2ID/a6AD9Yx9/t/+U9bWGAwtwXylv0jItD9WYZF+v/gj7iINDBv1KV/rJ6gBEgNXkqFpMEpL5utyg69QNW3uoOJK14iuGp6CzxvXFoAtoqE3Krdh71yeDOX9PYpAncqMPs8HdOrWIQCyY1+9nxe6QpcQ332t8h40vinsCZlo6KtsgfQfvvZD4UERhQaqB8foE6zyZo32ZJ9Zbh2k+1h2Z4c5o9GSiRPOsBXhay/feU/YqA5A6TWRvujUCuTEUgrgs5DpLZe/Rti4Ezl+3Xzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 09:25:45 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 09:25:45 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 5/5] tests/intel/kms_alpm: add ALPM LOBF subtest
Thread-Topic: [PATCH i-g-t v1 5/5] tests/intel/kms_alpm: add ALPM LOBF subtest
Thread-Index: AQHdT/GsQy+jKso5NE2R+OqF7iIfdrbyICoAgAE/01A=
Date: Thu, 8 Oct 2026 09:25:45 +0000
Message-ID: <PH7PR11MB6796E901E11C81435DF0ACBAE5932@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
 <20260929090454.2796967-6-sowmiya.s@intel.com>
 <MW4PR11MB57761E0DE571DA4C8C4E788CDA942@MW4PR11MB5776.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB57761E0DE571DA4C8C4E788CDA942@MW4PR11MB5776.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH0PR11MB5144:EE_
x-ms-office365-filtering-correlation-id: c04f5c60-73ba-409d-ce46-08df251e2188
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|10067099003|3023799007|38070700021|56012099006|4143699003|11063799006|5023799004;
x-microsoft-antispam-message-info: SytRMYtZUYlr3vL1md7i2CkpWNAoEYUHCoBwE+7T2x6I+CFHhTdkmPlbN4OV4J2Ply1h4TaQ1PZdKtGLhpNty8cj5IdQzsOGgmvX5vPDul0o5Pt9VMuEK8S8KkRJzB0sS+g/tOloIEqI+EjK3fQEyFnJrsqY+p25T2D+b74h84UuMLLnyPgvOSIkBFm/MDjftUvcy4JwrNwl+mz5lYjpyP4Bmh67mlvAtUoJOMzOxoWFWeA3d3VZe4xOZYd7+aomhSHTPfZZF+mINnrWQBucL5V3zui+hqu01XvCeScYsA4OGAyZ769adZJstKYKdxMQHpBJL2ThwcKNXIB0XIYmtEZp0PTJPEybh80md1nMMHz/NZNQFu+cVVJ1xz0ciHIqt2NuxSzOEzGo151eZ+hl+ckL1EO5TysiQcu2KfWT4nTZajhsGBcAQwg2M0HjCzdjkjtc2mcRBVFnR64wv5+WuskEtSwC2rxGtCZT2z1Y2CoCCu1jXGP/lgThRsr/MaimBjuqe551U4+2EHCtj2sWYk0OmOuXYadUczqnTnPmgL1FdR7CpblZSvOJW4bUPXvo5D3wgdovmIrT4LgJjjNk7+uZBB7RpPasyoJ9Hths8mgGKXwvvPbS++REMZcud881lqeMcTH2SYxlYvANGWbaZEC6EAJtoaiUH0krUwDJ13Yyx1w9vnmf50ednemnlVhDakNsGvnFsnBtOXPNt8UEYt/vuqTvGjH3cUUus6+kMUQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007)(38070700021)(56012099006)(4143699003)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l8eE+K4x0+st+Bzh2vixB0qIqtn3RjFB1/zKQbyzver8viNGQoOD5JpvnmZH?=
 =?us-ascii?Q?07haotqWlLrAS/Sis+xHr0fhWcgng6ijiMkRvVP3WkccDEiKDXYUFFI/Ou7+?=
 =?us-ascii?Q?2ve9G/bXTjOdUHJhVmxh6urKXSans5UrO81Hnuqf6chuO63pVjy9xTkVtyaU?=
 =?us-ascii?Q?lf0d8JRjh9FzIEKfhqkqq26axwa6FusBk7x73lpQLFi4oZaArMkghsFvkcdw?=
 =?us-ascii?Q?S+DpP6Z8Ac03spuFPVXVO3fBBR98yH+5XIEaruHZwJg6BLHpx2HgArqkRAui?=
 =?us-ascii?Q?HYzrTamcRJ/wwNthzRpCdnTsoHOBop7TALBgGYMvyzSgN+ZAD11JVWunmzEV?=
 =?us-ascii?Q?nZS6TfDSFsXyOnBchhqSCjA9FUITROKDZ14eptfWQQQp2ietqudRXmRKnwd3?=
 =?us-ascii?Q?q+HgFWCdYQzRdI7ALL+VbNYXGDbaRE/xnE6T4X91fH//mCTInQ40Y04uoKdw?=
 =?us-ascii?Q?iaoWOSnuxZLc2ug9RD6e5L8Ys85v2TI4PMXLTXzENJnVFyMYi0NolYpeOqbr?=
 =?us-ascii?Q?UfunBu9QQFolWg8lUuqmEhLHwbiT6XI4qdDWCGosa+uK3zLWvHGRzdmkCXGz?=
 =?us-ascii?Q?xkq0W8yWoCUzOnRasQytZkRU18ZG1CaNEuNH7WBchVY9jLe37/6dF+ohgE9d?=
 =?us-ascii?Q?WlMr0rZY5ap0oVa5GulZqgSFSJOfBaafbWwDDnBdLM5qqOwWQwpd7LKLmdw6?=
 =?us-ascii?Q?Sct9g8/u71lxGGLErf8BE9jD//8UXd5uZgMKRcn9lgvSg/o2ot325pbNEuUH?=
 =?us-ascii?Q?ISP1AIp5Czd+ZE23pKigM2VLBDU7hFHpCneznH793nrFmodAcqcmyby0OCH6?=
 =?us-ascii?Q?zXAr4NTdlCwCA2E0erLQUffU4g13G6c1xdrCr9BAHpV3EOPxuaHLjRi4paIb?=
 =?us-ascii?Q?EV9CDf7EhUq/9ob5VBJUHkUGFwJ5vi5I6m1Hw1k/61swjUH+abCJF4gwjJIo?=
 =?us-ascii?Q?zJxcoW9sjEZhM+g6q2BrCRBdzq7Nl/U3gR54vA8pBeSWKPDtbFeQojyTI5IN?=
 =?us-ascii?Q?4Q15Up5n1xBwDHbMLuQXl+Q6oYLgYAapXnU/mBP6aScBlemoOaKYAou0c2h3?=
 =?us-ascii?Q?82RRVD26WQLct1GLzzIP3YfmNELsNDmSc0mdE22T+chrOBtmLG70xumk3M0k?=
 =?us-ascii?Q?gc90kxYER8T+dU+HOxaAhRwovwuDaNqijk4WO08YRuh57z1Pq2WZNEkCrOY4?=
 =?us-ascii?Q?8k5W4nO4PUvBNE5oLX3fSzEtL6e9hUsadazoonJxCE2VLuo8WRfF0DS90EdB?=
 =?us-ascii?Q?aEoYVK9SLiBopXql7VmRCRW2ydCVTCe739TpHs/J/ImeGXweioECmm3OphUU?=
 =?us-ascii?Q?l14x/5KdZxRr7jNC8nrSg+L7MV/GwOP50bET0rVGRHGlNlEjIo2f5zgr+RuE?=
 =?us-ascii?Q?FctrmXv1TbRpEG0Kf1oGYyv3aCQ4nExU7ipyYv03LVA9ZKbasVOTSBtuDprq?=
 =?us-ascii?Q?TXwba8Nwycc/p0m+hdnPMlJr4kGSMoFhtocYWiI+gT/0cT9eqOQrQjcHISwR?=
 =?us-ascii?Q?VPFR2a2YoUOpkxZFn5BzBNFcsQMjVEXXva/Zn+lwMo1OksM7RZFmkW7nBi3R?=
 =?us-ascii?Q?7uNUdqFo9D5HTB0UBerMytvznjCZGA8s/6ZRLXUrx7iBnMys2NT59LMtAKPD?=
 =?us-ascii?Q?w0g8iUfSXg/h9nsfOeVl8IbQq8VxAZXDqW9SRpt6H7b/i8M+yt9o5CJ/qqUz?=
 =?us-ascii?Q?fTOW+WgjwmJ0NnTLVkik2uxn/TJKnV2br/s+52YlYztTcaW1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yLqFhL1IVIitT/riVPwbYKvGlqxSFxIvzvRl96goU+hrnABljY4hjHzhiPRPnHl4nIBl/xF8zOVlceq9C8lmpAKJLM2o9hXuplgk4GvAltgialTPOn6DQ42qlTjd8uxFcxEVL4NDDkv/AVyl8xN8TMcz4W/9ebwbeiZ32jqkpbQvZL3lEdwcSs/vs0jLJMv6fmZPvjgPvYFRQEzaLxL9S8uTDiRO7gnRh9C1s5u39ii9WzfTllo0jHR92iqKppgojE/zd8fmhVIZs0mE0DoI3U7KV6w6KV8UGMlKzXdtAcZvxwb/VVZyG1gs0VGxdotpNtlLvi+eBwhELMoFoL/ECg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04f5c60-73ba-409d-ce46-08df251e2188
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 09:25:45.1377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKWq7X/PUP9QXn105wSo0z6hBTFMavBb2lRCHLteBQA1Yc8dFYU6rr29jvWX7aY4FZopADxWnif///Hbi43PlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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

Hi Kunal,

> -----Original Message-----
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: 07 October 2026 19:01
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: RE: [PATCH i-g-t v1 5/5] tests/intel/kms_alpm: add ALPM LOBF sub=
test
>=20
> Hello Sowmiya,
>=20
> > -----Original Message-----
> > From: S, Sowmiya <sowmiya.s@intel.com>
> > Sent: Tuesday, September 29, 2026 2:35 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; Joshi, Kunal1
> > <kunal1.joshi@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> > Subject: [PATCH i-g-t v1 5/5] tests/intel/kms_alpm: add ALPM LOBF
> > subtest
> >
> > Add the alpm-lobf subtest: verifies LOBF (Link-Off Between Frames) can
> > be enabled on an eDP output once PSR/PSR2/Panel Replay are disabled,
> > and that Panel Replay stays off while LOBF is active. LOBF is eDP
> > only, so DP outputs are skipped during enumeration for this subtest.
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > Assisted-by: Gnai_Claude:sonnet-5
> > ---
> >  tests/intel/kms_alpm.c | 177
> > ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 176 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c index
> > 700d5fb50..914b594bd 100644
> > --- a/tests/intel/kms_alpm.c
> > +++ b/tests/intel/kms_alpm.c
> > @@ -30,12 +30,42 @@
> >   *              eDP: Panel Replay may use either aux-wake or aux-less =
ALPM.
> >   *              On both connector types, LOBF must stay off while Pane=
l
> >   *              Replay is active.
> > + *
> > + * SUBTEST: alpm-lobf
> > + * Description: Verify LOBF can be enabled on an eDP output once
> > PSR/PSR2/
> > + *              Panel Replay are disabled, and that Panel Replay stays=
 off
> > + *              while LOBF is active.
> >   */
> kms_vrr already has lobf and lobf-dc3co subtests covering this: they call
> psr_disable() and then check "LOBF status" while flipping at video rates =
on a
> high and a low refresh rate mode. Please say in the commit message what
> alpm-lobf adds over kms_vrr@lobf, or move the shared pieces into lib so L=
OBF
> coverage lives in one place.
>=20
Both are executing different scenario, will explain that in commit message
kms_vrr@lobf and @lobf-dc3co already exercise LOBF via flip-rate
    variation and DC3CO residency; this checks the simpler precondition -
    LOBF comes up via a plain modeset once PSR/PSR2/PR are fully
    debug-disabled - and that Panel Replay stays off while it is active,
    which kms_vrr does not check.

> >
> >  #define ALPM_INFO_FILE		"i915_edp_lobf_info"
> > +#define ALPM_DEBUG_FILE		"i915_edp_lobf_debug"
> >  #define ALPM_INFO_MAX_LEN	512
> >  #define ALPM_TIMEOUT_MS		100
> >
> > +/*
> > + * LOBF needs longer to settle than PR/aux-less ALPM: after Panel
> > +Replay is
> > + * disabled and the modeset happens, the link visibly bounces between
> > + * aux-wake-only and aux-less-only for a while before the LOBF bit
> > +actually
> > + * latches, unlike PR which comes up inside ALPM_TIMEOUT_MS. Observed
> > +taking
> > + * several seconds on a NovaLake eDP panel.
> > + */
> > +#define ALPM_LOBF_TIMEOUT_MS	5000
> Any idea why link settling time is ~5s
> Can you compare the timestamp of "Link off between frames (LOBF) enabled"
> with when the poll first sees LOBF, and retry with DC states disabled.
>=20
I will check this part.
> > +
> > +/*
> > + * Mirrors I915_PSR_DEBUG_DISABLE and
> > +I915_PSR_DEBUG_PANEL_REPLAY_DISABLE
> > + * from intel_display_types.h. intel_alpm_lobf_compute_config_late()
> > +kills
> > + * has_lobf whenever crtc_state->has_psr is true, and has_psr is set
> > +by
> > + * intel_psr_compute_config() (intel_psr.c) if *either* Panel Replay
> > +or
> > + * classic PSR/PSR2 succeeds - so LOBF needs both disabled, not just P=
R:
> > + * DISABLE alone (mode 0x1) only gates classic PSR/PSR2, leaving
> > + * panel_replay_global_enabled() untouched (PR keeps winning); PANEL_
> > + * REPLAY_DISABLE alone (0x40) only blocks PR, and PSR2 then takes
> > +over and
> > + * keeps has_psr true instead. Both bits have to be set together.
> > + */
> Explanation seems to be incorrect, please reverify once, Please use
> psr_disable() from lib/igt_psr (like kms_vrr lobf) and drop the local def=
ines,
> set_psr_pr_disable_debug() and psr_needs_restore. Same for the comment
> above test_alpm_lobf().
>=20
psr_disable() in igt_psr.c (psr_set(..., -1, ...)) only ever writes "0x1" -=
 the default: case assigns debug_val =3D 0x1 outright (not OR'd), and the w=
rite loop breaks immediately since 0x1 & 0x40 =3D=3D 0. So it disables clas=
sic PSR/PSR2 only. On a Panel-Replay-capable eDP panel, PR would keep has_p=
sr true and LOBF would never get a chance to engage - switching to psr_disa=
ble() would make alpm-lobf unreliable on exactly the panels this test targe=
ts. kms_vrr@lobf likely has the same latent gap, just not yet exercised on =
a PR-capable panel.

> > +#define PSR_DEBUG_FILE			"i915_edp_psr_debug"
> > +#define PSR_DEBUG_DISABLE		0x1
> > +#define PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
> > +
> >  /*
> >   * The kernel gates creation of the ALPM debugfs files on
> >   * intel_alpm_source_supported(): external DisplayPort needs display
> > ver 35, @@ -79,6 +109,7 @@ typedef struct {
> >  	igt_output_t *output;
> >  	igt_crtc_t *crtc;
> >  	struct igt_fb fb;
> > +	bool psr_needs_restore;
> >  } data_t;
> >
> >  static bool output_is_dp(igt_output_t *output); @@ -296,6 +327,26 @@
> > static bool alpm_read_status(int drm_fd, igt_output_t *output,
> >  	return true;
> >  }
> >
> > +/*
> > + * alpm_is_enabled() alone isn't enough here: aux-less-only ALPM (no
> > +LOBF)
> > + * shows up as "enabled" too, and the trace on a NovaLake eDP panel
> > +shows
> > + * the link bouncing through exactly that state - and through
> > +aux-wake-only
> > + * and briefly missing debugfs entirely during the transition -
> > +before LOBF
> > + * itself latches. Wait on the LOBF bit specifically, with the longer
> > +budget
> > + * that settling needs.
> > + */
> > +static bool alpm_lobf_active(int drm_fd, igt_output_t *output) {
> > +	struct alpm_status status;
> > +
> > +	return alpm_read_status(drm_fd, output, &status) && status.lobf; }
> > +
> > +static bool alpm_wait_lobf_enabled(int drm_fd, igt_output_t *output) {
> > +	return igt_wait(alpm_lobf_active(drm_fd, output),
> > +ALPM_LOBF_TIMEOUT_MS, 50); }
> > +
> >  /*
> >   * psr_get_mode(fd, output) reads "<connector>/i915_psr_status" under =
the
> >   * device debugfs dir. Some kernels only ever expose the legacy
> > single-eDP @@ -342,6 +393,43 @@ static void alpm_dump_status(int
> > drm_fd, igt_output_t *output)
> >  		 status.lobf ? "enabled" : "disabled");  }
> >
> > +/*
> > + * The debug knob holds intel_dp->alpm.lobf_disable_debug, consumed
> > +by
> > + * intel_alpm_lobf_compute_config() at atomic check time. Writing it
> > +therefore
> > + * has no effect until the next modeset.
> > + *
> > + * Since "drm/i915/alpm: Introduce has_alpm to decouple from
> > +pr/psr2/lobf" ties
> > + * has_alpm to has_lobf, this is also the only userspace control that
> > +can take
> > + * ALPM itself down on an otherwise idle DP link.
> > + */
> > +static bool alpm_set_disable_debug(int drm_fd, igt_output_t *output,
> > +				   bool disable)
> > +{
> > +	const char *val =3D disable ? "1" : "0";
> > +
> > +	return igt_debugfs_write_connector_file(drm_fd, output->name,
> > +						ALPM_DEBUG_FILE,
> > +						val, strlen(val)) =3D=3D 0;
> > +}
>=20
> This is only called with disable =3D=3D false from test_cleanup(), so the=
 knob is
> never really used. Also, cleanup writes 0 unconditionally and overwrites =
the
> user's value, and nothing clears it before alpm-lobf, so a stale 1 in
> i915_edp_lobf_debug makes the subtest skip with "LOBF not enabled after
> modeset".
>=20
> Please either drop it, or save the value at start, set 0 before the test =
and restore
> it in cleanup.
>=20
I will handle this properly.
> > +
> > +/*
> > + * i915_edp_psr_debug is global (one file for the whole display,
> > +applied to
> > + * every PSR-capable encoder), not per-connector - see the FIXME in
> > + * lib/igt_psr.c's psr_write(). "0x0" restores I915_PSR_DEBUG_DEFAULT.
> > + */
> > +static bool set_psr_pr_disable_debug(int debugfs_fd, bool disable) {
> > +	char val[8];
> > +	int ret;
> > +
> > +	snprintf(val, sizeof(val), "0x%x",
> > +		 disable ? (PSR_DEBUG_DISABLE |
> > PSR_DEBUG_PANEL_REPLAY_DISABLE) : 0);
> > +
> > +	ret =3D igt_sysfs_write(debugfs_fd, PSR_DEBUG_FILE, val, strlen(val))=
;
> > +
> > +	return ret =3D=3D (int)strlen(val);
> > +}
> Following on from the above, please use psr_disable(). Besides being the
> existing helper, it registers restore_psr_debugfs() as an IGT exit handle=
r, so the
> debug value is put back even if the test is killed or aborts. test_cleanu=
p() only
> runs if the process gets that far, so a crash here leaves PSR/PR disabled=
 for every
> test that runs on the machine afterwards.
>=20
As I explained above, we need to disable both PSR and PR. So, I will regist=
er a sperate exit handler for this.
>=20
> > +
> >  /*
> >   * Light the output up. ALPM on an idle link is reached via LOBF, whic=
h
> >   * requires a fixed refresh rate (intel_vrr_is_fixed_rr()), so the
> > mode is @@ -
> > 374,7 +462,27 @@ static void test_cleanup(data_t *data)
> >  	igt_output_t *output =3D data->output;
> >  	igt_plane_t *primary;
> >
> > -	/* Clear any output mode override left behind by the mode under
> > test. */
> > +	/*
> > +	 * Clear the debug override unconditionally. A subtest that fails
> > +	 * midway would otherwise leave it set, suppressing ALPM for
> > +	 * everything that runs afterwards on this machine.
> > +	 */
> > +	if (alpm_has_debugfs(data->drm_fd, output))
> > +		alpm_set_disable_debug(data->drm_fd, output, false);
> > +
> > +	/*
> > +	 * test_alpm_lobf() sets PSR_DEBUG_DISABLE |
> > PSR_DEBUG_PANEL_REPLAY_
> > +	 * DISABLE in the global i915_edp_psr_debug file. That write outlives
> > +	 * this dynamic subtest (all of them share one process), so every
> > +	 * later output/subtest would run with PSR/PR forced off unless it is
> > +	 * put back here.
> > +	 */
> > +	if (data->psr_needs_restore) {
> > +		set_psr_pr_disable_debug(data->debugfs_fd, false);
> > +		data->psr_needs_restore =3D false;
> > +	}
> > +
> > +	/* Clear any output mode override, matching the debug-state resets
> > +above. */
> >  	igt_output_override_mode(output, NULL);
> >
> >  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> > @@ -471,6 +579,55 @@ static void test_alpm_panel_replay(data_t *data)
> >  		 output->name, alpm_mode_str(output, &status));  }
> >
> > +/*
> > + * LOBF is eDP only (DP2.1 ALPM only ever runs through Panel Replay,
> > +see
> > + * test_alpm_panel_replay()). intel_alpm_lobf_compute_config_late()
> > +(kernel
> > + * intel_alpm.c) unconditionally clears has_lobf whenever
> > +crtc_state->has_psr
> > + * is true, and intel_psr_compute_config() (intel_psr.c) sets has_psr
> > +from
> > + * *either* Panel Replay or classic PSR/PSR2 succeeding - so both
> > +have to be
> > + * disabled together, not just PR: PSR_DEBUG_DISABLE alone leaves
> > +Panel
> > + * Replay's own enable check untouched (PR keeps winning), and
> > +PSR_DEBUG_
> > + * PANEL_REPLAY_DISABLE alone just lets PSR2 take over and keep
> > +has_psr true
> > + * instead. psr_disable()'s plain I915_PSR_DEBUG_DISABLE write is
> > +therefore
> > + * the wrong knob here.
> > + */
> > +static void test_alpm_lobf(data_t *data) {
> > +	igt_output_t *output =3D data->output;
> > +	struct alpm_status status;
> > +
> > +	igt_require_f(!output_is_dp(output), "%s: LOBF is eDP only\n",
> > +output->name);
> > +
> > +	require_no_audio(data, output);
> > +
> > +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> > output) ||
> > +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2,
> > output) ||
> > +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> > output)) {
>=20
> Besides disabling PSR, please require the LOBF sink preconditions
> here: the ALPM cap (0x02e bit0 or bit2) and AS SDP (rev >=3D 0x13 and
> 0x2214 bit0)
>=20
Sure.
> > +		igt_require_f(set_psr_pr_disable_debug(data->debugfs_fd,
> > true),
> > +			      "%s: failed to write %s\n", output->name,
> > PSR_DEBUG_FILE);
> > +		data->psr_needs_restore =3D true;
> > +	}
> > +
> > +	test_setup(data);
> > +
> > +	alpm_dump_status(data->drm_fd, output);
> > +
> > +	igt_require_f(alpm_wait_lobf_enabled(data->drm_fd, output),
> > +		      "%s: LOBF not enabled after modeset\n", output->name);
>=20
> Kernel that stops enabling LOBF makes this SKIP.
> Once the preconditions are required, this should be an igt_assert.
> The one legitimate skip is the timing condition the kernel checks in
> intel_alpm_lobf_compute_config_late() (window1, and guardband vs. wake
> lines), which userspace can't see.
> For that, kms_vrr retries on a lower refresh rate mode before giving up; =
I'd do
> the same here and only skip if no mode works.
>=20
retry across the other refresh-rate modes at the same resolution before giv=
ing up, instead of skipping outright. Since the check is deterministic per =
mode, I only need to find one mode where the timing budget works; I don't n=
eed to re-verify it once found. I'll change the SKIP to only fire if no mod=
e at that resolution satisfies the window1/guardband check, and keep the do=
wnstream correctness checks (status.lobf, Panel-Replay-off) as hard asserts=
 once a working mode is found.
>=20
> Thanks and Regards
> Kunal Joshi
>=20
> > +
> > +	igt_require(alpm_read_status(data->drm_fd, output, &status));
> > +
> > +	igt_assert_f(status.lobf,
> > +		     "%s: ALPM enabled but not via LOBF\n", output->name);
> > +
> > +	igt_assert_f(!psr_panel_replay_enabled(data->debugfs_fd, output),
> > +		     "%s: Panel Replay must not be active while LOBF is
> > enabled\n",
> > +		     output->name);
> > +
> > +	igt_info("%s: LOBF active, ALPM mode %s\n",
> > +		 output->name, alpm_mode_str(output, &status)); }
> > +
> >  static void run_test(data_t *data, void (*test)(data_t *))  {
> >  	igt_output_t *output;
> > @@ -481,6 +638,18 @@ static void run_test(data_t *data, void
> > (*test)(data_t
> > *))
> >  		if (!output_is_alpm_capable_type(output))
> >  			continue;
> >
> > +		/*
> > +		 * LOBF never latches on DP: has_lobf is unconditionally
> > +		 * cleared whenever has_psr is set, and DP always sets
> > has_psr
> > +		 * via Panel Replay (see test_alpm_lobf()). Skip enumeration
> > +		 * entirely instead of creating a dynamic subtest that always
> > +		 * SKIPs.
> > +		 */
> > +		if (test =3D=3D test_alpm_lobf && output_is_dp(output)) {
> > +			igt_info("%s: skipping, LOBF is eDP only\n", output-
> > >name);
> > +			continue;
> > +		}
> > +
> >  		for_each_crtc(&data->display, crtc) {
> >  			igt_display_reset(&data->display);
> >  			igt_output_set_crtc(output, crtc); @@ -526,6 +695,12
> @@ int
> > igt_main()
> >  	igt_subtest_with_dynamic("alpm-panel-replay")
> >  		run_test(&data, test_alpm_panel_replay);
> >
> > +	igt_describe("Verify LOBF can be enabled on an eDP output once
> > PSR/PSR2/"
> > +		     "Panel Replay are disabled, with Panel Replay staying off "
> > +		     "while LOBF is active.");
> > +	igt_subtest_with_dynamic("alpm-lobf")
> > +		run_test(&data, test_alpm_lobf);
> > +
> >  	igt_fixture() {
> >  		close(data.debugfs_fd);
> >  		igt_display_fini(&data.display);
> > --
> > 2.43.0

