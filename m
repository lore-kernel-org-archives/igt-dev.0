Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58575E9A03E
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 08:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046BA10E58E;
	Wed, 18 Feb 2026 08:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMYfBs9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4E510E589
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771403820; x=1802939820;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2Nw5AoQF7t7mZptPQbp4DXyN7B593eHGxQaEoz0HVd8=;
 b=cMYfBs9tulRNhgKpwZqX3aEjJD8EeySV7+tX+GRjN0TYfte9zAacqqSu
 maF2BCbIpNb9/NMSTLh9d1MbAw39aDhh+YAuYktQpWwqWHkahKf1ga0CH
 dlIt4SL30K5LGxbJ3AToBdeDNCMfpDO265Lek8U+dcoPynBSyklm4XWbl
 sJ2yod41q5sRO6xiMyGnk42rNHcUaXIV+VaUqWLaijzXTQ6KbLB0UZQJv
 7hGRntcUWxELBfTdKxvXrjjqHN2wzBMCzIEZumqo6sx302ozpzpkrDb/S
 oAHsDximMSb1KKv8VR8CJ4Bz8jvpbrZIZDrcwxGgEdp2iBzRtxk57vYCr g==;
X-CSE-ConnectionGUID: U9K1XEwrSme8rtuoTfm2pg==
X-CSE-MsgGUID: kxiOlSxTTKi3zOn2zPY9pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="82803930"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="82803930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:36:59 -0800
X-CSE-ConnectionGUID: ROszN/lkT72nStn+bAhagA==
X-CSE-MsgGUID: 84SGe3qoSrKZ9OD+oRFIsA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:37:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 00:37:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 00:37:00 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 00:37:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+oHWE8TD5iDYzrV6E2EHUEjbSsrKymBZJi1Ic/kZgwpay/LMAYfEEO+XIHgTqfxXVIdDEoh7im9e1udSsTvDfarWDEEa/xLIQArunVrLgVUIVhw3sD+EWmgiL6HVSWlXDgTZTFj8xI3J0MyE4SLooyvoY+G7zKsdQalKZrF8kswqJnU5PCYptshk0IFBb83gevy61Js3YZK4XkfapQij9ULK3TYCCQxD8TNCz6tuKRUtBgtKpldPCt1QoK038Xnmr6rRHZeTTMwbCjlIXaKGKhsPU/BGPQ/Ig0b2x0ycjhPpooBlxRUkd+ekusKw2WcHiKjXjOd9Vm8Cm+HuakGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIlTY3wDxfkrpHRgg6tCYg17p7exyqpgKr4hRpT4LlA=;
 b=hPwH1padD2hFua0FbDU/YYyb4d/9vPIDCpY02OwfReVxrsnDtpKNuI7YEPMtsEVxBsvqZBgebgwTLI8xiO3DR5FTJTwYMQXEtu145yNlyphdb8U7kDGq5QVYy4TXrSVsBDhKeJ4sweQStvW9+t9XP46luyfwJq3yWQya44H+QW97Xi5Ll8mM+NUAwFV2SMcMq+JHrIdLKkHbGBu6j1RGzg6UK+AW8AzmtfVit9Wc/4cwLCLJegOPBXW624Kw0yJlMc5dq6fg5ksuQX+IPKieaJyvIKvq/Z0+Jso+v31nqcUgJQSirSLIVL28HA78jGAnQ/ON7x/o1gm0oKFpaF4yyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 08:36:58 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 08:36:58 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Brzezinka, Sebastian"
 <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v1 1/2] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Thread-Topic: [PATCH v1 1/2] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Thread-Index: AQHcoK32yYl2jke20UKfkEZFV31K6rWIILTg
Date: Wed, 18 Feb 2026 08:36:58 +0000
Message-ID: <DM4PR11MB6312E4274FCCE140EB5A665E906AA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260218080511.2534901-1-mohammed.bilal@intel.com>
 <20260218080511.2534901-2-mohammed.bilal@intel.com>
