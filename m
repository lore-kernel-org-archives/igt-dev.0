Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A89BCD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 06:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D84112DFD;
	Mon,  1 Jun 2026 06:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWW5cMT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63F2112DFD
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 06:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780294121; x=1811830121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vL/z/dgsIKcr5msBE5UNUkhthrWpXB0z7ifUZWXoVWM=;
 b=LWW5cMT6oz/RN1xmzmdLrwtcLl7PB5K0McV5tKyV/nHuVN/MdaQyelmb
 8P7R/M9kcW0SM50Y+FsjrVjNjUicNImglrR5G62humQqDbP1U4QTCgzWU
 L07/PAr4a4dBqkLb3RhoBz6k0ATaDgF968/aWQu6pGEn0OCxWJtV723nV
 9oJ0oTYHSP8WvHxX1BkCZb+TDMhFBD7wxJWv5OfLPzZEKBdb0F2Dcngun
 vw/sHYz/B8oi2FHijWC6eTARSiz+YcjJjS3pvL4i4a014Y+HnDFZ/EZWn
 REl7rJahqLmzyaF16lFPUG4CNJ6xenrpHQdsPtG8dohj+QHXlh1aBjYsN w==;
X-CSE-ConnectionGUID: KX/f3+euSXe65HAJlWM8Ng==
X-CSE-MsgGUID: AN946a6pSmCdn2lirTM13Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="106492811"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="106492811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 23:08:40 -0700
X-CSE-ConnectionGUID: YwtoHEkyREa3ZSidq/isGg==
X-CSE-MsgGUID: WDa1GMVzRF+arsit7M3zzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="247744384"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 23:08:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 23:08:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 23:08:39 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 23:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VytomXwxVBN8JwNafHSSXQmz1F/GBW5g+eRNVKYTQYu9P/GNRebDPx+90cyYSgbLSVtRXfIJp3slTTttuxO1nfvQ/1na6IqDlhXoDb3oGsrX/SVdPKECnglBFM3jIwi6n6NpREiMoaufzHrR8Ar04eJykNrG76Huf0Eibco0INRI8ZP9Wrel5vHJbWOS0eEktV1vfHAzsE0ZZMyn101kj4yHQgQrrESYS1alfUNsT0KL+etInuWGXaDQVNOo6zq0FG+xhM09Qkv8HVe0+I8PLOdF6cs36Lh9mey3Vpp8uItUscrjyxZwHKwlf6f2WWhE/ezJgAAaPxJd/lO/6t1gFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSDx3XWf0+enUkh4brJP5ZaAvqUCCR8f5hKoANdITMY=;
 b=rtmFsUuKtFbaWJeNxDav5ZRTAfiH7hr0aPeQ4AYBFOU68/xwVVbfnn1dBdIcpYoiK3U7M2f71I/Zn6kKGC3mlRjJNc3mjwABEbjt5tIgcJHF1bg2PeAIyB/7go/65SnHj7NckARZB9iQaxslhXnTV3x1eHYiZ0cotTqHDWgFJf/uEsXK7JLrs3vrCvS5xG5McqoJ0/6y6klLpAy38ArKh8BkotinLk7wK6IsQkie6ePD4OHtJllaq6GSgsC2KcmkOgD6r1Rnum0rPsq8Qfw5mIvqescIH3vfofjHAWBIss3VwtrV256aYu/Os75ZY5XEC3nYMASm1ekjbUB+amGC3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB6761.namprd11.prod.outlook.com
 (2603:10b6:303:20d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 06:08:35 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::8015:f6df:e093:52bd]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::8015:f6df:e093:52bd%8]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 06:08:35 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 4/6] tests/intel/kms_joiner_helper: Add
 intel_max_hdisplay_non_joiner_mode_found
Thread-Topic: [PATCH i-g-t 4/6] tests/intel/kms_joiner_helper: Add
 intel_max_hdisplay_non_joiner_mode_found
