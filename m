Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DA9CD8C8E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 05:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF3E10ED03;
	Mon,  8 Jun 2026 05:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UclQmC6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4E210ED03
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 05:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780896625; x=1812432625;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g6dga+amoTNnz4s7fEkHqWltuBgG8H7BoWdRwe5Cw3c=;
 b=UclQmC6lkbjJCPH+9k+vR7aUTiwAjEjZtgzcbBPmkN2iGEeg7MhdJ7ev
 vD+3bUAQ/qGVz39D0wM8qAwnbQ2JlS9r4Mps8AhcOjqDlUkLq+DpVNW9D
 O0oo4Ya19+LwIr9WrdAXFX8STYKZsKYjSft+KFC9kFydbsFgpxuCru1lv
 6UKPHfZDI6h7XExqHNGBOXOMVHxJ9GUcgJn1kez1LMdB7S7X7hOFgRL8s
 EFxW7+dGS96dmkJCqppNrE2Y49jv9ub91fSFlpQMufJ/Jq4Q4spCFagNW
 jhLUjgbxV6XeMVNjt4tMpcIJyom5v/IDLfjWphj55vps0yHEyoHgzFEYb g==;
X-CSE-ConnectionGUID: hg9ImQjhQuqy9n732j0/Bw==
X-CSE-MsgGUID: wKjmS9CVRv6CzYBkAuDG1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="84198703"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="84198703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:30:23 -0700
X-CSE-ConnectionGUID: 0aE+m0tEQSWIMZBwPV/vvA==
X-CSE-MsgGUID: a/p1N5/8SLiRAmOxE+UqoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="250548178"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:30:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:30:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 7 Jun 2026 22:30:22 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 7 Jun 2026 22:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mT1h07m81rc0ahT1B6dLG+hVZ0/65nTwOnUzx5lYlQqrhtm96rNr7qomjgqU27FLLE7B7zJSO/ygv9kRmzWv01dVTyaAly8mK1ps2fjuEAKog3IfsxBlk8BrpvuDU3lOhxPZVXCegE2U6vjBKiFklmzDHcD+4nis8ac+13xvE3BX7fhf6s/KhRZrSxssEi6OOcsyMiqDmbvdiMdSo6bvQ8Eo8yhBR5tV6oWQyoEHvB400wzW6lLCjj27d5ONtWabE9xlPgw9sweqQAqZOD/9GWTcpgZj0/0P6NEOL34gl0AQ/cvC6IkPFINLUJ/uasdCkjdF5NFjJW8LzfViKOdEFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihoM5BGrSOcGHnl4reV9pI5ZQR7SlicRoY2NuaQnQzs=;
 b=hkqJ+LfjCaL92KGu7VkjqBL82MVO6Kux5UCinkhqRDQqPLtTFJgwcVU+M1UlemIM8NFAoyDQskEnNecK18gpqJ6FizKjw4zmAK4BylT61MrYbKOWL0JVlz5KoFmkZVFu1R4CfNJwtAlZAnU2rs0lL4LLl+KvW0Ya1AKBdHYixduGRdy5eeochqkjAi82oUIoyduzVCIUsbRakpxQkusgXz11dgq1b9a8RZc/1NUAn4BPazY/efgNdc+zERaD1Q9ghKGx/IwN8XQudON4hc50itlQLhfKLoCM6xGCOrofRyJpQk5F/ZuSca9xC0O5FwV2nJ5eDp6GyZDUCqSOsaDh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.12; Mon, 8 Jun 2026 05:30:14 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 05:30:14 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Blocklist kms_dsc ultrajoiner tests