In-Reply-To: <20260218080511.2534901-2-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA2PR11MB5098:EE_
x-ms-office365-filtering-correlation-id: f6bb1019-ea23-4f20-df6e-08de6ec8e162
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hlvzh6nKXKEzB7FFhxWIcXuERxJ/dtJHZ0RKXJ454B+Rl/FVZ7u//NlUYPSr?=
 =?us-ascii?Q?6Se3lQbU9XSf6gYMhomfuimVmCdaWdIjAd8VeqnA1hGfDqYdZS7/IV9UKver?=
 =?us-ascii?Q?ZiABUGoY0BynK9iBeBOj7tQsKxpkgJF+wQBTQUBTNylt2C2mcudIUc/1mBPd?=
 =?us-ascii?Q?T8kWxnQcJLsnj954tR+S0iE+SuSS4ph/VP7YMPekGQDPtmw3iBLnLHyMnVeP?=
 =?us-ascii?Q?hlKt/whzYmHMnQizBCDXkQURtzx5VP17Kn70ECcrgnk2SOwbTpfBuHFshMB7?=
 =?us-ascii?Q?YuPvKxzM1HQo3iMoZYpqpkJN6h9NLxB2sCoHRZbCuEn20jjT6P85zdYzZk9R?=
 =?us-ascii?Q?5Lars3hV88uBm6luD2ANYuX5HJEEG8XapKAbGlxtL8LqL4aLtg/wdTv84Jxw?=
 =?us-ascii?Q?jTLuvdICnXM/NP8BV13RyFDmWnNusPBqayYHpO8A4zjbnljkkAEirUuuCthn?=
 =?us-ascii?Q?J+Awht8++AUJOYs/Ys1N+uUcb9BkPC/90D9U4jbp/FDut70PRlFYE91Mlnwn?=
 =?us-ascii?Q?s10RPoHq9db1nTglWJrSEvJ7X4cwYJps1qqKn56A3Nf9ELA2a6ntDv3Xd1au?=
 =?us-ascii?Q?ejJIY9kIbV3OdbR3t6fVhv8Rf4Z9K6S1ZdxucRoKJ67/iBQCPXmatl+pSkFZ?=
 =?us-ascii?Q?32BDIoqPe53IB5ySiImic+Y6xewZdJLVRCW5mpyFIzZ3Qa52SOQXAVvZt0g9?=
 =?us-ascii?Q?zR5bYcGojDtBKdnWqioKaSgL5jCkou5KWlJWWYqmGqlJMTUYLI/2870mf8xJ?=
 =?us-ascii?Q?eXW2Sg7M3cOWeR18dh1/vuDK5DPMECRoGI2ILSvYrwvpcqmbUW70mQZ57DMd?=
 =?us-ascii?Q?PH/73cXV05YfNXR10xmH5zAFXRjXod1i/AUC7nQuN9a8R60uF5ZISqIVIZPB?=
 =?us-ascii?Q?rTMVUDcdMOei9zl0TW5ilqdxvfOktuItxMMsWBg0mmarpH2wes46l57fXyYp?=
 =?us-ascii?Q?89Z4ThCblvbBFAemZ9mcguq2KCMOVQvzkU1+uHlPqM+Bkmjr4yp7pe9F+/OG?=
 =?us-ascii?Q?BghOXV3XmVr5NFStc6UaSQnCmVerNcxAxRceJrAWfLCW79NRAwwcUomE3jf2?=
 =?us-ascii?Q?bhiIvmREApLQaYWPLKdhX0SI0gv1MO/PciTzXj7/U2HyAocVsfSpyMdZwVCv?=
 =?us-ascii?Q?sWY4N36zdfIB/tqTqfRvT0VF7Dl15vluIy0PAnKrmvzW12YtJLJLNrqskDJ+?=
 =?us-ascii?Q?qQPw9LsYpb7DDPyL0dCV8+HqWpkZU8omAQrqN4qgPxQfw/H3AJ8Jw9bLxXtD?=
 =?us-ascii?Q?NvNK18F/TL1NhnFR0ENSJkbjYwh57JoYz+txOJ2Z+dCTo7r2yZj92x3PMvzB?=
 =?us-ascii?Q?LTdqVRBCvzgt/qRFjiMyA6TTJRNnFsNA9JMGYpBf/SFY84gURBw2b6kRqsvZ?=
 =?us-ascii?Q?hKAFnGe2m7ysTGrJ1qVa7vkZb63yY7lEkCQZxAm6pISZsil8w0NzOPTldUp6?=
 =?us-ascii?Q?EgLzpFWNPAK8oa4KW6BgS6sQcVf6Z7/JZO1sgj47Dt159D1+PgQ3Kk6AZtk3?=
 =?us-ascii?Q?K+IrLt8FZC8NgWr2Wvot0rNIBKAPTEN+82BjK6lRE5sRQPtVdmVPsLjKAcuJ?=
 =?us-ascii?Q?eRuSfE4Xf3dfgxKr0To3iYS/H8sPRektmNWffBW4JnXN5mOQiEuowIlbqniu?=
 =?us-ascii?Q?bogFXveCm2Vf6b/K/6CO0Vg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UAodDMidOZU+0eJ/qX5zcqZQybgO+9cIBN+aWVHzJU5pFWWxa6lqGg6FCurv?=
 =?us-ascii?Q?6TOAy1PEnDFqaGQDPmnTaKvKRlk7BeJxz9pYzbagSCMESXo8x9NOBIonTyvp?=
 =?us-ascii?Q?cBzfghKnYID6MwoBkME00u1C/YVtZW3k26AKhjVEqAhVVsr+s4xZGj8w+M5y?=
 =?us-ascii?Q?WAWo/F293oC0gBFWBXNtQnseyX/p4BnzfGrrWznZmk6CTQYudW94tn/izfID?=
 =?us-ascii?Q?KjPNS2WXOrvc3JvityG19xShcB/3KqJ/yjB5cOwM8SFiwJ33ivO4TZJjhIaY?=
 =?us-ascii?Q?YxpTvaibxKrmKIWN4PAOwO1zo4ynfEUkOqFNlRwSg5thbJmPP/SBzcPnTi4T?=
 =?us-ascii?Q?s7gVKrZcreUNYvDVlXFYVmM5m2zHjiYgFXwyl+HQH45vNRXAbtlYVXj5dcqT?=
 =?us-ascii?Q?0GO//jP6hNMqCTDsmWbCSnA43i4XFt6m0e91VMumPeW1wpFrwVHxgwWjP5Iq?=
 =?us-ascii?Q?oLW8hdiR1XiWQKp+rOJlK5EZ76hKyvi3Q4tUOyFROhcueJIeVj/axd5+mQXW?=
 =?us-ascii?Q?xAlSf49V3GAL7+F2Q08ofz/Lkg6mrhac2X54qyk3PvVdwwU+YMUNanL2kjMO?=
 =?us-ascii?Q?mKZtQrdzIdvYosCn7Gf5pH4OpNC+rmWE0a7Jz0aLQXsrgQRjQvAouzElwGbC?=
 =?us-ascii?Q?El3Gr07ftEqtAlY3hXOci/uAQHVWYK/jt0VQrk9BRMOj0T7NI5pmOCBRRdHL?=
 =?us-ascii?Q?bWmtBYfWiEW46uM1X959mOKh+Lkt3fFWZDiLbtjmmYmRqP2DDsemAgBIYIvM?=
 =?us-ascii?Q?xRW+g25BzmtnT7rYtOCfLRQ85KrQ7ZavW6ZQMzw8Cl6EGUA3aWU4IvG4ePIZ?=
 =?us-ascii?Q?+z9647eQDHa/8Vi8bXkjBdKJGxSr76YDnI/Sq2UFgjr8nWgHozwFe53aYuvr?=
 =?us-ascii?Q?VBawk6omwxARzs910tvXaGS/V6xN/pzIX78JuTBNk/xAYpq0bcgT7XikDOQg?=
 =?us-ascii?Q?/s66P5rLBOjp9soU4xqsIwLT/q+IrLjyC+yVCbAb2DlRjn8kWZdJG3T7wKbH?=
 =?us-ascii?Q?xwqXu+waBkk/lFZwK3iVo1eJL+It8NNgMWlM1rsOcb5YQhQMlfsccvH7DcM0?=
 =?us-ascii?Q?aLub3k/wsUhBmduBoyShC6VqdXdknwdY1lsTgGG1FUreBbGve3nsg9h51qFD?=
 =?us-ascii?Q?T+eR6p8v1ld6NU/SCUYIHzXInHmqu3dtrge4Fv+kK/vZWnNM3bWTfAJerUh3?=
 =?us-ascii?Q?+IybFwBxpwOHdZYrdPRgTuTHbJ87hHajCMQlQDhxcT0mCFgfTEtjjaSCp4EP?=
 =?us-ascii?Q?7+DEt/Wy3rWldUdlmwYXhk4bY7wvUVVTOEB9BWloTAYfxoNpMuRldoYYd6a5?=
 =?us-ascii?Q?gJ1t7FEAJC0vYIfPO3DsNDuyfkGOrmJ73Fqi82bYTHA2AsiNiWhSXZIm1GbP?=
 =?us-ascii?Q?5VgmUquB1/EfaJcAuXhNJ802u8FIbOGoPTYInZBOABbj+emooUf0P+OVC4bK?=
 =?us-ascii?Q?iLnNGIc3geR+0wkdy91PSRU7trOKSqAsQpbSn/hnz3OKN0dLmMsJXDtUUfDE?=
 =?us-ascii?Q?AYhgBVe90IP4UctqxV5dFhtxqtenr11o114k9t3AC43hSNAwM8yQ0VRAGQIk?=
 =?us-ascii?Q?fC+pO9/Vfo1fbMCY8ISYG6vlUoeCqp4poHi3/cYY4HvyyWURHikpHwjlFbI4?=
 =?us-ascii?Q?gyNXy9ccds0ONio6XkVvSLhB78jol7sM2kMGeqKIwsGp86E6f+hYEqBz7ATW?=
 =?us-ascii?Q?VPzLXUMwsLUHKPS6NfLK6Ff59ZQ9iqLi2Cqicwk+cS/8Bebs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bb1019-ea23-4f20-df6e-08de6ec8e162
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 08:36:58.6834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /pfEG6dfZdrcV35Zryp5polv/LOF8VmgwNmWmKzisAdgYCsbbxkMme6Zp5kfyEkSDvhPYxK403CmOdLF0klwrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
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
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Wednesday, February 18, 2026 1:35 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Brzezinka, Sebastian
> <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> <mohammed.bilal@intel.com>
> Subject: [PATCH v1 1/2] tests/kms_vrr: Skip LOBF test when aux-less ALPM =
is not
> enabled
>=20
> LOBF can operate in either Aux-less or Aux-wake ALPM modes. However, due =
to
> uncertainty around eDP version dependency and its impact on LOBF executio=
n,
> we currently restrict the test to run only when Aux-less ALPM is enabled =
to avoid
> unexpected failures.
>=20
> Add a helper to read the Aux-less ALPM status from debugfs and skip the L=
OBF
> subtest when Aux-less ALPM is not enabled on the panel, ensuring proper s=
kip
> behavior and preventing false negatives on unsupported configurations.
>
I think patch logic is valid and correct. Consider updating the commit mess=
age:

