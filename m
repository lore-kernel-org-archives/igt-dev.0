Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E789ED6D25E
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 04:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BCB10EC1A;
	Thu, 28 Nov 2024 04:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fuv3F0PJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E977110EC1A
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 04:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732767759; x=1764303759;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GAeEUKr/POaM2lHRDpHbiFhIiaRM77xwL7/jS+lWIVE=;
 b=Fuv3F0PJqECcwWxNRrVqdXxvfodMBe4or+jPYxAbQHgb++sCAxUbWRZ6
 eqcvqjGwPRh2V8Y8+WMwdGdqrjRO92Xrg5VOxomRswtNs/oVi11/UXPyH
 pk4YcQwmUqQaRMCRpfS3LbrdNdhOLSl6yvHtVwpyhxjIP3L3XvVmzIgBT
 OqQBt/3tE4DCIzsw/cksebi9VdZmqy879u3arsfFlN7d358N2vDhZHRVw
 1ruCDHHvENqENPPuF/iWXmNVFU2raNu1unuu8TOB6d/u5GGZMJT/c3PTr
 ua/pB4ogWBzUnOQgaSvPYz35e+ZWjzj+unuVUHfMR5vFGNlX6R5lc0wPc Q==;
X-CSE-ConnectionGUID: GOzQ6g7wT/yXa0pQavrp/g==
X-CSE-MsgGUID: s14gUb1GR7WITAMUKnywpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32924005"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="32924005"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 20:22:38 -0800
X-CSE-ConnectionGUID: xWVWSCE9QRyp87d4lO+DQQ==
X-CSE-MsgGUID: fWtk+BaUS8qJ9Bc/WxYtPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="91737170"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2024 20:22:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 27 Nov 2024 20:22:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 27 Nov 2024 20:22:37 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 27 Nov 2024 20:22:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iz2STGaMvr3dJ7tJiI3F9c59SBRR6znEGKP/5ymGF3zjPxe7B6caFS4Y510Q+k2dpo1ktqOiEbsJ013YP/dcH5yLIIJYMLPO+C0VKigwZ7Vq50uzb/HbksnJkNW0mU94eGxO1n6bg3w1Q1ix00cOxvGqpWpDdpkq7KCVJeFA9gXMmCYJu4HvW2xW7c+gBcvqovh8WeixWxeM2C3WeoH7a6XGpW2RuvaOrrTaciZhJKvCZvC2vHqoqXRSxDtbFSBoYElZjSoe/TAPbLRM+ky9yuWtc/ufSmkjGNB4XqmQGpFUrbNv2QWEbFgTy86K8BCZXK1sB1Z8Hf6VsvGLoIZjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0UZQQJDfGZezyuyJt92yVGBgJuTaxArV1g2nqa1wk4=;
 b=fyVmGXzKiP9ZH19bwpHl1OFxaLgzuj1T+gE3PwRQ12VwbSU2BOnj+pqH4q0tIwJEXln/1cxGiVm2Y7ViDy59pb5fhSYHmbzj2IPqA6WdQrp9beDBL37/0DG8sNxhFhTdV6J8umZtQzVmWr7oM9uAIReUT1c8biNORukCgvlZ0FmThppvp4s8hZk7zz+wXwzZ3uwOBj23IgRo5xJBfs05l2fRE0LK1h2w03+1+P6jOhhAtX08yY1si1JGJG3DH350TPn1O+9qGjPNILYP2tb9XBkqFR4WWfwbe6zyqEGR94a3lV0MWwVJ/ryd6V7VkXpLADNzO/pFpbjzpDEUu/3wYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 04:22:34 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 04:22:34 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_scaling_modes: Add informative
 messages for skipped scaling mode tests
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_scaling_modes: Add informative
 messages for skipped scaling mode tests
Thread-Index: AQHbQP+NOklvDaV95Uu1pJv/ap11hLLMF1dA
Date: Thu, 28 Nov 2024 04:22:34 +0000
Message-ID: <PH7PR11MB605330573318CF37586A8C3AE7292@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20241127190530.3421021-1-ramanaidu.naladala@intel.com>
 <20241127190530.3421021-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20241127190530.3421021-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB5277:EE_
