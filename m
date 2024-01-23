Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F59C47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 15:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B80410E7E6;
	Tue, 23 Jan 2024 15:11:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F9610E822
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706022673; x=1737558673;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J9Ucz3g6Ji+QOi5ai1b9oWEzFGHzteZmMCJn95C5Zls=;
 b=Il5viE5P4k+p05SNwog76DWimrk5Jlgf0Tej5GFmgEmDBin5W7YeNPcE
 YDxJCa8yhzDy65x9kV96alyRv5SQ4zDzZN8+2CEWtbcemqvHdXHvNDyOx
 jcpTTTxyVKlt2PJhKjCuPkNvj/lzHQWnlZykm/NF4ARg6j/gyvfPF/exy
 61x7Q7i1CQgQQV4HrmYSKR5X9IcfjzgoUN9UKq0udJqdpGGOiS2i7Jg0a
 paW61eJCAg/a30++O3Y0jKcn1rEqSa91FGbRIymZ8F3on/fk6rUOnzOdU
 u0M7mbc129UIE+J5RCdDeQnqelE5hSmQOPzw9le3ATuryNx8/L91Z5PC6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="443295"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="443295"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 07:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876379754"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="876379754"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 07:11:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 07:11:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 07:11:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 07:11:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awpHGQiyy/1Lv4D2AqPLTdaoXMgizCIzpooc+c9vk6NU2pZp2B0bqjItfB/3C8pRYA3sC4O3bww4bzaCCZsavWUa/A4aAung5FMUMbdXA7wAbxIIN9NO9o0ufkYbSu5wgP52K/cCZ2XLn2awvu6lddSXtEZiyTQX2FYy8IuNplq3XhMCbA757Dy5YOGnhd1vdEnbWIm5al24X/LVzigusYyEIFOUJTdqSyl00hp7NiEXIaLjfyIIkP8S/W6d15KkmDT0K1wvty3+lKPCPTcD8B3Jqd1yDW7WlZS/kN5P7D7sgPuELLcYR0E34dSiDWb/w7Y9seNAfRgjcYXOil+r1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncZeO4aDFd3dmP1SSUWoYR3uGyEpATV9S58PfKNg/74=;
 b=Xlx8luMO/UZUwtNr6qkKadlrLAkZwGpeCOj8mmL+ZmDwzPO5odn3IQSsHRavcQSP77nxX2Ma73/HFa2Wk1M4vL6DLtSjmxU2F98WAfOajmWS5c4PvT2bnSXWB+Ug79A6Dl77jh7sqW6VVAs3uv+bL7LgfR9eD+0azGWlQ379lJcP6WdVijSH8zHnflRZ17qvSSPl6QeirSzhCpFfE7GzDu4lWQV/FEn+5PIX2h0C1GlhRUIXld37nReBfjYiQyUEWd6MP2oFwpWp3YyUn2obi3Hs4fNVIEE5vOZ7weDWWH3KecaKay5e4GLwrqa6d+lbuzrLEUZEqtI+UZxogZ7ioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 15:11:05 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::530a:5735:154:362]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::530a:5735:154:362%5]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 15:11:05 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode only
 after checking enable_psr modparam
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode
 only after checking enable_psr modparam
Thread-Index: AQHaTgXI1q1Wn+7l4kiUdGkb/wEI7LDneUaAgAAG5hA=
Date: Tue, 23 Jan 2024 15:11:05 +0000
Message-ID: <PH7PR11MB82527457E45F0298D7A39EDA89742@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20240123141835.1211107-1-kunal1.joshi@intel.com>
 <20240123141835.1211107-3-kunal1.joshi@intel.com>
 <DM4PR11MB6312CF0BD267C21012890BC290742@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312CF0BD267C21012890BC290742@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|LV3PR11MB8578:EE_
