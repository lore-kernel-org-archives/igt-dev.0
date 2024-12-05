Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413E9E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 14:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F3110EEAC;
	Thu,  5 Dec 2024 14:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODEtO2Jb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5432810EEAC
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733410223; x=1764946223;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XZWsaUzJgGYakK8yqKp5xfVa8ILE4/4aA6l1m1iLkg0=;
 b=ODEtO2JbXegtVZ162kgK4OuED/YQkwJCn+3u2rMDkhd3jssY2GL4YIpA
 PS1BFtFzseUm5gQoW9Frg5h+HFwvUO1v2POQfXuxM6RJahHD+Kfb8CxTL
 6HGz9+ZWoGyGnszEelN+d8vuRB824n8UZX3PorwDl2e770iP2A3ehsSGO
 U9DXCY2toTNeGT/tq3zX3Xg11uOgWaqp8wgk8DCjE9JtLWIat3JrAHRiM
 dbFc9hq+roQWNzwKv9eS6EP1w3vkwzQtVPTxo0esWFZ+J/ggexDxnhXSP
 ml4eEj6qRfFLT7O9oJR2RBt/I8y6F0VHYIkeJSCgj0dHudCEX/gDE6oT1 w==;
X-CSE-ConnectionGUID: ahhZgvmlSjmzaJWMsGpNEw==
X-CSE-MsgGUID: RhasPA+uRLGs4+uXjw614A==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33056297"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33056297"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:50:23 -0800
X-CSE-ConnectionGUID: 9+Ur2iw4Q2GD91gluOpQVg==
X-CSE-MsgGUID: Ib8Je5GrTUSyaWPRxZxPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="98188128"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 06:50:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 06:50:22 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 06:50:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 06:50:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr264ru/Vu9MXigPUUTwIXdBtuGbNxChtpcCDZsV1NtppjKPZ8+/H3sah3svwUzTb25CQM5vMO6DxtFRbecpUdfMNo0BD8tF+bg1vaaDUCkDXiJ3F59mv+dKtkB0kHrFnP8mcKqD7BTKVLm0TqeVLmuJGMIERlhcsKi8MsdnwDQ+ZA2LQw6DixOal8nsG3+vhOhuNcFl0u0n78LNxuVVQw7DvFOuMnGYlodsMUhD31mUKBZBIlb6tyNKr/6UJGOoTO+GA2CqNPq6tqhTfXu+WxnmTeDzIU2o5cSh/ZBiZiltUg+KA447KWUF4rkdiHSUQRb1L8+qRU9pteLc3N+FXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVVHNybRXZ7p6LIPh28ugqEZ3ipsgj21fUGUtlbtwh4=;
 b=Vs2tutXtcMyBNdUzU3v9Pvy0UKo7OgaLrYOQQskB4YQlzH8EVKcLxZWnVUbCPvvBAWjg1LuYDft3rWoyDt2BWudueJ95L6Rd4BBZrw3TWaMp3t/l2qCy6tV2XmfwcafRxPgTBddXG4fbhxc6/EwdLmBCKJr2tCCwGnm9Y5uDSbBgCh0ntyvWj6ZJBgIMRRWKMYKekmhtqoABzh/rTr93nIKih3T5MHB4Tra9LqLKxx6V5TaZI/xfcgETzj9UJjsH5zWxCjGBHcly+kMD95O3f5H+VoScmHfIq73tB3T2rT315zdP756h1kE9VA06DgomXLGhmjLhUKZ+TLpabIADMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 14:50:19 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 14:50:19 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_scaling_modes: Add informative
 messages for skipped scaling mode tests
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_scaling_modes: Add informative
 messages for skipped scaling mode tests
Thread-Index: AQHbRxEBTAuCcm3frUGNm+Y2gAv7aLLXuxFg
Date: Thu, 5 Dec 2024 14:50:19 +0000
Message-ID: <PH7PR11MB6053BE56088EC9B654006706E7302@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
 <20241205122528.3761118-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20241205122528.3761118-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|IA0PR11MB7283:EE_
