Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35403FD460F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 04:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3D110E0C7;
	Thu, 26 Feb 2026 04:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRrBx5Mx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C42810E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 04:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772078578; x=1803614578;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tvMZbTdesg3xbYoGvQ2uA3KgXvfXY7dwgjaL0Uuagvg=;
 b=KRrBx5Mx4XHAUI6tBX471suS8Id9LRnQ3DbDTobGwAQKmnuR67YWOv5e
 OqT7PThKG21NPIiI2MD6jVKtuf//Yko0kNL46Be7AGq5BHWRZ3rDOIPIk
 R4WpRMFOgyCLciu0Vz24shi/hbW2kQtwARf2pyvfCKu/AF2CnN+Vcmwm+
 xe2CwYdNQ8GbvuOzNOe5km4Ms4Mi+8JAEZeNM1IegZCOIBM+o0g+ggvRr
 tdH1EYA6BxnmVqMN9cPmhDG4GIuthfrA9hlmAPC2UsWqa6Ul4BQHymUXw
 aq23r6P+9w+iUyrovklj9E7RZ6aRcumYd/ZAR67RfRYyXTPq8DFyyq9U9 Q==;
X-CSE-ConnectionGUID: RaexCnG7SQ+k/M58XMea3A==
X-CSE-MsgGUID: rBZKb5PzQjiBBwO9sbtApA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98601829"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="98601829"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:02:58 -0800
X-CSE-ConnectionGUID: hsDrXvdTRVWvERVQxw4oZw==
X-CSE-MsgGUID: Xd3qk5RfQWai9DKN01BFiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="221065464"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 20:02:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 20:02:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 20:02:57 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 20:02:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuWYgQGA4nnIVBPp1RE0YO/Qz31kdRMzBC/rzNFN12/p0H/qQ66zLHPOJAc6Ol71+R5Afdq/9eqAGOgBlWOaLvQMVAW4WetpUSyJJ5yhmaz33ec7L1cQ1nnrbEqWtETQIeXWn1K7M898Yw8CYPH9RbAB8CgvXitmB/LNaBzRMS7PuMLhhRuTvHxN+5c1vc9zPB4o1Q83W+RXlnLptCIq7WF+y/xbsQb7uND7guXGAVLQbeWM1PLS121jHu06VPGoBiju9nCsZ/jsMZXF9TwHkd/G465xlkXvEopRtyohewQHFyOnRjz3IqHCjL+XvtcGoG+a1tYH8Y90srVSzH2U/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf92R0enz332r5/im7KXTDgxyuW6DylNh4KtTLZjiJM=;
 b=dfw9YbIb6drmSH05GMbmXzNsjdUfbbaIwwOozFkPyE4hBUFeGLnKrI3ysnZoZvoAWi93mlY1OkrHSYmXfNZ6i24soWDaQxlZDLhdJ+Omyqw0NPDlmteiEzq4BJhAuQcvej8LiOse1yzNnO6/8QnJol+ATItcfnWCeMsXPxysIYlQOC0VgSsaF/Wapt3SVCCc+FVZ/4E3HHEaKZFDAf3y9NpaSd6trG2q4gQBAtd8FFQ2aFpCu0TwsNc4hx/8h1FS1jXIGF3oVS1oT15phJt+8DM0FJmDxKHH6HpwmhLhUcoGITEGxI/1YbwtdTB6WTzxRznYvPHmzVAXzFGBVsLKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH0PR11MB5233.namprd11.prod.outlook.com
 (2603:10b6:610:e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 04:02:50 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::b65a:1e88:89fa:c16]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::b65a:1e88:89fa:c16%3]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 04:02:50 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper to check
 for MST outputs
Thread-Topic: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper to
 check for MST outputs
Thread-Index: AQHconne24mAmIwQJkiYbPktyt+ZNrWUYclg
Date: Thu, 26 Feb 2026 04:02:50 +0000
Message-ID: <DM3PPF208195D8DCE2BD805F5143F124734E372A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260220152239.276034-1-kunal1.joshi@intel.com>
 <20260220152239.276034-2-kunal1.joshi@intel.com>
