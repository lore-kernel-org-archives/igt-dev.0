Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E21D4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046D410E261;
	Mon, 19 Jan 2026 05:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4J/Y5aL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1B910E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768802165; x=1800338165;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WCp4yS4wM8wXLDdZzuoDK0uqEyulzCLNAQJ6JNhZF1g=;
 b=m4J/Y5aLsrjnTA1avG4DubsucxkVn5JqhMNLRjJjFd3LtbZXlwtwV4U1
 +yuujoQaiWbw+0kN8tQ6OkTPcqH6I6dfcHLusXKDAfYtEeC+BuQCcrLjd
 b+/KbdszWLKQ9xviAwmL6/JcQxkdh8LS9gFWcTEN7mUVOBntZnO3cU8yu
 pFTV8OHrl5vO9dj/9HYHNSNZ9dvxqP+DHQAjbo8bd+T+SRacesKlkERN6
 eKfsSdwnBYxAlvUMZ5La+T6HshVgry9ffhqpwUReY24dYc7O+YxQoph+U
 pwXg31m399qXfPbf8vSlNKIgYeJEFFy0rcfm32v2gEguLsNK1zRvLUt2m A==;
X-CSE-ConnectionGUID: HghJf1hQTNagFQvfq4Ql8A==
X-CSE-MsgGUID: stT5xX91TbWLGbILH2VjbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87586039"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="87586039"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:56:05 -0800
X-CSE-ConnectionGUID: lnG07SBMRjON97gsdBOjjw==
X-CSE-MsgGUID: aavnnrU9T7+QrIQgWZ4U5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="209919241"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:56:04 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 21:56:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 21:56:03 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:56:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7+reYMvHTzRiFph0PdHgywPynswO93PDgcqPpz11stfAYduNvN3iGsFqBnh117FYWGPdNPh6ZLnpLoQLA6rpHy/zOLlg4bSzAoVvb0j/WCc5MvfXqHPegxB7r55rPmYfaAx+R400FBQgE2g+/j4swt44OLMbkN5q+ZrIN+COyruaENnut/5qLG3WWCZixmXimLQy5MaI7iJYyeQpHBKvgCt7WY2v5xpAoV5/N1G/VkckuAcPMHXHCYqGZWkA/tXJWn7HdR8WPeHE9FYYdKSVlZf5TvKGoAfHAv+jb4xG6mo27NMz/0R9SGfUWk6xL3ecVocMII/1u3niHo2AOIV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZzoUrjTHHqWyzDrQoQHFrFxU4jysqwcM3dszYx/KVo=;
 b=M3U7/dTM1qpjqE9n6cPZkeejh5tE5Hber4FhV05fjDLcqWa+y4hgjrh6uqCPfei+bwh6KjcT22U6lspNYkEZFWV+4FIGWhB7M3tG6wbEENg8yvm3av8fyCFujVAipGqjvPw0WGkaAN6htka1eF7uZRGD0VgUspnIOQNV6AY0tn2Ph6muMt0WvMiOZ79T77GPx5ciVDsjUhmIL2Eb/v2sLc/JHMkjCGihvMhEZC5kTTDLBZw/4fO0yhd64txJs2YR9L+lkbcrqoabt4b+B6HMqTdEbYY2d9LOIPMZyEFV/aLNHEBF4jp8YBle9lAeLviIn6nuhJ++MxqCgQ4gPKj6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 05:55:58 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:55:58 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix CRTC conflicts in
 output selection
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix CRTC conflicts in
 output selection