x-ms-office365-filtering-correlation-id: ffb0c0b1-2ab9-4071-30ae-08dd153c237b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?9J9QcxNgREIcP/I60jzA+9bbSJ+CnAWQVN/UUsg/c1/7B2g71wu5XUti0Wpm?=
 =?us-ascii?Q?i1Smn3HJTcaeGQbvAdLsLozFdKeCJQJ2YYRxlpqe0KpesuclagOH3zAltrTf?=
 =?us-ascii?Q?rHHH8SEBTrbyHMpnn2TJKXJKwD5QbGPhZInVNv1aljhBdvLXdpgSG8N0rXFC?=
 =?us-ascii?Q?+FjsCWOXVK02AGlgV/QJFGsBLdHfCOX5p7OTzgXL/qW9OlSivGxke9I4eX98?=
 =?us-ascii?Q?xS0ab0AERETXt9lXXkEKnzpGXhEoTteZiXq96EfxWSAXlYEQ1n9EZrafeueb?=
 =?us-ascii?Q?WKXiuqk7t8KZOSsqLpRh8h5/5DDC6nrlxJzYNpZ8mm6eaO/pwAbDrG8ymJ7M?=
 =?us-ascii?Q?FGr/7I3iwSvxHCEAdHDaTg+zPCTdzLZChz1dnWp2MW6nlx4KlQf+Vg2wup2I?=
 =?us-ascii?Q?BmJknjmDjYrHiPS6P8mQnUovVpYpO1oH8VIKshlCduC3tMXSkVIGbLqbJ8LL?=
 =?us-ascii?Q?s9UhcWFybBm4E9ChxWYBfhhLU6mHBLT/Way0mnxPUAvWZPkUvd84oySGvuek?=
 =?us-ascii?Q?WAoPk+i4akN+wFl9cLsokt4+ix3CdkXynLoMS+m+p9NA3gnUxzer+YXxYpGB?=
 =?us-ascii?Q?Ne9i4/W6ODNB4W/T7r5z/doci+uv86gTM8DFp7hAAaVpisYXXSbeKJroFlWD?=
 =?us-ascii?Q?w7gmIGuy4sfnPWI0oQJb6mWcx1JVlboDLYc+VS2SMoAttWeOo3FKfDn2U0oo?=
 =?us-ascii?Q?dwx7b/uc5P6vEta0I+eK55mYl3KKbKDh8+aKnYqk09uTY9L4XjkJy0/nEVFa?=
 =?us-ascii?Q?EJGBuYHUUTwB0IfTJqWuxCNRed71tEKWgYaF1ICdfS7Q2ZYpOgj/b3X5wA2w?=
 =?us-ascii?Q?Y2VpvS7gV7+eo5nDoZKi2D6kgLnVVOcRNDXUp4JpAlkaPB3ssqFU1Qu0mUWb?=
 =?us-ascii?Q?8c3Rvoj+w8hYc4bB7kSJgJQ5ITBqz7nLaNGrSJReBk483fyH1jHbY/+GZ9Ir?=
 =?us-ascii?Q?2rV5No7wtFNzkDASUf4SgSaDdcaZxkTtCMWABsI8wCfEOYkOl1ryk1xPenua?=
 =?us-ascii?Q?vMalT2F9b147hbW50FLGvJDXoCGV3bbxseb4I9idn6svsVMqG9+IGWEqc4G3?=
 =?us-ascii?Q?/p8V7fYieNWuaNZ59Dp2cjbrU08vfPG45uOy0Dq59b9szjrr6SBxTuNUn/cP?=
 =?us-ascii?Q?HaRFYJ9rkYga/edPcRycbyCPYa3SnFEiBb1hFe/s9uAjfD7l6PswYKEhuuTu?=
 =?us-ascii?Q?vtjyjI5QRam77na4KPGw8sc9S9FgyDd/zBfp/9+/Dr9s5kQY0iiYjbh7phzS?=
 =?us-ascii?Q?rX/k9kOp2AltoG77RelsUdxtm8z3mjl0XbCGk98OSmpNHex4eUT9dVctZByZ?=
 =?us-ascii?Q?XWE9MVpljNpzdALlXpDWojbLfpEztfg/OAFB7X5HXnh+OB0IHuZP+H9Mp47i?=
 =?us-ascii?Q?zcGOX5uTS71YjwAl8XE2Aj27VR/pNZzqa/JHCM3iAsW0DOv/ow=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O7HbqL1Pjm/J2TXTgF4gOUQOMhaF+eH0r9a6jX7PwBx9L+uxUoTaw+RH+q5e?=
 =?us-ascii?Q?+rlgCSTXnnaeW3GXgxccBI7DTazHDc+iefgcpaZawqRZxK/8+uClyhrdLvia?=
 =?us-ascii?Q?94DhPV8nhEaC2BSssH7lFHkI+ACxyL3mj2ov/O0RDrUdOEX7fP+mUjHKFLnW?=
 =?us-ascii?Q?xjKzegw4rQYjwGo70nRP67dVqtvze7dJhm94nUFP+m9twizObhFnCHIaNAeE?=
 =?us-ascii?Q?1n24z1DYkXdpOwQNm8+AI4SFseulWjnXr34J3alezFLKmACSCOTUJwKHYB4+?=
 =?us-ascii?Q?cuoOvtGbOwJUU/jDDt33F8UmlAR9KWt9IEdN80JRJ8k9jMRifIlIkzGQY5fl?=
 =?us-ascii?Q?kXdxdtsd5nPBnLIs9OW71I9Q5fXN9/hLVB3qd4Nu07s/5IcJiqMe1UR/esrH?=
 =?us-ascii?Q?iF5feVUIEx4YURFczgC2qurb5W3rdd2liHa0hruyce2CKEGnsm8FLyg2P1zn?=
 =?us-ascii?Q?2+ruEh1eLiQPLSCEKsP+o6lLu5ke2XJdM5Q22K0s/H3KAoD+6VK7/Fp0QAJI?=
 =?us-ascii?Q?Gvp+38VaWIKgAGimZep0f7eK07IgLfVo8WWgB2OCG7xxGiYm0j2etFECeBEM?=
 =?us-ascii?Q?BjDsfKNZxqUiClHlvrfxaiSQmvcM3EWsWzXV++lRNxxn1x9g7ci3pj831MVv?=
 =?us-ascii?Q?NEieitoniV3Wd5RzWjoppLKRy52UOseAQHgSWrpOoDfCNO5xB+vWK6Zg+i9l?=
 =?us-ascii?Q?Hxpn3dhY6yp7FworFTXSi5fUFJuZSrOZx4Hd3mJML1MQYlBjvQMKEtozlNvW?=
 =?us-ascii?Q?jx9aXDTKS8/nsKBMdU61hc0xXGCv9hPn3DIT92/cBLskKG0xJqODJjeD5N5l?=
 =?us-ascii?Q?EAZAmqOv0iReI4ONm2U1iMDLOpW4fcgT3ldYTO/DbfMWvEPTTwUqGiVG1fgJ?=
 =?us-ascii?Q?Es4BA+ekrp6xXEh4Sr+jr8QHkv8T6O4w12MzL2zT8mgTnApmjWWPBRdvpcEm?=
 =?us-ascii?Q?Hd9K6hoZfaU1R8/2QiraBZI22HhQklCxcWIynFU2VuyqHW7PWVxq0M3GeHLD?=
 =?us-ascii?Q?b80cImacyGPTZtqDhDJEt+A9R+C1XOprdfHXb5MqWcOBErbuGWBn+rKFuWCA?=
 =?us-ascii?Q?9yHZu94cDP3kB6mvbUHQXQleu8SHaKUx2c7tV4Soz0y/uI+0jc60rsQ5vIkp?=
 =?us-ascii?Q?RWUPTlGdz0uRaTJ1NDWPyZ/6r/6KaW9BjqKdJABP0jlPUBJOiSx3C7D1Z9jt?=
 =?us-ascii?Q?EmIc4fLXAU8VnpxAlXVyo/RK6KT6jE1RGhgRSPOeJGTm7nvnNeDeZUgHAqhy?=
 =?us-ascii?Q?7emZr9ZMzVia26VIFtD2XXshjHO2bzBJPtpTqJhtgC1lwdUGkYlzFxaFO/CN?=
 =?us-ascii?Q?vkYDbjsnGIp9CW07wT07qa6I40EGtOId6Gp9N3iv3cHq6UXu1+qU+GRIovIP?=
 =?us-ascii?Q?+1lkMov4qRknL53hyHJnkvvt7fPZITm3lE/HWojUNBpVdiXqnCvRWe7oZ/B+?=
 =?us-ascii?Q?RdeOXVyj4HD7ckG5bCEvopgACHsfPRHGCqkZAEjlFppsDezGR+zhnxqrzsgM?=
 =?us-ascii?Q?T8i7DsgU8/uXrzx0yCFZikrWDti+VXWXlAPgeT9QkokM9qLGhLuza1Plrj49?=
 =?us-ascii?Q?TKOtah1lvsyo8bt8WfsUAPbfuvwGjpiAxISdbG3Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb0c0b1-2ab9-4071-30ae-08dd153c237b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 14:50:19.3385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8tnFflaunO8LQyJig9/v8T5+R7R1C2ld/LUXWAGGCaoZPlrBoTwREwq39szba7U+ZI+Nw80/UQ2QhPrId/RcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
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

Hi Ramanaidu,

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Thursday, December 5, 2024 5:55 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_scaling_modes: Add informative
> messages for skipped scaling mode tests
>=20
> Add `igt_info` messages to provide more context when skipping outputs tha=
t do
> not support scaling mode. Include `igt_info` messages to indicate when in=
valid
> pipe/output combinations are skipped.
>=20
> V1: Fix alignment issues. (Pranay)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_scaling_modes.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c index
> 5fd34c4b2..e8aeb7409 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -117,8 +117,11 @@ static void test_scaling_mode(data_t *data, uint32_t
> flags)
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>  		igt_display_reset(display);
>=20
> -		if (!has_scaling_mode(output))
> +		if (!has_scaling_mode(output)) {
> +			igt_info("Output %s does not support scaling mode.\n",
> +				igt_output_name(output));

Alignment should match open parenthesis
i of igt should come below "

With this fixed, code LGTM.
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
>  			continue;
> +		}
>=20
>  		igt_output_set_pipe(output, pipe);
>  		if (!intel_pipe_output_combo_valid(display))
> --
> 2.43.0