In-Reply-To: <20260220152239.276034-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH0PR11MB5233:EE_
x-ms-office365-filtering-correlation-id: 5357234b-6a23-4bc3-caed-08de74ebe8ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: yiPcrtaQXmHhbYOxdi2zi7howuwEZZaH73MPdLWwdL5tr3abqNZe+M0J7SNXmAW8rxt3aEL8xqcenpid9aYA3bO0swCqpHBDR9I2y4cAtH6YKk7qp1IYb5pUOTf81++6cDanDyvzNc7t2onuH2DfgV97izXWepcBsZ9NIi386sPnlHjNNIe7AyNzu4NXVjfhBwsppZNylbIqyfMYx+fSd9WycuVKjIYTRupn4umHsFKeoz+xVmaoR461/3Y6u0vH5mgUHTitNSsi+daKXN3fu/lKKA9m0gzFP/KN15UbSx6S2xod3CQEb8hZKKwX/T9sJeYwUXCExco+LIBiodddxONBgMo/4av6cC+o6vlWq6gnrE1xft6HTeU9PM4B0bJi+k/P9YaGcWrirP01rhIAN9KoELYQcKNjc9G2ByHeE7Cvoj1YexxG89DJ75YBipNhKJg7uPtiKTSEu7egqGVUonbHYmgMsfdNPBzr/gOxNcmdK0eVbaH8A1G8IxTyGSQV7olP7u/ul54JJALHQxJrQWT+Sp9O0kiysL4Yw9dC2s/JysDlhKKlneWrEfFjhCHCdqD/qWj6y0lAPgA3a5HTSWO7mei8gg23W9WK2EqRdUSYXbsJkXcrbwVXDCoWfRyPK3H6iHQbhLwfNLpGm19NU+KvrK8rhQGsw3APYQGvF7JBXqy8HZb8BdGBkOmm0ZXAMkCQ8P8e17NoWx3HnaXlxkdYtrwSV5h3y7Zr0qiSHYdISkz655FtxuQy/qU8jt8So0xAoSCtDCOPqx8trDyF8tqCEmxyNMM3tYd1s2qYTnw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pj7Unf24dTEcgbPuEW97xTjf3o16/vJmvq/oGNHf9KCpuK812Xy9wfAYT1BQ?=
 =?us-ascii?Q?c6xKaP4o+4hsdTEnGEy2yM4FeStfHVjmxktocWoGyXdpZRf0zqcPSp/E6xNC?=
 =?us-ascii?Q?ul2ADeEluwhjQOnb1zDlEzS3iq8SCJ9OzWvmb+6ZqBBz10ZRJB19q4duO+b1?=
 =?us-ascii?Q?J9p8ixE+1uWl3jMMXW5oHQsIeXVVbVV5BbhZOw1/mayMRwA0Fy5ZhreT2ftX?=
 =?us-ascii?Q?DNXlM6A0MSwpjOkJ6niJwNYVhi4YM06KtJTZB6qT00DKCnXejoJz0W65whRP?=
 =?us-ascii?Q?CHsfUtNeEXxsEo9blQbQH02/RYv9BMGbD0+eGEU5E/Wvhnkc04zqXhpmq0ch?=
 =?us-ascii?Q?vV6q7rgu6BX0zGM7L5HtwSPEIPIUJlTeN51XdpPEs62Pkco2JPnQE4O1g5O/?=
 =?us-ascii?Q?3g1ngKAoCz2MxCIEmpnh14HE8EmpCPQgf4K9N54mtYbWhx9K6SskQIkkowbS?=
 =?us-ascii?Q?Wkzn3DasRIt1fWLqtPVqkA24aPVOlErYxBu8C3zXPQatVq2neh0s9nvscd4R?=
 =?us-ascii?Q?74JAhI0yswnm974JB1wn967nxgtGDLkDzTpUegQWfdN4Nh67SIwkAIUHpGUL?=
 =?us-ascii?Q?VYUK8Gu6bGzcJF5w1Poj9rN45ivRiYC8+CNooHAII/iFowmR5U8Eqd0nxp01?=
 =?us-ascii?Q?vuDd4j/jDVIoRbf1KO43lIWXgedl09YN+tMzndTbsF8Dimzu+yNZJSsR1FgX?=
 =?us-ascii?Q?cFIVRcQTSLhV0kRHfBNByny6jEIDYq5rubf9R91rVBkm0w3WhXIsRB71H/S1?=
 =?us-ascii?Q?Bls3ZbQQ3P0Tou2sQ+XhBtDHC5Cu75X5eudO/QPT6fqIYj5iWbvyeap1Hzbn?=
 =?us-ascii?Q?RUA3kQa/iJITYXHE/vfCvtP/DNzjiG4TM46DXecpMWpcjTLCFB7OfgxJ9b8p?=
 =?us-ascii?Q?9qIoL+VczgUl6FqIOpqZjP5jM1tPAKuLG80iR0A719pmymqWffqrMwf5zTPY?=
 =?us-ascii?Q?84r/8DXTytN7VNxBlOim/DtormnTRmDUfBBEUGxww/ySZNZZbCEaRH2mh2dP?=
 =?us-ascii?Q?DfZh5Mju1FK41GDraScNE2q6jwtrVfBtUhm13hE+IaFyTVlLWfVJ2gkeqsP+?=
 =?us-ascii?Q?4Qlq8NncyMwc/DvuUEK6RdDIQDvE7ehgW1JBuwauom3N0kg3usiIJzOlJnYr?=
 =?us-ascii?Q?3S/1YNs42HXkm3xB8Bv8498RN69os/TfJFFFn99LtVo6U8Jx8tZ2VYRSFFaT?=
 =?us-ascii?Q?0FV6B6gNXO34YISoIaYPi6zDi3eMvCmhGR967QyWWBPJ6HDSTKqTFj7x9Ac/?=
 =?us-ascii?Q?D7DJbU4NhBOlBM8Zz3ehB9C3jMSsUCWfqeqmqFUzhaLqjAEoTJsCTkZuLDob?=
 =?us-ascii?Q?xV1jo8xvdd8WR/EmK2LfodvUQiUkCAUr7+mtAeZyAMYJ8iOeoeNk/8lzBoMI?=
 =?us-ascii?Q?hJdFWYxvNPHUrmNvt7rV2LlWGdR1/craz5Jn+I8YzEWfZ7rmoHcHzxRKh6ab?=
 =?us-ascii?Q?Hf0xqRev454O8oO0Z2mlHhA2W/OnHIZnF4b4JkippSvfH+Ci93RqLBOcf9Th?=
 =?us-ascii?Q?cqHQBz/cu+L2X/7RSsMY1UC4H054ARldKNH82FyEL9tK8mj8AN37VCvMAG7J?=
 =?us-ascii?Q?HoehOQUoIX7IXTD/ycp+PkznYOqj5R1u1jIIm+EoZ4Z0C+AXG2U7KzcFvPN8?=
 =?us-ascii?Q?QNb/Sum6eBDARnVoc8hKPi72UFTj4kqpSPpccb8KSmrCZlTVBViv9c0ehK7u?=
 =?us-ascii?Q?zNAnUxDJY7cHjC48Fu8YMZ3aS/VuGhjW7uFVUgzYijaak/xlNlt0tM8jHaDW?=
 =?us-ascii?Q?tcgv87xWIQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5357234b-6a23-4bc3-caed-08de74ebe8ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 04:02:50.2698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sKa7paMezWzdq69595riBKltheJdoyrEXCce4qqNxv9g/M8GxZ8YIrJRIMmxHKE+ugPDEPUqbHaG0doO5I0+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5233
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