Thread-Index: AQHc8Yh6ycSCnRB9GkWxuU2clA05cLYpNu/Q
Date: Mon, 1 Jun 2026 06:08:35 +0000
Message-ID: <DM3PPF208195D8DF2BCF404B5A646B421C2E3152@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
 <20260601055545.1982351-5-kunal1.joshi@intel.com>
In-Reply-To: <20260601055545.1982351-5-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB6761:EE_
x-ms-office365-filtering-correlation-id: 6fde680c-62c6-4988-31c5-08debfa436f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099006|6133799003|4143699003|11063799006|5023799004|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: QCFdMvyjEYE50gidywlcGWWJogAnvgGBEfSGTa0GRtg2NLJIZMGPE/SuBOtlbr2CRTnmBTMQnA9EcaYmrys9roOioXhptGnPirmz11rvlkpS88RAK9FHqItPeBYIpAvTpRnq4ffyBgLqcCPvusjObTEZ4LPAzDv+hrGWHlIRPFH05IfgUv6OVS6Dc+6M+lXf78xMZePnh/UgbF4r8oOOVIOoKOCPUeOZAvXUfKag10WMCoLZ5tOg7qV0EPJZL2JqBYd/7kq52vFlBqgiqNAzjAhdIh7RMtLJfZlGnb+/hJ8rpOABbBvuLbN6zCkyFoWGbF69LA04vYGlyz4VWT8dwwwIl0Mgt4W1BdqjBBbafGyMmW7EX0EBYni8h+a03hCWZ0gXDa2rOgtZdQCmAxRUGqXMOPDgQq5yIdK111ZBN5mKr73nhiDYqNvWmE/bklCr+7l//04SebLzPQM4gmdIiqLK4z2hP/uiwCkDMR9o6bRaWCrlShwD20Fg14xI2CEo2+Wz1JJVPna7BRJn9UUubnWeHa8svK/ulh0CcfO2dNGwDDAqltQp1D+fbJgBmCK3Ni+/La/orGK9F2fUJZN2O3zJu1+blZVPZU+SHIRuxjBf5z1LgEOhYdJAPWQRAcc4oUPoI50a7YLM9XBAwy88X57lYTSOXbN8L0UVEJ4otMZTsd1f/ZmSfIaUyiMl2YagsXIFY0boa6EVhAxwqXNt/4dqmVzqziBbNAL/mrWnnUOrFRsJBA8ySEWnVjtsVGUs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099006)(6133799003)(4143699003)(11063799006)(5023799004)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PbJP+IsNBYYY6PZNbrRvBj5pm/u98QtLbm3r5knaVPYDcR3lMSahrce8fwuF?=
 =?us-ascii?Q?2X3GxDdWF283eVDxUvl6UPI5GyOoXcV9/vQw8P7rp6wrviyrJsFdVmrYDZbe?=
 =?us-ascii?Q?F5k6U9S3rltzbsSZ7QmTS1ZuVV905qs2hvfBq+9gVoFDT8DUg7ng1Mq9S3K7?=
 =?us-ascii?Q?74CahWZustclffURF2TqYWs8ujBgOZDE+ddIhOiw7RIf93g97cvZMuBEGono?=
 =?us-ascii?Q?8kFIHinx1muyZtkKs0OH69CUcqzGVQ39M+e5VuCZbxioXC6YwGqNqc+NXBLh?=
 =?us-ascii?Q?GGPZ5K+oNQ8KHq8tBjws1w70qWw907FNHN3JFxznC6Q+ZTK/JBpRE/exZu8Y?=
 =?us-ascii?Q?p5bRSl7x/z3eHSrGdI6IxyZMRSaDShmLA/cyyhgvX0+spGMU7Cw3SrOabey1?=
 =?us-ascii?Q?RqbH7uR7mQ41PiWlFxgjk4hdP+9QCyyJJ+jIf4XeQCIwomzIzQSLt5q8L3p5?=
 =?us-ascii?Q?/zDP1FztvSastCNbXjcKxauFPhmcagzbe49ZiVr8xepfMMbduXsNNbXStlWD?=
 =?us-ascii?Q?VW53qYnUy9lsqYhmcOZLQgI6RRzPHaQcKiwBAu9x+99Iqk6iQXbdqItrRsLw?=
 =?us-ascii?Q?HgjDDY+mtb49THjmO5L3cdwfpLM/MdppGjN3ByFCwYlZ9z3kJSbRfImNiKFv?=
 =?us-ascii?Q?N7XzxMi2iWWLO9MiM1WzWw3dygVt+cDUgczR5Tku/e7/LjLR/08ha1vfMw/H?=
 =?us-ascii?Q?0Gfg4DZ6bfvhOe3HcDvAUtxvV9yX2CTfhhtrkDZttvhfoF06iui8nuIabREi?=
 =?us-ascii?Q?8o/w8m8rL45xcOrvxmitN2NuURjoIAroIQRJnzEMo9lM7MjNRFPjVIRObym6?=
 =?us-ascii?Q?PCMdWULk1ZGYZVG1vfdhCLSc2SItGJndhVz7ZRQttzJJDejJKasbzrH9ix+d?=
 =?us-ascii?Q?BwJHK4h6pju7nyL3ty4D2jhiIC6D2fkMkwyBNbDsrBkvsmjZluViZLOI5OuT?=
 =?us-ascii?Q?K3QQFALHLDpWwN/2BvNl808i7RTfBY1/mY+K2LGU8TbW7oujBtShNnZREndY?=
 =?us-ascii?Q?eehq2KrCdkPUKu4/+DdpGOHHpTqaLHWzr2KnLdhZcLMoWfV/nFRFnumGcuSD?=
 =?us-ascii?Q?OpAbV5DXCmoiTZXYYDwABwPGRy2sL7vmXERRQbnautDW08HAc5Ymk0B+fdye?=
 =?us-ascii?Q?xPfRdO6DHsNhO+4KrBe7gDJTGiw2zcKk6zqh/wo3JvwGlLtHVMk+ziWaDgRv?=
 =?us-ascii?Q?FROYl0mdtOjUTsExXianHAGe7uc4M+8sv3+2NS7IiisT6nC+dK05VP5IIM+z?=
 =?us-ascii?Q?K4Nnn8MTCFftkDLcd0tCaBFZAe2L/BtjSKvja40BVnfhfhNQYglPKIPrkOwd?=
 =?us-ascii?Q?Di3bSQjcRkzXxcLEWWSzKb7sHqR0SaR+m/ASkh+VkU8sHKsczDXYbbyNIhAC?=
 =?us-ascii?Q?LzlNFqN1afPDK9nglVyTDNNaO16TLc85lxrOmmsIKhoJ6aPp25zSuOdbiMKo?=
 =?us-ascii?Q?VcJfzKvAQvOR9/ogLqbvSNHn0WXIrfAcSFbxt450qWU6nV4V+lBWM1nlIOXS?=
 =?us-ascii?Q?HqSSxdLLETdWvF+a26ZeNG+tR6fE4qcfRo+NfMaLCGkj5+K00EBCAcYyrOvo?=
 =?us-ascii?Q?GNyTD9wfyASi6IdswqjM6gMvb82lFCvFGFEdvCoOsLjtn7LTnddy4L8erwJ3?=
 =?us-ascii?Q?GxOdoeGUtM7GkW4IlgSl5FFToTtKsYy7SyuMsTkE5LzMX1iNmHuK+XmZb1U4?=
 =?us-ascii?Q?OkYFs9sIVlWbP270v8XnPyqL1v5wFC2mPlWdN2aW1HjfBJmG2LhVYXkY3pCV?=
 =?us-ascii?Q?TlfoX4mZlg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: h5Etvgia/oI1axUoyS87YN7C9Ux5dTGMlxFcH8QuQuh1+UIc4wLkNZhSBtJYC7kU+x3mI/Vr/jGoh7JlqM00r5Ncp1GE6ER6/23s+hONM1PfeJYH2Au+97ysLmlTtF4oXbFiS5x43e27VhQZuHKTZaF2zmXaIhZQswL97afoe6T6kxKP9Vv6H0MWZvdd0JsRdRZeVRB57ajM1pPrZ1kSsgV3buAJBLU3RLOUIdeIKbm1No53sdiVhF+PIDtHzqgMnboYuVBm3laUYDx9QtHkoJqAM1zUJEIgTEhuT8PQlHzG4ONpOX5UaJG2dZxZcqGY5TY/u3tmArtYDmdSkXSLpA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fde680c-62c6-4988-31c5-08debfa436f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 06:08:35.0172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ruoi3n6dIXFpOWgbb0J+ltQBNV/SOrOM8s/Fbew4b7fLroNvAjT4a0zEyDacDtu0kfPi3zF+9nijZeR5EZTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6761
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