x-ms-office365-filtering-correlation-id: e8306431-e551-4613-f392-08dc1c258518
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MF49mylP0IOsDwK4ytdGXyu8Vy2FPAtsGFa8byo4TrgJaE+pPI0Jrr+7YkDrq8LTNzMEcEoV9+7kt1yhgAI76JWvNgJJYlgKfKuxagJ3mZShJL1hU1lju9rm8+dXh+XSxhrESkOXGjvrcSBhVewW3+kZ4agVnjg9MpNO1pUtZrS2bAohguoAmg+fQcEl2yl5C64uaFvxTE5tquZy1T1bmsk0l1ZT5y+oRWzhJElHHK4YnQmaPBr+h51vD45Jw1VH4w8ZLSEQ27jf+hi5hO5uiSzXXGrIAHMEm1Ww1HH3tAGuxko9+TLkvmccx6t57wx7Rl6QbFPtC8Rwhffva4gYSypTAffegLnK9VenIWJ+A811U7voBjLJoXgsq0aGVtRWjNepAuDhlx+zvpfMx/H7lasN4fbdLwHIIgvtrWkWaKvICT1z0ildes5R9jymE+aHYltsgqMWGaqhCiGnSzFcR3O32/svyucWF2icH1AhZzYEMNvuZPHt2Gsg7YX/fu1092wP3gv9ODaKGDmYnJuTtrufiN4Y4vqUb1FIWPtbMgcrcNeb6isjJkIP44m+IvV9ZUhu029l9BOGMyG/j210nKMheZMy/+OjftXf7piAjBXsWfUKU7rLWjePOD33SEK8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(9686003)(107886003)(26005)(41300700001)(38100700002)(122000001)(52536014)(8676002)(8936002)(5660300002)(4326008)(2906002)(478600001)(66946007)(66446008)(6506007)(7696005)(66476007)(53546011)(71200400001)(66556008)(64756008)(76116006)(110136005)(316002)(38070700009)(82960400001)(33656002)(86362001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nLUImniPKcmUS89E8dFk0g7BRP7VclfUnl0Ob+wDueM9pfRxagJrQBrmXKTj?=
 =?us-ascii?Q?BFwhR4aIgk1NhDhkJ8c8DIeEWEZyuWhwjbwnrDfSWG2dW1dhUCMIvLwLYbvC?=
 =?us-ascii?Q?H4AjqLOt4/xSIIC1gMFdxKVaoY5BdRY35wTffEVaGVFrUcaXKc1bCmghMGRH?=
 =?us-ascii?Q?ayrpHz9BlAxkft9RaH+pQ0t/PwSoZVzET9e2/2dKd7iMdS7NznRsiTMHoVKX?=
 =?us-ascii?Q?BYQraQ3Bd249ReQFzxZARGInRN2sqnkj8y6msF4V4h6T+7kg3G1IkjAlEcOf?=
 =?us-ascii?Q?yMgq3eXw8PlnWNekXHDbpQRNNxapPCZ8HlwyieJo3xzkYda1RAkEgLIPNz1z?=
 =?us-ascii?Q?7Iv6t6VSiHEdmtkBIzAtfcr5p78qBUC8su4hfr4wUiltdUKLZwj9kRpl9lWy?=
 =?us-ascii?Q?iom9c57GYhMRpuQ1IF4wnfwF/h+ttfc/O/LCym/ugBSX9/ybjL4Tbs0rDQcE?=
 =?us-ascii?Q?yhgwWmN1xQ7LtECAHxYoh3jqPKcLnzYNNbfpI9K/ai4dnmiFJBspbGunzaAJ?=
 =?us-ascii?Q?cw/lMnIO2oSLtY9Lrun5vtPN21Z610jSzDonjf8U7U+wLStjowokgziTqj9m?=
 =?us-ascii?Q?gppe7XimvaUYO57duKR4lQ7kqiTPZkWygHX06W59cjCnjko/Cr4nEWbc7kw6?=
 =?us-ascii?Q?Qp61KEGXYPZJZsIHKSOSVnpUwcCkgpzWi0ef2il5hFiRCUkDy9WWk+RpKewe?=
 =?us-ascii?Q?FO8Fsa2mec2SREwi6d5l6SemvTpSYa4/Q/Sp9vw3hJfItU0ODifvdw9YYA6G?=
 =?us-ascii?Q?DBa4eUuCD+xxGMMvSLTzptElwCfhnkwM3uRGaqdTM2vsuAkK7KDOxo1DceEG?=
 =?us-ascii?Q?yUlMYaFWun9o3wTVAlzex2lxMCnN9wG7GZcry+od3JA4TN/pxjYHNnjyAEkQ?=
 =?us-ascii?Q?QMYkdb9jsxw/5C2voBhpudViBV0uj5loQky1jSH5qgJjRERo3qL7xEDyUI2A?=
 =?us-ascii?Q?nXlS9lbtWG9dRV3r1T+Szu/acb4ScIxpoVL/dKB6QXSygsaW31iDikIXZ592?=
 =?us-ascii?Q?IG6rHBIR5JHLu9NKKGK5OZ69rcDMydEVuT//LFZMEEhnSghtQYFywsmbKY3m?=
 =?us-ascii?Q?wmBjkrNO9MR0v9QxGqcyXCS2fUFzftgYyR1mXhPXl86LsHl5OlgeE/+4f9NN?=
 =?us-ascii?Q?rd7W40grVx8Zp75e3EoER8eMuyAbyWTI2kBo3jKsJ7JmaMR+iIFcVo6kLf5O?=
 =?us-ascii?Q?rRc2PT9zA4s9QsJ6Az/nOD4YenaIy5ckALal2TOKPpYwVUt2BpjcYftYMVWy?=
 =?us-ascii?Q?mDHQ7XYQ83zUbrfc120jxdpvlf7Bv+ejeOydh3w/ugv7Lvwt5MuXD2wGCa/z?=
 =?us-ascii?Q?pyKFm7ApnROQnAxHYGxgWOd98NNcMzL0lHnmEH8U6WxfP9h8tHLtiVCKF9M8?=
 =?us-ascii?Q?uvlg6VyBUqjvwDl9V53TRLMCY61VqtIznLAsaSTeNAKmUMMsqa6fJ1lHOrau?=
 =?us-ascii?Q?udl0VXIosg5sElbupReZxbchX9LvvRaRXUTdMru3RWoDBlUv9givNnPAxHhV?=
 =?us-ascii?Q?kqmWTFesD6dIKuT8RcjcVOAX5uNwJexH4TfXGJdYaEK8FZDCrfIIX4NTuIeP?=
 =?us-ascii?Q?K4ER02IXFvWmWPJwkV4cm9kg/4c+4kfOvZu3HEIB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8306431-e551-4613-f392-08dc1c258518
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 15:11:05.1809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IrZzcacrARgeEFB/m6dlO8k5ULt2KYgoLvLCFBvDZpOwQIwGNb6qkonGiXoqAF7xWf6RHjDhr1gBrQj91+fIYMzb6acCfpFHGQHIv3jUB+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of B,
> Jeevan
> Sent: Tuesday, January 23, 2024 8:14 PM
> To: Joshi, Kunal1 <kunal1.joshi@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode=
 only
> after checking enable_psr modparam
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Kunal Joshi
> > Sent: Tuesday, January 23, 2024 7:49 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> > Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode
> > only after checking enable_psr modparam
> >
> > don't enable a psr mode with psr_debug debugfs, instead check what's
> > the modparam value for i915_enable_psr
> >
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> LGTM
>=20
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/intel/kms_psr.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c index
> > 349671b00..521d4c708 100644
> > --- a/tests/intel/kms_psr.c
> > +++ b/tests/intel/kms_psr.c
> > @@ -497,16 +497,28 @@ static void fill_render(data_t *data, const
> > struct igt_fb *fb,
> >
> >  static bool psr_wait_entry_if_enabled(data_t *data)  {
> > +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> > +		igt_skip("enable_psr modparam doesn't allow psr mode
> %d\n",
> > +			 data->op_psr_mode);
> > +
> >  	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data-
> > >output);  }
> >
> >  static bool psr_wait_update_if_enabled(data_t *data)  {
> > +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> > +		igt_skip("enable_psr modparam doesn't allow psr mode
> %d\n",
> > +			 data->op_psr_mode);
> > +
> >  	return psr_wait_update(data->debugfs_fd, data->op_psr_mode, data-
> > >output);  }
> >
> >  static bool psr_enable_if_enabled(data_t *data)  {
> > +	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
> > +		igt_skip("enable_psr modparam doesn't allow psr mode
> %d\n",
> > +			 data->op_psr_mode);
> > +
> >  	return psr_enable(data->drm_fd, data->debugfs_fd, data-
> > >op_psr_mode);  }
> >
> > --
> > 2.25.1