x-ms-office365-filtering-correlation-id: d32dcff0-16e0-43f2-3c11-08dd0f64488f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S7BudrTUbbKazZ8zF/oYqOdsBnfc/eOfTW0yJtMRoU605DZvuxT5O28efLGo?=
 =?us-ascii?Q?7ru97unuSCqY2wgIe82aTFw0D2Qua1nsoBcqPNIQjDKs3efrW0qpjsFPqXw9?=
 =?us-ascii?Q?PIfvB7qN/N81pIZ1j0/N2hD1WeAXAVXswL+2fDlNb0qI4bRQG0eEb6+NUy7d?=
 =?us-ascii?Q?juajhIPTppn9XXFiEgvwIQMn1myifPGWhu5T5bcYzjIyvwbQc6pjvp6GfuQT?=
 =?us-ascii?Q?lvEk8S7Mr6D4nhMlCC5SAT7lshuh42az6ues/m0w2miv66Ph5hSizJdYgGN6?=
 =?us-ascii?Q?FYwn1SYsHrcS23lhMNhuAqCM7mtDuiT+6M9rFYRntJf81jGD5dnKuKTmoO15?=
 =?us-ascii?Q?eMEgCA1IJS/Hr4cAMOgS15PJqom/Yop0tI9rGFNOtG1ysrwOXru0B5BsJdn4?=
 =?us-ascii?Q?51Vz7Y3jpFLkWbIU1uHV3bc8PUmXUiizS2fscVJtzZiVkvvOFpubJB5ydI25?=
 =?us-ascii?Q?7WUQrXWNGL9maFRRGo7GJLMhDfCIVPDYKC6cxJO7M7JoNxpBL9OIUWvWRUVd?=
 =?us-ascii?Q?7Bw4NVwg6ZCq7HXsy/mFlde6/6pZpmlwW7PH8+0YpdYvFZ5ZJKC8HhXSXEUx?=
 =?us-ascii?Q?7nhG0/Wg/6aXO0KdZbSFbg+4ed3IK/WSrEyDopU1jad+2DvB3ZVdyQ8orLgR?=
 =?us-ascii?Q?aWJJhfzNDPli11lxaGy5kKciLpun1FWzcWx8W+EgA/v9kyNri9kRMXKrhJqt?=
 =?us-ascii?Q?BJHqD2P8tPgTYTAt5Y+1iwe2v6KMpGwcUwz4iQveBIGCreNygOZU9dy9DPVz?=
 =?us-ascii?Q?7SJEtgE57f9dewbSALvgQZvJS9Gb4AGMZft3/O7z3WykTIAMRVv8RUWBhYvM?=
 =?us-ascii?Q?hpLUWbd951wqgwx2FgLwmfNgpv6oksSSBbOCVfpkaVOF85JjCV+FjycsRRlw?=
 =?us-ascii?Q?LYsB4jXZUQPBjlfDqdFub3ZJkzYWONOt0G+iO+rcFJKxib9UfDZMosmknZ8/?=
 =?us-ascii?Q?S93Eoun9y9Zw3eqdSwjzug1qcrh1bsysbUORmlsn1I7IZz5eGw05y1rKZ/xt?=
 =?us-ascii?Q?4oUGepGGXTCSDpIap/WBFAnCSqRTLm8lF46McX3vDSNNyZ+Mi49Wk5RiiWgX?=
 =?us-ascii?Q?V+X3t2/VN7/7s/xKdnjxcaYiWsL6/FdCRzZqMRfZ1AShdKrRLJ+KEPOzBt+z?=
 =?us-ascii?Q?pkWxn+s5w6Wei7N7WtIvavxXeND2nA3lUAdFSPmNDgtw8q1jQQCl/dvqGb2j?=
 =?us-ascii?Q?1FFjnQ1NZw8DqNFnNGxis+nsc9oq8+75JAlf2uB15VlNDYYmpeCmwIYJyIRJ?=
 =?us-ascii?Q?+rwMeGQq/vHd7a+fwiVagg6xujkOAYfPTYZTSZIbOZbeIo542ymZRcShYfbT?=
 =?us-ascii?Q?zx/pkSWrGlKq29uD2QAdzuVlw1JyFoK5QpOekp4NMOIhUxJBC5uNLm8YWSx9?=
 =?us-ascii?Q?i0iFCAUjGSXN5OGksw6jkyBkGbCKXJ2ALqnFWnsIgZ5lBIVKdA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tJWynBezzzIzIBRtVC+bOp2JRmkFrnYrNBtrg0OClBaOdRmCSb9/2kcrtEc2?=
 =?us-ascii?Q?fzDDZt7kBA2Xb98c5V4cAs2sXTRkqs25NLeXJIv9B9bwDzb5pM9PZbdoqDFd?=
 =?us-ascii?Q?4vplroW8RQXgBjdkGmoEMYzLtHA/WRYUW+ZLZWq6ZaTxcDZ7mF+wj/WQxA8G?=
 =?us-ascii?Q?HrmEW5GlvW3Df1j+4siJe3kmDOWCjpfJB478rfLrBLgVRb9Y5LUDZFUfwkzG?=
 =?us-ascii?Q?Ef/Ty+wIfFkcvzpWVTyRzQCLARXijioykCfSfetae6knXiy/9NYI98GoVxMo?=
 =?us-ascii?Q?w0JeJ69s6BESdO06mKr36vIFYZIq1Isfw3Dc1X/1bFVNkYbAf/gWM+dHIzxw?=
 =?us-ascii?Q?9OyAbW5/T3D3k2RNyooO9iqkEcK+a3ny3g4qw48ksNUNsLroK9dQpCUvAZwa?=
 =?us-ascii?Q?mtX5fSyzGyrVHrpupsm248SKT6ic0SPe+Ckr0zaIZJkVCRwUf61LLLeLREok?=
 =?us-ascii?Q?iq25I+4EoN+O9Dj91fSuD63uxWzvTS1lyn4C/Tt4Iq6TWPMPVFZiK/o5UTQh?=
 =?us-ascii?Q?3imOzi/+FV7LrS2p6en7+aIffonvDAJLn9HN+e0shOIJZeKN1UNmA6v0k1gg?=
 =?us-ascii?Q?/t+dUtuoThFYpObNNk3x7YMtWjkxHNkGUyCsL3MiGfqlMSUvbqbSaOcgvj0x?=
 =?us-ascii?Q?AAdzJOc1rdfgu7/5bY9Dt2Rm3gv/h5hG/lfJ0XhfB32QNDA5aaWEjIH90/xd?=
 =?us-ascii?Q?cc4z9wF0dNmSiyyZuiO/DeD6CP2C6SUTw8jRSuZC+tNcfPnii9UKBLYKpAXO?=
 =?us-ascii?Q?yNCurqcnBCwvmBCiGGPk/X/k6vnxcdYR89pz3D5M8uH9kTaOZVRcn2yUd23Z?=
 =?us-ascii?Q?e2CaqqoPcBxZAtAxQPEBPN6MtIJ6gaBLOIKbk0PWK9BYz3D9BTkeh7/uGKzU?=
 =?us-ascii?Q?SoPGzoozlfVlAV4QBxAuphi0kwkkhRiwQ2K4/Pj7zQoa+8jpL0NIChRHgSXX?=
 =?us-ascii?Q?6mA4vDqtFW3+ZJ0VF3BLtjiL1lW595mRCdJUpwSg+GfrggS97U0E3eXiK8nD?=
 =?us-ascii?Q?8x4JkiCLV6kNp+FYLXoaNrEcNsjby1EFpyaopnjAoYKVn0Wst3DAD5oY79ra?=
 =?us-ascii?Q?cI6+4HZIp8zmmSR0AZQMx7/ALKfQ4w4CVl+/crc3JIcGjDDNKhFslij7o1av?=
 =?us-ascii?Q?nenamXRls08zHkHD/qXvwc4lfIh+s5MQzfMXBs8ZPWxm3e5BR2+Pws/5u0Mn?=
 =?us-ascii?Q?0UyIAqJKwH5V67dbGvKOMc4Rzu5hDxNDoqQoepYiWR8dwt1adDnxIBI73SLZ?=
 =?us-ascii?Q?+AcidHQ1rQPB5i/D5j2efqEL6LAEQC5pdJGe/iRI/aimAR96c2giQIigVzmz?=
 =?us-ascii?Q?XccO34u1meuhr3KJ/zFzebOXOYChUQ0VLxxSkp5Twg7E7bA4/skop85Z4xPU?=
 =?us-ascii?Q?tSB1BZbLy8pS7ZzzlWXxwR/nwN69UJUbB2rCV6BHTxXSWpf5oMJkEbTg8Aql?=
 =?us-ascii?Q?tRn/akYIQfS3I6+3BtfIbWjF35F8tJxOBJlShclHkslAm66R31B2GTzkFovZ?=
 =?us-ascii?Q?7bnNKYVjf0x3BTNHzfXknzaI5iiGJR5LWJXExqpChs2caEGFaA3z8H8+QpCW?=
 =?us-ascii?Q?eQ+a5JnKat3qUS9i1ZdTMLMRvB+rdi+onnaD0hX0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32dcff0-16e0-43f2-3c11-08dd0f64488f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 04:22:34.4350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThN07M/3R52FxEIq9hVMbsAcljXdVzWV8KfnpH2Wvny3vIm+5iP+t/8vDdOtt6oG+2LAueLlHdmvurqL3nsEtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
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