Thread-Index: AQHchVLVZ4eC3zAQmkao/32o0w5T6bVZBYfg
Date: Mon, 19 Jan 2026 05:55:58 +0000
Message-ID: <DM4PR11MB6312567AD09622A8E71371F39088A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260114123426.14804-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260114123426.14804-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB6099:EE_
x-ms-office365-filtering-correlation-id: b3854c78-4794-4ebd-40fb-08de571f6aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RmNYzW6uxszcDO4x9Pexxf9bC7IJMRq+jfJ+mWfO2mxRkB16CgnJTsg7Ls8k?=
 =?us-ascii?Q?jgnjmssrdLxD/i/dFifsTiBVOER2KiXNhEufJLh3h6Oewy1vRw92rMfTPutn?=
 =?us-ascii?Q?CrsS+fcrCl9/PlDI0QJY36e/UMidpDNKMTbWaweduZmbLhm8pIC3psYZph2O?=
 =?us-ascii?Q?/jmFpUw50HLCWfZTjAvfKFspx7dqwtGBCBUqcyRWGUDzvCrE4HfqarHTz3E+?=
 =?us-ascii?Q?gk+MfHqE7Ao/DsjmI9fwCmkxIek2x7nfO+prUko+LSeeS8+7gcHMeDz/deE+?=
 =?us-ascii?Q?NOXmrUzUmd3KSq9/U6iEO9uMmLoygoguN+amz3kNHhNYVKCG2crybSFJJLtA?=
 =?us-ascii?Q?Aql4jcllwlDdiXcdkKexZ2+O/9XFWuDC0iTpNtyOJbqa6wkWnu/RsaO+kmeF?=
 =?us-ascii?Q?9XVkPeKicPfXsLZ/tmKN+xafy3mTUgzZ2NCfNf2qPqsAZugKl7SDlTUN5yqd?=
 =?us-ascii?Q?vGufMTTy4UvE6iO5EyicBpcrJpccldWUrwv/2LhrsLkHjUSxIqi0T5VmD3kl?=
 =?us-ascii?Q?Wf+5N5D/bab/JN7goO8/ZPDgTtDYYaBD4OFfQSbJafrW07+FECz4hdPjwg27?=
 =?us-ascii?Q?UyAoxiAPxKHc7H7S1uI5PFODHvyiMH27m6uuuu/QX7jIVktlrZTlYgYEUpnJ?=
 =?us-ascii?Q?KnwwM3C20XBK9IRhVPHWdQenMXDze18PvmciiwXAPh7VfUYohT11tm/XOC65?=
 =?us-ascii?Q?RAEqT6RRdrg58V6eQ8wNsjGDULjY0aMG2kRGjxBBXRi9J5pHWHW8p3IthCFt?=
 =?us-ascii?Q?vFiH+Vb3UKY2Un/fbwEohQyM9KxnABAc3wPfJ1V8o2rbLrTkUF6BlBTo04ph?=
 =?us-ascii?Q?cySTpr1J0noGBrFKW91NQsx4BHlUhAjeGb9oJQT7iZd9qCUOBomvbx3o8/At?=
 =?us-ascii?Q?RmnXal/QZsAn0SDF0myHVG6eNTFo9auYNvGcPQzMO81AyrT4C562B5LxpIQH?=
 =?us-ascii?Q?WxTz/gbTRbMo6ROqwqOd5XHZ2e9cfMacP9Fhw7oSbwklErdjPjOmGlIAiqJa?=
 =?us-ascii?Q?BSuJzqbs2z/ZdbNIepWBsbuDAtFh4bvlD2DYMKoR1qc3iRbjWd++Iq0qh4Ue?=
 =?us-ascii?Q?cmRJSCB4iz8/2uM2gfiswVaKlQ5PPIVVMeU6ir2Q/1faSVuKH5yoeI6eFqQ8?=
 =?us-ascii?Q?06lmYHJV0SETaoTr6BCmTfDJhsIpt3ZBQCzRm4hFiyNlEexQ3XCuxq/JolRX?=
 =?us-ascii?Q?nPz3yXDc8imPFclc2W0JZz+Cf44Hwef86kYNRoxpSt4sxnZM65rzUU0uqaQy?=
 =?us-ascii?Q?XWU8z+D+7OXozJbY0EJiaXwn6ESWwZ5YUjCEf9/3iBNb/eko52eLRHaleZzU?=
 =?us-ascii?Q?hsUjMRaRjF6K5Z8G17ZJzirtLYG0jbasOZP6H0MGlk1IwbrB7fudJrHN+4wL?=
 =?us-ascii?Q?op7jwV91rvIrxsGhTmXlqXnip2EJJPLnmMpdN89iDoCakZy46O5wl7AtCjrS?=
 =?us-ascii?Q?74yO53DdcaYCFo8Guhv5aL9LVM3IsgrIIxoZpUz/APgWQ9yg9fSLgq7QMH/S?=
 =?us-ascii?Q?kowBPFeZA/q9y0RdA1gIpjndk0GnRIuvF1K92VS0fiC+dSj9HhnxwAxE251O?=
 =?us-ascii?Q?GaNXsrFSB2WqsQfefdnr7aPFF7FYHHlQQ5lAyLWYnJQeN0FvIpOZcaMtqt5v?=
 =?us-ascii?Q?R1pXw2PIrS6hR2YzfyV9eLY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9dLpae+4ikFBW/qwTsqpw4Hduw1gJwoYrUas1tA1lRSIJOpXNa3mmDGbpCIM?=
 =?us-ascii?Q?9d0xHLuxdu6VRKOb+Or4bY+ayX7bd8nfKIYDEz3k/gx8L8zqKyF4YNkLyK8q?=
 =?us-ascii?Q?1WggoFB3Bs9SKunJe3TDfKfLeVfwR0uqL+VCZs1Q6zXjdTX+wCVY0f7W53rZ?=
 =?us-ascii?Q?E3zUnbn7s+xSYK1npGSEtr9gxSWTcd+eissm1WywDyUwUjMTB1gVRBGh1t5Q?=
 =?us-ascii?Q?iuPyhFZ2n6g0kpSuHwE0QCmp0uL5tc5Ne3MumCMcyHEPYEnGDa5mrOOOhVqN?=
 =?us-ascii?Q?VP1wsK072TzUSLYPi6SyEvcHfSlGYj0qsVP9vaa92uC485xPzNhHKjlUCruy?=
 =?us-ascii?Q?2/bFkEmn0XHohraPdmfuXTJge3mEwtWeAU44GJiLeq83fRaHYbxdFTOf+p70?=
 =?us-ascii?Q?D71tAQB2wZK6XNbA0yPzMLvQrDu6GmbWUIUmv1A5ox2MX0ef5zKqCf6dLP0i?=
 =?us-ascii?Q?+VGqx5ep4AWf+tyjn9GNlbABAh12FmWOO9VumTWkA5ccDSpeF7cuhSVYQ3dX?=
 =?us-ascii?Q?qBslu+6FTPo6WHVAX6oDfgb+PtL+0s1C6pqcCMz3c9n00Rr38RSLfT0WmxMp?=
 =?us-ascii?Q?yZapjr9vvu0eacTxZeU0zwuBKjZsRf5g2CMapGnPepiidiPMIa84AcqOtSjv?=
 =?us-ascii?Q?kFRvXSb0OpIS8+V4b/sWK8ZxTfYfjWUD/WbIjePh8yej26bx7/1dwRC7HvZ5?=
 =?us-ascii?Q?VwFcERuTo25x3STbKahCY/PaCpt2ud7AkqsJaTzzLTsUhH0X7fYHmsd9cBU0?=
 =?us-ascii?Q?lzIO9IiVgVnIiKY0/2xK1UIP2pU+sryw4iNAfVnn20e6pTYNmEGE+aeV37Gz?=
 =?us-ascii?Q?xVFYsCuknuN/tjYb78B0BzXYyOLiB59kUtsGgkOm5EIzOiFjAoHdPwO1ObJL?=
 =?us-ascii?Q?d5OwqgeChqRmmxStT2i16fDd64jVLovPLqZVcJos9hsiWtLLH6AIN9ynHoci?=
 =?us-ascii?Q?jJcRoq3N4jUzhwqtcoXhDC8mwpoIfAxiwuzuw8YzG27TLqOB8jvpyWt51tsu?=
 =?us-ascii?Q?ZAZaDSoj+oWuZhJDnVSWq0j/jsRpkCPFtvjxJKy5n+orMPlI/UsTI8skHzwd?=
 =?us-ascii?Q?GghcEiHfOA04lRNDbXOIzM9htpJTn6dQP3DWuvGnGZaHE2c5IxIPXqgK2Jhb?=
 =?us-ascii?Q?ZKG+otCk4J3Y6bgo9nzWdrWg8qGD9zmXyH1pvgrD+JXQA7MY7Jlwq/iN9IzS?=
 =?us-ascii?Q?rp1A8Q2i2xtWOeoPe9XG+F8K4Pd6+qIQkkYwtHrDeGnVS6NYTD1Hkwt15e11?=
 =?us-ascii?Q?YyRa4nN/BBIJyr5LEzCAvPQexCt78mxko297JxAcgcc1EjHEC8craEMkEC8Y?=
 =?us-ascii?Q?vQY2kxr+WG+VlvmllVBGMFlQ3MBwOdYboSt9X2Qe84rdyQu5OYj/W2WOSGSv?=
 =?us-ascii?Q?Rkz5C//J0JtsmLNqL91X7cE+GZ7z9GDZWmPupXWg7+B3om5l4AH8veI+dy98?=
 =?us-ascii?Q?0E8s5s9Qhq6VbFp4NZ1AnsTTldyVVEPRAaCZEkSn5vvtFgLtSiIWuKboqNwq?=
 =?us-ascii?Q?LhSzXaHfy8GQdhE0Bo+9MRoE0RlZTz1maz/fkL336Jdm1BG71FC76IP2rZmL?=
 =?us-ascii?Q?OPLYhFXHS25ceCnA5V6Qf5n2zOhsAqFPO74fYaQlO5iGuKF8V1vTXbyi19Dh?=
 =?us-ascii?Q?Jjyz5xkA/4Vl2SPpJmnaqNmkw/Xrx1LoaTdc+uJZZyhC4yhwPX8PPVsWfjRe?=
 =?us-ascii?Q?zjPCc8/rkpW/O6pfuRWCumWjZN+oE6dvJEsd+mc2njJitBsw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3854c78-4794-4ebd-40fb-08de571f6aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:55:58.0308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5LdhL1T8NEEsutEVefQP6hNhH1A3g707Z2eMzS7om8S94uEqUEag2pBLCeySUeMCrEGmTlrO+2ulxhhVqTTPEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Wednesday, January 14, 2026 6:04 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix CRTC conflicts in outp=
ut
> selection
>=20
> Reset CRTC state for unselected outputs to prevent assignment conflicts.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
> d7d0989b9..20c81ca3c 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1639,6 +1639,8 @@ static void set_prefered_mode(void)
>  			mode_found =3D true;
>  			break;
>  		}
> +
Extra line not necessary I think.
Are we closing/fixing any bug, if so can we add fixes/closes tag.=20

Thanks=20
Jeevan B =20
> +		igt_output_set_crtc(output, NULL);
>  	}
>=20
>  	igt_require_f(mode_found, "Not found any 8K@60Hz or 4k@144hz mode
> on any connected output\n");
> --
> 2.25.1