> Subject: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper to chec=
k for
> MST outputs
>=20
> Add igt_display_has_mst_output() helper function to check if a display ha=
s at
> least one DP MST output connected.
> This is useful for tests that need to verify MST output availability befo=
re
> running.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/intel/kms_mst_helper.c | 19 +++++++++++++++++++
> tests/intel/kms_mst_helper.h |  1 +
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c =
index
> aef74cd31..6b986a45c 100644
> --- a/tests/intel/kms_mst_helper.c
> +++ b/tests/intel/kms_mst_helper.c
> @@ -46,3 +46,22 @@ int igt_find_all_mst_output_in_topology(int drm_fd,
> igt_display_t *display,
>  	}
>  	return 0;
>  }
> +
> +/*
> + * @display: pointer to #igt_display_t structure
> + *
> + * Iterates over all connected outputs and checks if any of them
> + * is a DP MST output.
> + *
> + * Returns: true if at least one MST output is found, false otherwise

I was browsing through different helper files here saw that we do not reall=
y have a consistent way of
How these are documented.
I would like someone to take up the task to either just remove or add the c=
orrect documentation for
each not static function.
If we choose documenting these functions I would like it to follow the kern=
el way of documenting stuff.
SO=20
Function name : one/two line of what it does
Arguments: description

Returns : what it returns and when

Also here I think lets not add any documentation at all (the function name =
and code seem self explanatory)
, It can be added later if someone starts working the above and we decide t=
o make documentation across helpers uniform.

Mentioned changes
Regards,
Suraj Kandpal

> +*/ bool igt_display_has_mst_output(igt_display_t *display) {
> +    igt_output_t *output;
> +
> +    for_each_connected_output(display, output) {
> +        if (igt_check_output_is_dp_mst(output))
> +            return true;
> +    }
> +    return false;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h =
index
> 7391494ab..0e8ece0a0 100644
> --- a/tests/intel/kms_mst_helper.h
> +++ b/tests/intel/kms_mst_helper.h
> @@ -12,4 +12,5 @@ int igt_find_all_mst_output_in_topology(int drm_fd,
> igt_display_t *display,
>  					igt_output_t *output,
>  					igt_output_t *mst_outputs[],
>  					int *num_mst_outputs);
> +bool igt_display_has_mst_output(igt_display_t *display);
>  #endif
> --
> 2.43.0