" LOBF is a feature introduced in eDP 1.5 that requires Aux-less ALPM suppo=
rt.
Pre-eDP 1.5 panels typically only support AUX-Wake ALPM and do not support
standard LOBF functionality. This patch ensures tests only run on panels
with proper LOBF support (eDP 1.5+)."

Or correct if I am missing something.
=20
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  lib/igt_kms.c   | 28 ++++++++++++++++++++++++++++
>  lib/igt_kms.h   |  1 +
>  tests/kms_vrr.c |  6 ++++++
>  3 files changed, 35 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 5c4879604..48684b4b3 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6578,6 +6578,34 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char
> *connector_name)
>  	return strstr(buf, "LOBF status: enabled");  }
>=20
> +/**
> + * igt_get_aux_less_alpm_status
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Check if Aux-less ALPM mode is enabled by reading
> + * the i915_edp_lobf_info debugfs.
> + *
> + * Return: True if aux-less ALPM is enabled.
> + */
> +bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name) {
> +	char buf[256];
> +	int fd, res;
> +
> +	fd =3D igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
> +	if (fd < 0)
> +		return false;
> +
> +	res =3D igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(b=
uf));
> +	close(fd);
> +
> +	if (res <=3D 0)
> +		return false;
> +
> +	return strstr(buf, "Aux-less alpm status: enabled") !=3D NULL; }
> +
>  /**
>   * igt_get_output_max_bpc:
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index dedc3f880..a1f52f452 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1257,6 +1257,7 @@ bool
> igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);  =
bool
> igt_fit_modes_in_bw(igt_display_t *display);  bool igt_has_lobf_debugfs(i=
nt
> drmfd, igt_output_t *output);  bool igt_get_i915_edp_lobf_status(int drmf=
d, char
> *connector_name);
> +bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name);
>  unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
> unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);  void
> igt_assert_output_bpc_equal(int drmfd, enum pipe pipe, diff --git
> a/tests/kms_vrr.c b/tests/kms_vrr.c index 811596ec2..e46e98727 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1013,6 +1013,12 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  			return false;
>  		}
>=20
> +		if (!igt_get_aux_less_alpm_status(data->drm_fd, output->name))
> {
> +			igt_info("%s: Aux-less ALPM not enabled, LOBF not
> supported.\n",
> +				 igt_output_name(output));
> +			return false;
> +		}
> +
>  		if (psr_sink_support(data->drm_fd, data->debugfs_fd,
> PSR_MODE_1, NULL) ||
>  		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE,
> NULL))
>  			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> --
> 2.48.1