Hi Rama,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nalada=
la
> Ramanaidu
> Sent: Thursday, November 28, 2024 12:35 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/kms_scaling_modes: Add informative messa=
ges
> for skipped scaling mode tests
>=20
> Add `igt_info` messages to provide more context when skipping outputs tha=
t do
> not support scaling mode. Include `igt_info` messages to indicate when in=
valid
> pipe/output combinations are skipped.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_scaling_modes.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c index
> 5fd34c4b2..dd2c6426c 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -117,12 +117,17 @@ static void test_scaling_mode(data_t *data, uint32_=
t
> flags)
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>  		igt_display_reset(display);
>=20
> -		if (!has_scaling_mode(output))
> +		if (!has_scaling_mode(output)) {
> +			igt_info("Output %s does not support scaling mode.\n",
> +				  igt_output_name(output));
Alignment should match open parenthesis

>  			continue;
> +		}
>=20
>  		igt_output_set_pipe(output, pipe);
> -		if (!intel_pipe_output_combo_valid(display))
> +		if (!intel_pipe_output_combo_valid(display)) {
> +			igt_info("Skipping invalid pipe/output combination.\n");
Is this really needed, Skip statement in intel_pipe_output_combo_valid()=20
is self-explanatory.

>  			continue;
> +		}
>=20
>  		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> igt_output_name(output))
>  			test_scaling_mode_on_output(display, pipe, output,
> flags);
> --
> 2.43.0