> Subject: [PATCH i-g-t 4/6] tests/intel/kms_joiner_helper: Add
> intel_max_hdisplay_non_joiner_mode_found
>=20
> Introduce an Intel-specific function to find the highest-resolution mode =
that
> doesn't require bigjoiner. This optimizes for display resolution (hdispla=
y), using
> clock as a tiebreaker.
>=20
> Create independent function for max hdisplay (Karthik)
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/intel/kms_joiner_helper.c | 42 +++++++++++++++++++++++++++++++++
> tests/intel/kms_joiner_helper.h |  2 ++
>  2 files changed, 44 insertions(+)
>=20
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_hel=
per.c
> index e24d7ce94..9e220be2c 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -183,3 +183,45 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>  	}
>  	return true;
>  }
> +
> +/**
> + * intel_max_hdisplay_non_joiner_mode_found:
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @max_dot_clock: max dot clock frequency
> + * @mode: libdrm mode to be filled
> + *
> + * Find the mode with maximum hdisplay that does not require bigjoiner.
> + *
> + * Bigjoiner is triggered when EITHER:
> + * - hdisplay > max_pipe_hdisplay (platform's single-pipe width limit)
> + * - clock > max_dotclock (platform's clock limit)
> + *
> + * Prioritizes hdisplay as the primary metric, using clock as a
> + * tiebreaker when multiple modes have identical hdisplay. This is
> +correct for
> + * display testing where maximum supported resolution is the primary
> concern.
> + *
> + * Returns: true if a valid non-joiner mode exists, false otherwise.
> + */
> +bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd,
> drmModeConnector *connector,
> +					      int max_dotclock,
> drmModeModeInfo *mode) {
> +	bool found =3D false;
> +
> +	for (int i =3D 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *current_mode =3D &connector->modes[i];
> +
> +		if (igt_bigjoiner_possible(drm_fd, current_mode,
> max_dotclock))
> +			continue;
> +
> +		if (!found ||
> +		    current_mode->hdisplay > mode->hdisplay ||
> +		    (current_mode->hdisplay =3D=3D mode->hdisplay &&
> +		     current_mode->clock > mode->clock)) {
> +			*mode =3D *current_mode;
> +			found =3D true;
> +		}
> +	}
> +
> +	return found;
> +}
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_hel=
per.h
> index 6d21e7eb0..90c50e5c6 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -17,6 +17,8 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>  				  uint32_t *used_pipes_mask,
>  				  uint32_t master_pipes_mask,
>  				  uint32_t valid_pipes_mask);
> +bool intel_max_hdisplay_non_joiner_mode_found(int drm_fd,
> drmModeConnector *connector,
> +					      int max_dotclock,
> drmModeModeInfo *mode);
>=20
>  enum force_joiner_mode {
>  	FORCE_JOINER_ENABLE =3D 0,
> --
> 2.25.1

