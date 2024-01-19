Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279D3C47DAF
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 14:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50B810EA2E;
	Fri, 19 Jan 2024 14:12:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924E810EA2E
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705673561; x=1737209561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PchkgpSuwcBIasGKiF4dXVdXp3ADPaTbRDMMTyaAVE8=;
 b=WT1bpH3O1XQGFscKsLOOrFV6G+rTpkUqWHBkkHeS5s4Icoup6LJtztHq
 3NMWK1Ub04pRcAprHM2lH7ieAGS0uEDL2mk7SygG0eDXl26ZRUcSOlLV4
 g9p9A9AulvrvSlKUGb8bnxSqS0wGvmQkXcO/IOE/DosCLaEh+sP1UJyE0
 IG86wFY2foymdLUfdVZsIxyWeLHmIF7Cl+uPmsyp9F5FjLU4Nw1co7bbm
 +7xYXyyfXnkFaM8ghBTFwPSx5Lx4RLEW7nIfKBhcwHXeeVpzMMvnzLjGS
 RtnYh58Mmd3zMH/TjhKXKZ/8Ii8Qn88/ASWZvMgINNfVRbCVrMT737h9i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404522582"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="404522582"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="681691"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 06:12:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 06:12:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 06:12:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 06:12:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irbI03NmYCx/clVehebF/gmN3ZgjUrqqUJEeOTXUMzJCPqjYG6cteLx8EWZL9LIiGotAC/4iv90IMDB9J+Qj87Av23l5p/Kxw1rWy4DJ5rDVcihDL0ptDwMzfzMl0H1tA1kq1b8I0s+fhlN1HXEqSemY63K40PcIm0GL3BMqEKoD9GlBoA1wAxB6Ky2E8G4zl/JIMRogfv+qn44JcP5OtZdvtlhiH8IkdHq1NdVXlyWDKJrQ3vocAeCLywVcChzMAT6askXe9x7J9Q6uQzyqxHk59552gAoSJsV5AZOszYZB9omIk8aP/G1pyz4ZwBy14htoC1WWi042gYVS+7wwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8htKbxutieX7vJqk+w4DjpsNqUtGY9TDKkEaa7UKBIE=;
 b=YPVUi6gZPhrxA0B07lWA+omOnGZfhT7oAqY+TC5BRyCjBplbE6VzjJ9KoAtHzRgTsTijFBCJA8bBYjWqueUspGKSQLp88JQ1gu/A3yP08fXmi/31yGbHR1XDWTKc26gSMJdcn20zD0R6Q+4sLqKh5KQ7aGRo4lZdE84IEirsSdkiAFIGxR+tp3/iz5PUaWWg4g/Xqh3xtOOCr2tGmm1QFcvAtitlQNAqsq167f0tJGi/cxzs3cAPIiPAXlsCY6AqM2QQwc+3kC0ZFYcgFFr0GFLjJtcLN42m/W66Ihya2I9zXOv3inwsbA7jR593YOW7I3R4VlbWAbvlBNb9Fc4Krw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CYXPR11MB8712.namprd11.prod.outlook.com (2603:10b6:930:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 19 Jan
 2024 14:12:37 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 14:12:35 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH i-g-t v4 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Thread-Topic: [PATCH i-g-t v4 2/4] lib/igt_pm: Add helper to get/set
 auto_suspenddelay_ms
Thread-Index: AQHaNCuc+pbaG9frz0uN5stHwZFNTrC95LOAgCN1yoA=
Date: Fri, 19 Jan 2024 14:12:35 +0000
Message-ID: <CY5PR11MB621114B6F0AA5A5B872887DF95702@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231221163338.2157257-1-anshuman.gupta@intel.com>
 <20231221163338.2157257-3-anshuman.gupta@intel.com>
 <ZYzEGVSh0WbrGyeH@intel.com>
In-Reply-To: <ZYzEGVSh0WbrGyeH@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CYXPR11MB8712:EE_
x-ms-office365-filtering-correlation-id: 5fb19d7b-95ed-4f45-79a7-08dc18f8afa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iRAANoXpOrUvjl/R5Q4qI02jdZwthcPdFzLke35hh8vzv0N0MKK1uonCduKrdPV1L/wbeE2LzTIQ7RVO7brvtNB4VIFNSR3utKYey1w1mEP4wdvhS4fzUoksJastZj1HKRNBBDzH/AZPR4SpCUivaCPdLSQCOjUJx+fwO4sF9CttxM8uUI/N5RkTsXLt7aSVElS4fkHyqY1BNj/iYD1364hGB0dJ6AZuWv00PGneA3+M4Ha17ctJhteXeqZcIlkFqYUmLpZxsLwiSBDE8MMxBGh/gwp4KzKE7X0rP2w1E4qhFvTtM4n3mMcNiE7iJRffVRmi6zuKm/rkWU5S6h6p6hdo8q8Uc7/gebO/hVg6wFa75IUwS28Rwpt2KzZSSXO3/d7ihiWa76ThkXC3Yoskb9lNbX484kvzBd0ouOuP9BcdUX7j4fclG/+nqFf2F7y28wtgR6TOuQFum6t4m/Giz+BMmIDsh2piSjZ8aHTM9vJ3wsbqJMpmV0jYaJXWe657Jp0b0l+uM97kh2iJO2m+kFcCLh0LUAOX08s3aOPS46vBN48FIsMDQkzuEQZZ741Ym8eescfcnteNvW0GDT3gMZzbZUPITHnoaxlsLEQmc959rqZtJFep+ZyEVfkw5j2j
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(64756008)(66476007)(76116006)(66556008)(6636002)(8676002)(316002)(8936002)(54906003)(9686003)(33656002)(66946007)(66446008)(4326008)(6862004)(38100700002)(52536014)(38070700009)(55016003)(82960400001)(2906002)(5660300002)(41300700001)(83380400001)(86362001)(122000001)(478600001)(71200400001)(7696005)(107886003)(26005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E3Ir/Q0TMYhmldXxS4MP8Szfg/Zicw28W41FWwX6wJqiw2gUcTQAXffCpDfl?=
 =?us-ascii?Q?AvwMn9T2BSdsiJXBgOvHdr0v9w4wJyaDpp7vfj+TZ2lmqIcv8CzJ2Fk5/9AY?=
 =?us-ascii?Q?wqUEoxl7v1EF6DMUlgcnPBdzvg3wThZyx+J1/cFvhl2dQsE6+CfDVi/31A/Q?=
 =?us-ascii?Q?FZ2XcYtlTxAx9j3CFXiLwmiFxurKCKXAp6MQADts8FKqubi22YT5t+Qhw5x+?=
 =?us-ascii?Q?MsT0a9tE5+xKLma+fDJdrv7ZS5n/wckpksxW9obRUhLgrVrMTiS91RvozibG?=
 =?us-ascii?Q?aQmPjN/o69gdqZxWo98Slo9qx0XyY+5wCEkyWQtJPvaX2yiMwwV/PHmObd5q?=
 =?us-ascii?Q?xT6MPlArVK9XneQN7Y+K8ghAL2KimUlA/hm5RGyf3bL5+upS/IZiwbjgDg60?=
 =?us-ascii?Q?MAe8FJs7EL9akWTV3OO8Z92g8UqVU4gVe2SpxT8/MwoP04lJaol5KIUd5fiJ?=
 =?us-ascii?Q?IZ3SkOsDgtKnKBqmYArwa52lVLWM59sKWqBFQYVSKMEENjqp1BOpE5RuOkQP?=
 =?us-ascii?Q?A0rPcdANvrwy11JXpieBgeJ7H6ciLu8W2uoekVg1e+D0WEfeWz5TsJs10ebZ?=
 =?us-ascii?Q?w3o2qgIow6NbG4DePJEil+4z+rEaZhwH9nqGNMpEAO9sglwe6WUAdMtJb+2Q?=
 =?us-ascii?Q?g/Gf3GvxqjjcVr7jAmVBK2PYSRdnXaSptZhmL42nCGlPLwH9WASEgbJbfee0?=
 =?us-ascii?Q?6nlqUZEOcUsHZRTEFp3qf8iUXxnYtXHuh9EQy0d6mxQM7Ocp2E92ruyFNP14?=
 =?us-ascii?Q?fOsjLQemKoXpFmEu8cE4awBWfH6jOttgxC0E1oD2aHd4qCQR61Z/usbFGgEY?=
 =?us-ascii?Q?TEHEVTEWDtSf4BAR5fklv6YVFyuoiG1x2YMjrE9EmZk/5Yt1ETNMpWbMEj6J?=
 =?us-ascii?Q?gvIwsDznHuPXCq87yBgis4zrf6yke6A8rzMuKH0BGkCIDAbS4BhljAM6n2in?=
 =?us-ascii?Q?xVSS59UzNWANzoglPm0s8we1QNlCj/FixT6oxNHWkgjhER5wQetsdxKgLn99?=
 =?us-ascii?Q?baJJ/slmcqPfkroHitThILvwxlpErxqBqDd4V4a+0BRD/nibQsTQmgLQlMyP?=
 =?us-ascii?Q?vYsiybiN1LhOCF9fFCeb6P0DvGcr2+Ydnjw8TaYCPb2XmAUO/xyuyJxqIb4O?=
 =?us-ascii?Q?mfMaq8KT/P4ZNXiaHkOgFmO3uX3zIsfKA+bKMHrAUL2N8IxEWknecz6VmiGW?=
 =?us-ascii?Q?OLN6QFHDhImNQKl5EbvYti82LdPMzDjXxWFDKHjudd2NSCtF+NeQ4ND/oPk/?=
 =?us-ascii?Q?YwOVbcBZKjx4isFJKgN6NZBWxPVNT1nfDaMFrEJRipqntrUnpbXgH3sZwKcz?=
 =?us-ascii?Q?XaRoHBdFyrcPKVSSSoXO0f7W7ARdfOXTXf082fYceqsTFJPdx/P4f+qGwmrg?=
 =?us-ascii?Q?3cEfPbemBcnk1XQDYmdjIGbok1dsHK/MaVOJdC+TiYexW4aAQHm1AAXn+lO0?=
 =?us-ascii?Q?QZylxZTpGEg7XVahCfAoQhRBImiZu24Kjihp3rplWFnNVc6z/OxM2p7CioyG?=
 =?us-ascii?Q?0rSvtu4y2FKjJRcMK9FGsi4WLS4TxhNHySMJhOvygseun3hXWqTcBqQJesfS?=
 =?us-ascii?Q?RbJrMSATMCVaVIwaXh8ryU9NsPN0rhssmGjN48lK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb19d7b-95ed-4f45-79a7-08dc18f8afa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 14:12:35.6845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PtUvjVt3nj2c+Zdu99AEU85irzB0+miV60cKI3hczoVZeHOiCgCbGtFdzyccaCXDV3YZ3oikjMCfzWY04NbWw9UHIW6IM54MPeS2H5/Tl1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8712
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, December 28, 2023 6:11 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Tauro, Riana <riana.tauro@intel.com>;
> Nilawar, Badal <badal.nilawar@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>
> Subject: Re: [PATCH i-g-t v4 2/4] lib/igt_pm: Add helper to get/set
> auto_suspenddelay_ms
>=20
> On Thu, Dec 21, 2023 at 10:03:36PM +0530, Anshuman Gupta wrote:
> > Sometimes we want to test pm igt test with an explicit auto suspend
> > delay, therefore adding helpers to get/set the pci_dev
> > auto_suspenddelay_ms.
> >
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> we also need to change the default value from 0 to 1 at least, and then s=
ee
> how much more time machine we use. But 0 is unrealistic.
Thanks Rodrigo for RB.
You mean 1ms or 1 second ?
Thanks,
Anshuman Gupta.
>=20
> > ---
> >  lib/igt_pm.c | 53
> > ++++++++++++++++++++++++++++++++++++++++------------
> >  lib/igt_pm.h |  2 ++
> >  2 files changed, 43 insertions(+), 12 deletions(-)
> >
> > diff --git a/lib/igt_pm.c b/lib/igt_pm.c index c2d98fceb..d436c2c50
> > 100644
> > --- a/lib/igt_pm.c
> > +++ b/lib/igt_pm.c
> > @@ -1068,18 +1068,6 @@ static void igt_pm_write_power_attr(int fd,
> const char *val, int len)
> >  	igt_assert(strncmp(buf, val, len) =3D=3D 0);  }
> >
> > -static int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
> > -{
> > -	char delay_str[64];
> > -	int delay, delay_fd;
> > -
> > -	delay_fd =3D igt_pm_get_power_attr_fd(pci_dev,
> "autosuspend_delay_ms");
> > -	if (igt_pm_read_power_attr(delay_fd, delay_str, 64, true))
> > -		igt_assert(sscanf(delay_str, "%d", &delay) > 0);
> > -
> > -	return delay;
> > -}
> > -
> >  static void
> >  igt_pm_setup_pci_dev_power_attrs(struct pci_device *pci_dev,
> >  				 struct igt_pm_pci_dev_pwrattr *pwrattr, int
> delay_ms) @@ -1165,6
> > +1153,47 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device
> *pci_dev, bool save_attrs, i
> >  	pci_iterator_destroy(iter);
> >  }
> >
> > +/**
> > + * igt_pm_get_autosuspend_delay:
> > + * @pci_dev: pci_dev.
> > + * Get pci_dev autosuspend delay value from pci sysfs
> "autosuspend_delay_ms".
> > + *
> > + * Returns:
> > + * autosuspend_delay_ms.
> > + */
> > +int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev) {
> > +	char delay_str[64];
> > +	int delay, delay_fd;
> > +
> > +	delay_fd =3D igt_pm_get_power_attr_fd(pci_dev,
> "autosuspend_delay_ms");
> > +	if (igt_pm_read_power_attr(delay_fd, delay_str, 64, true))
> > +		igt_assert(sscanf(delay_str, "%d", &delay) > 0);
> > +
> > +	return delay;
> > +}
> > +
> > +/**
> > + * igt_pm_set_autosuspend_delay:
> > + * @pci_dev: pci_dev.
> > + * @delay_ms: autosuspend delay in ms.
> > + * Set pci_dev autosuspend delay value through pci sysfs
> "autosuspend_delay_ms".
> > + */
> > +void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int
> > +delay_ms) {
> > +	char delay_str[64];
> > +	int delay_fd;
> > +
> > +	delay_fd =3D igt_pm_get_power_attr_fd(pci_dev,
> > +"autosuspend_delay_ms");
> > +
> > +	if (delay_ms >=3D 0) {
> > +		int wc;
> > +
> > +		wc =3D snprintf(delay_str, 64, "%d\n", delay_ms);
> > +		igt_pm_write_power_attr(delay_fd, delay_str, wc);
> > +	}
> > +}
> > +
> >  /**
> >   * igt_pm_enable_pci_card_runtime_pm:
> >   * @root: root port pci_dev.
> > diff --git a/lib/igt_pm.h b/lib/igt_pm.h index 306a9eb46..8394315c6
> > 100644
> > --- a/lib/igt_pm.h
> > +++ b/lib/igt_pm.h
> > @@ -77,6 +77,8 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device
> > *pci_dev);  bool igt_pm_acpi_d3cold_supported(struct pci_device
> > *pci_dev);  enum igt_acpi_d_state  igt_pm_get_acpi_real_d_state(struct
> > pci_device *pci_dev);
> > +int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev); void
> > +igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int
> > +delay_ms);
> >  void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
> >  				       struct pci_device *i915);
> >  void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t
> > *value);
> > --
> > 2.25.1
> >