Thread-Topic: [PATCH i-g-t] intel-ci: Blocklist kms_dsc ultrajoiner tests
Thread-Index: AQHc9wbYp+hi3hNfzEq6JsgyrtMZgrY0IY8g
Date: Mon, 8 Jun 2026 05:30:14 +0000
Message-ID: <DM4PR11MB63122FF10DCCA9443624649F901C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260608051759.2787899-1-karthik.b.s@intel.com>
In-Reply-To: <20260608051759.2787899-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB7424:EE_
x-ms-office365-filtering-correlation-id: 6bb33536-dd04-4f09-61a6-08dec51f0475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799006|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: 6kBVloVfElQvSGdP6DnvRngilCweF/s28iU7k2BH87vdXjdIngZN34q/iedCuvuerAbqC2PKAhh+les+wASoDS/8gihiobEpFIzm+uZYkwx0bs2HerWIQXxwQ5WRzaaWHx2hTCVasOZNXZcXhDQjmtEQJ+9+enh16GVKNf6KcZeNSvtHW9cw602vX12UGxo72AVMoKjYJpHjLqWvlYN1CghHir/tuOi1eZsqeV8a+9+o3HCbbIK8A22SVmfAVq1eR7jNVXdZUPJej4rsFJ0gCQpBTQKWIbEeZ+o3uHebBqUazEkoZZ6JpEJYcFV6CxtNWgI1/LHhnpFTqt3p4gKvbJTtBLspqulsoHdaCde4NpMfiERZWUJ6P7V8choM9MPqgv96W++1LdosdmtI1RwaayCbagkS0tVptI+Qh8s1WCGWO4kdXGJQuHYae7+Pq8g48hXPrnQ4KUgk9VrWWR+9/ImNGivLo18GMWybtbcOPpSTCMoRQNCnUprOxj9yNoh3IY+PKZS1du2SCxsa9wYQTrR4DoTHz4neg3W9y5Uregl2pWKs3OVRLLYXWFANPdyV0ef5abnfbr+QIy6UHJ/xeH8x9jRSGB3jCu0axrl5r/WkLXaac/ltkqU8r9rHKSawLJmtp+8sXlE54B0cSeMpcgf8B9JlApLVLP4Tj+ITWokyH+mrqnbN50vLgFnI0qBXLba1SuoCIsOP4FWlmdvYPabIzvYNEKv2rt31NcDFzOnKSfOLL8rFDmmgd+chhk1B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(56012099006)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6tGEth1Z1b5o2oIgk4Upyu0pbdUfYZoam2fqeoisuE+q7A22BmqTH2UqzDAQ?=
 =?us-ascii?Q?VP5Q1AsUjK9U2vFxyWuDXVKYsz9/MkJFepUNRwB1wpG8YXFQseMviyJG2zRW?=
 =?us-ascii?Q?08Xhw5Pa1sNS95bsTnfzjxZ5o/Sa4JJF8chk2COXv7OwXU1N31w94Hy+nQp8?=
 =?us-ascii?Q?6xhp/53nRRkk9ITsVXeeaKstomKYWywnZqicdaT3AO05XCkYiA4qICabkqqC?=
 =?us-ascii?Q?J1i9Nxmxjt3hL7XELMFa5OMyu6cOrOQaTLHyO2ExhHfU6WRv09s5B/byIWRy?=
 =?us-ascii?Q?+3iBQeKcYDEnR9pS6nN3vz1bSfETM18t6buX5kqy4UO9qZnqYdLJGw1SIa15?=
 =?us-ascii?Q?sWTnjPL0/vOrJjJIMemHc7P625KOWnprAuA9dYEriaYUlV63rB7LJAY+r9a8?=
 =?us-ascii?Q?hfmgE96ibCkd/XAsKgh5ZIFjkKclI3Mt6LmnRCP0fgox6kaxHUTDhaLzapLq?=
 =?us-ascii?Q?+4qZyg0jU5u086WF5y8UB7ne/xzVUhnxk5nk+E9H4zIO9fP7AgPaCWns+Gzl?=
 =?us-ascii?Q?lQWcYdEXqlG9951LZb27gObse/NorHbbQwr7RloYrFvdKC3T0CwE7ThSx69y?=
 =?us-ascii?Q?mKn5Dg9gVW2mzzD/e7qAHjgdvCukEPKHX81gxOVDxn+gaX5+nxRuj7vSCV3F?=
 =?us-ascii?Q?oYth/fu/rEtouOki1WPx0idxNCizE62RU2FedTIC+fYEOy9J7iXnAPbgHlb4?=
 =?us-ascii?Q?aTv4S2tzQ3BUi6tvgKZ0CVup4XbI2ACbDe4mdTawrq/s27+vIelRrG+jWCee?=
 =?us-ascii?Q?2/Vd4wCnt24x7rLEOXLYovdEFX9aJH6vR97ER5hrGsfJlGlksSOYQ9dRiPyQ?=
 =?us-ascii?Q?+3TkSDw0vzmUcX7W+h2w8cIxPiG4ZjckpN87+TqlVLmOeWU04XG1KdZLOL2J?=
 =?us-ascii?Q?mrHgM+GMQHCCVEKh0aY/fGwBdj/7zh0rIuK7h15f5SRJMQtleFDy2cOMbGmn?=
 =?us-ascii?Q?8gOpLBAlUV1HaDq9Sh7y/suqt6AaFYfWLRcfPdJLBK1xmEcSypcmQ8sLxrAn?=
 =?us-ascii?Q?yuCjM+nFTU9f0SKM+JqTyijzUe2lywkpqsVmdFjk1oIDosjqZR/2CcMBdS2a?=
 =?us-ascii?Q?kMQiPA5kjeO+7fA5VTePDaQEqo5HqG33U2JYt5FkLXcz+Hi1IKW16yOCl8Us?=
 =?us-ascii?Q?RpHAZYaxTJWxoTJtEI+QFseljwucb70WJHxrY2ZXsquOpctv5s4tXM31aTL5?=
 =?us-ascii?Q?8roe15meh7DF5n1tcwlw3at/CVEHcDYMA48ftdq2i4bD7L1/HacH49frbFbJ?=
 =?us-ascii?Q?DNMSe0LDV/rqBG+mYSc3WoioB3x7TdhzdTfaN9+maCLVmVnBjqhLtV++nZfU?=
 =?us-ascii?Q?plQVFOL5lP97oP+IUw6r6qfZyTSKuY/6EqjFlFzfUFQ0+t38gVbTiOTiUrQx?=
 =?us-ascii?Q?XTQWuTjqnUV43kN5RuV2h/Z0Bhc7t0GR0ppJG2oZmQZVgKLzudCub9fAk6kj?=
 =?us-ascii?Q?3LgRj6SpnsUIyCTt+1/w5Di60BN+TtgjGddbhjHLhTcQ+4kT3bSNPg4VP9Dv?=
 =?us-ascii?Q?GJnYM4O/SMD9dQ7hLTEKPkOl2szs4y0VodcclPi6BR9QLL8p+k/+kp6x9oRd?=
 =?us-ascii?Q?XxU6GV2Ci76zcVtug/eDIm/y4VZMZtBKmMyK124Swqx09f02cRHlWFjwRfsm?=
 =?us-ascii?Q?xQ0fgP0NgoZhbiEUHdgIlhgSvn9CtkMqusKgOVa6L1+YCsYYe0cZcmser28g?=
 =?us-ascii?Q?IvfgycQ0ZgDSUa0xrDqJi3Fu32YLjug2yzSQroKOSw/Wt6v4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lMCdrl4GsyOclO+11FGV2w4c5ed9Hwg0uitCq6pz3pQSDsnTEJLafzcBsfnS1cWvvS73IYnKPYS4JI6WOncSwuGoQ2gcSybmmjHAXxvkJPeZxVrt+i2T/Yg5I0TLolCRrlNF0SfSkiCzcjHhxPbzbMeNH7WQJMuwJZpkbRcfJR18kaDG1ZvBc9gcPZI0BnD4VfCwXFDjKeVbMUHuz/mkKvmTJmTrh1iNEvSjZNgVA+6qTmB2j6G0qJQluvvYzLj1ZM2H2yHtYf14ZFHa6zkawqNdDszIx7KcfeB/leV01WzX8Pcg3FiOUWzq27jSORzBYcQ1GPZHqRuwOGvHNK8u8A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb33536-dd04-4f09-61a6-08dec51f0475
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 05:30:14.2606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QNFBPUIq918xfrto5EcYBZlxMGsBAj6eOFqcEM4dcZfa3MvYrEaF62ZYfKD1nZpr8/+2PmIprbTyNaV/se9Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Monday, June 8, 2026 10:48 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Blocklist kms_dsc ultrajoiner tests
>=20
> Blocklist the ultrajoiner subtests added on kms_dsc on LNL, PTL and NVL a=
s
> ultra joiner is not supported on these platforms.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
LGTM.=20
Reviewed-by: Jeevan B <jeevan.b@intel.com>=20
> ---
>  tests/intel-ci/xe.lnl.display.blocklist.txt | 1 +  tests/intel-
> ci/xe.nvl.display.blocklist.txt | 1 +  tests/intel-ci/xe.ptl.display.bloc=
klist.txt | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-
> ci/xe.lnl.display.blocklist.txt
> index 82655802a..5f918a003 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -74,6 +74,7 @@ igt@kms_bw@.*-4-displays-.*  # Ultrajoiner is not
> supported with only 3 pipes  #########################################
>  igt@kms_joiner@.*ultra-joiner.*
> +igt@kms_dsc@.*ultrajoiner
>  ##########################################
>  # Valid skip :- Feature is not enabled on kernel
> ##########################################
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-
> ci/xe.nvl.display.blocklist.txt
> index 5d8398918..e6390d16b 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -118,6 +118,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
>  # Bspec: 69556
>=20
> ###################################################################
> ###########
>  igt@kms_joiner@.*ultra-joiner.*
> +igt@kms_dsc@.*ultrajoiner
>=20
> ###################################################################
> ###########
>  # Valid skip: Display 12+ is not supporting FBC with PSR2  # in case of =
selective
> update.
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-
> ci/xe.ptl.display.blocklist.txt
> index 99758c2ec..c897f3c69 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -158,6 +158,7 @@ igt@kms_psr2_sf@fbc-(psr2|pr)-.*  # Expected skip
> on PTL, UJ not supported
> ###################################################################
> ###########
>  igt@kms_joiner@.*ultra-joiner.*
> +igt@kms_dsc@.*ultrajoiner
>=20
> ###################################################################
> ###########
>  # Deep-pkgc IGT not applicable
>=20
> ###################################################################
> ###########
> --
> 2.43.0

