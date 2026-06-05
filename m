Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511D0CD6E6B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 07:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7C011A50D;
	Fri,  5 Jun 2026 07:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6b5px/3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7194F11A50C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 07:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780645303; x=1812181303;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=ejv3qLRyhQ1RvrG3AXUjF2A/VEfv86fooCoeqQsghbI=;
 b=Y6b5px/3h0Rnu+AqUv3MeWtLalJo6dskMSpuVzCNdXY6+KHEdGXLYv78
 noh6c55664XD/uc7qQYaLATP7o1ADUyrp+2tv72BMT45KQzJKWCG+gcyQ
 xnSdpYfNz2t/lxRzQjsVEsgeU7LrFElfoRsk6Uo+pnLnGoSYg6GWwtMrc
 bP8zqUzs/VH346L8VMNgI+BboJpk0WGV9FmklHf869rTL5hgeWeNnpPhV
 U0PELqtCEKntLuyQiq38PQ1jef6dNXtUHN6sLnqGSB4ZCF75GhJw2LBBw
 5zZ+1rtwIgKvhoX3IoTHAbhSXbTW9AwrQwIA8dnpneGT3Z4t/1KkvIlwb w==;
X-CSE-ConnectionGUID: PVkdoJWcRByx8WhcwpnGEQ==
X-CSE-MsgGUID: gkH7Y8w9QkOh2f3JPWBHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80615820"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208,217";a="80615820"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 00:41:43 -0700
X-CSE-ConnectionGUID: AEWOMzCUSbyoH5h/5F7tMQ==
X-CSE-MsgGUID: wo1g+Ew9TBKPtS5/jm5/Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
 d="scan'208,217";a="240589323"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 00:41:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 00:41:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 00:41:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 00:41:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk5VgVvKKysizfJsWYS+fAcmqg9wYGmh26NdLAMhmZbA4ihjmLX6j4Nq5+f5T/qCl/Lg+x+CMdiFtiOzXdBBW6jlmpqjhGcaHHYgXn9kLP9wYZnE9pA+L6zCnaySXI20yx9aE4teltp68YpYPDReybVOh+k24mE1iisqbfLGnQ3yC/1V7jrQYrefq7oPih0OmgXhSpHNPdrfpwhJv7tVX/obCSI8hcPwyCH3YM7AhxvFW41nPQmWmVugzNWEumMd9rQUEtBeo3BiFQi7XshxMbrmBfHJKOFtlbKaF6CVgLfEOCyqGDBSJqqYyjigOdwqEFYVktRgm6JaqoNJYjbDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7EdCIHRBzIrF2uRbLSyHNAFCmqkAhnbySOEtMG6rek=;
 b=WYutMTDON0ddqR2WTI3xlPeEnQm6dA53ou9qVpqeMikCW/LYDeH8VJIVeZ2MdG76TaTFr17Nz9rwnqKUiRPEz9Ti8xFPJVD+20piHPDMtXznxhm1M6Fc8AesBPrnahiljewp6MtfKPwmUP4YaBtaySwXs3HsAgxxMYq0lakIjeZgdU8Dq+J5CEMry3deEge37Djc5fvt8ab/wDlfLdUzKzg8KkutpJhXe4Yh9rulT/j8hXsosE6QfX6wh4VU4k4D9ylu5WkhWyCmdqCrbUSMXYkWKzQ/5N2l7asfHwBK9RKBkgGo0U23EmyyF9KbVd6UpJymBjfcEy9ldSmPa5r0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 07:41:33 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 07:41:33 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert
Thread-Topic: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert
Thread-Index: AQHc82Z2+U/ZVg63okSe5SPxyfB9M7Yvlosv
Date: Fri, 5 Jun 2026 07:41:33 +0000
Message-ID: <CH3PR11MB8434D38CAD7625BC359E80748D112@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260603143628.3739477-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260603143628.3739477-1-jonathan.cavitt@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB7732:EE_
x-ms-office365-filtering-correlation-id: a1282911-a8b8-4d71-cef4-08dec2d5dd6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|38070700021|18002099003|22082099003|11063799006|56012099006;
x-microsoft-antispam-message-info: BztGmV1s34D71IZWQt9UNSFj/Nd6hLdtPJSazIl1IXVrvGpaAtcH9n8XxpdGIbobEJrDapNPkcQryGAELBv5SigdBDvrqZjnA294m7nLMM/g7bgXVJo3QbrcGIfX3ezKGBWdt//g1igV0y6q3phJFNltc2CMq6v15ZozuFFJBDPTlDrntG6bFjdn44t1Wxy5hAkKk5Rtx4EPNnrNgbJOEQpTBH9QiuCsnciGRNyKYakpMleSb9uIWlQ3NAi/D4O5+uHfAaMOCXt616PG7BnNdf+qUauZcuZM0F0V1DmJ0EMjpIuXSt+ij0jhsReMq5kbV45o6XUfeKih8WeLpm9QvplJlxaAORx6YMbPoMblLyT+PZLo/EwiuDgtjMZw9SVH/cGDty/UJc2FrWgnvpBTKemK20KmLvJoyoIJYkfvw4TlFGClZYputBiE+STWVRkegW3rEwclVQvLXriQW2/PkSbRXWG6pAkt8ua284+8n5/j0EKBRkSri4StpQLm9P2Eck/wtksggqwrsX+3TYwV+gcc4lG2hnpW2xb9cyyD+FswTRJ3yULlhJ+kNb6R5HNoTNEXhS7+7GEO3I2Y9nGeyQTXtz9uvSMWWcDaoCfCNcUomdd3RUecIDOn9KA2CaNxBHcD5CHmEaWwAFokrX7JocvoZDTycDc5JgA/DVMpmR+L0YOGQmzwcI0hvsT4yDdmFGPAexo/rLlfk0BWwFo1MGpb1MyGih9p9CLaFnla48ytUQYn8K499sZLrJ2fcazI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gWeR7jTuQUMB1evHlcE84KD6M7hEcd/lIir+PSJMia8ikGRwGwoeWuN3b7?=
 =?iso-8859-1?Q?YCkAeV6xNi1t9sJM0g+mo+JhaCGXiCL4/lJo1bWgK8uGtP0yuJ9QlBJPhL?=
 =?iso-8859-1?Q?HqzlCUvHGRe3dzzfMO1gAVuOdoBr3iKSSKKdfb+kfPZNrvwT/wiF2PO1pj?=
 =?iso-8859-1?Q?CGNoGkKD/9lV8j6jxhKralP45y4WdyvF/27PpxncfhL47CMFTc+ldmCo5A?=
 =?iso-8859-1?Q?qiOzE75rTklS2GlD8D3Gg6Wormm7aKj7vdKj7Mg6TstVgV/zzRLJj3Q/C9?=
 =?iso-8859-1?Q?3XeW+/6FBG1cRSd/7P76mS0MmjX25RVeI5MwP4fgZ41bPUmnWF0eT1adLb?=
 =?iso-8859-1?Q?e0v+jZP5adFbQYXMC8khS61glPqTZPj14TJD4ZavHTKa/sYOPnR1eiQ2i6?=
 =?iso-8859-1?Q?6G3pxQWumd6Ox3LHfT6kyPdGH7PcFAB08iqS4Ay62MftxPSsIorZxJSWeG?=
 =?iso-8859-1?Q?IMVmjJuGBJyPc2002XUKHTbkHC1NrLN0M2wJEblZovtJBhLj5o3pFXxrli?=
 =?iso-8859-1?Q?GSwQrQg59gGZI1dx1gmJA2PIU6XjlL2s0lPOfJaMn9+g/xg6WuClfjwkHP?=
 =?iso-8859-1?Q?I97ZmHjb7WpegoMc1pYXl5kSthmThfWcXsgvyAyfI3zURI1mJKFWHni9v4?=
 =?iso-8859-1?Q?t015SlXMad4cY781Yq6JmiIAiEMbYWSs3X7ksGBXyCiwYkZAzoAbgImCIt?=
 =?iso-8859-1?Q?AZ4Qaz9J3FFZ54/d2Y1i7DWBMWmpWVqYpgMqNJFU41ObDuZPoO0yUrhDpK?=
 =?iso-8859-1?Q?IVENZqkw3BkJ8T/DALQP1SjZ/4lnbxn5WyaJ1QZK8ygUbEQ7cGEUpTwBU6?=
 =?iso-8859-1?Q?qIg5oDx6WfuKKABTIrPFAJZsU0GBlKV/13zPqO1C2Ycab+HrFwvm8HWxFg?=
 =?iso-8859-1?Q?W6ezBswcmRIBO6STn6oGFq80bVXe8+eZt+0v8JXauoIt3H7FVH2Nj9nzHA?=
 =?iso-8859-1?Q?Dgwoy/KAXgBnIb8a/KWu5fbHS36R9pZmSpWMXiqr4dH4XOKzU07FQsoAss?=
 =?iso-8859-1?Q?3pS6z7vqDSJIr6RSbBO+dnFiLTORuP8etHJda6nCMF6/zFdvJHf4giobGS?=
 =?iso-8859-1?Q?ilUda72mYMYfTGXAQ3Zw17wbMZw9lP14BKMjk/jUEq3tYFDPYge156gOdr?=
 =?iso-8859-1?Q?579UAXpVpX48RSIzI1ZAyRQhuoyxaXjRfuW4c7GmmRX+sN29rxjBzNuYj2?=
 =?iso-8859-1?Q?6ACW2e8nryWveTNAs4WGwlGgbinNcra+37wIyda9P+0Ps67NKjO4Y8zWtj?=
 =?iso-8859-1?Q?Q/vf6F2JGT6l6+5kUa865Rwlvd1qrX+tEeGTVaPTfXYNn8Cdbwh2RSkZT0?=
 =?iso-8859-1?Q?RNYYKlu/PkJcNbmQVmMcW+QMH6eFOm808/Ruyp7mRM4Xn9n29uTJY+7gep?=
 =?iso-8859-1?Q?YdhcYR6ZzdB3NptaYCApWwpEUPZ6Ylo71FWM+N7mp7bdAc8W+JpQJHK1Xd?=
 =?iso-8859-1?Q?ovL1pAA4ibY57N2bJjufBCZpjbAdVg/V5ECKUWrpgel3mPF3mX90xhuRs8?=
 =?iso-8859-1?Q?26CGQIuJIplTqNMdb/1Og0H5se+Fmwif1lJco05FMA+sJDsdKbGEQUJjYa?=
 =?iso-8859-1?Q?le5S6BR690IYx7YTOha/BtyDFQnHA7HWZcF9gI30ODko7e0lMrek5hp3WQ?=
 =?iso-8859-1?Q?wsuFwmiy414V/QKNATYF6SLT1WCBBCCKfiy10ZUpuFwtawctLSa9upkbiX?=
 =?iso-8859-1?Q?EFvXBH1AQ7YmnKdtzyhDbOr3LLM/KAhwjwcC4h4mLk/HT41nDAwDTNCYna?=
 =?iso-8859-1?Q?OGzKhwyuWqSqp8tX3ehAP6zGBhjUcXjuULuLkoPTa4Li7nTwkldtUR2hHC?=
 =?iso-8859-1?Q?8imx3A0dWw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH3PR11MB8434D38CAD7625BC359E80748D112CH3PR11MB8434namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aMoN4kqCHByFXWA9wMwpGGRYtHwELEwCeOjQ6jmeDjm8bW7bHkEsvLVw3dF8lggGY7KSlNVkwIf4CfrW5rpJMwycCvlWaPrrnLrEvPVjcH8d21yMaPdX2XpIVJ3NdbRCiLq6V9bKJlhhfo/sjIxh8c2ljvhIXSyxmF1QG+MX4hCQnIDWmeuyC5Q9zADQ3U8xa4xtOWpbG0AgYnq9KMGUaCj8nfx/Kp9xO5qmVWV2XlkCgwaXVjGRC0qRO/AUbkR2SFRjUQBjLZ4zrXaFkEYzr5GOnddqueUnqtXaP3i5iYsvU1QxV5CBueFSuL0HBhcFVooQnAHn/po412gqpGo7yA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1282911-a8b8-4d71-cef4-08dec2d5dd6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 07:41:33.1827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwJ7uV273SnqPrB/AuXhX3WQJs+g45rDySO2pjE/PA2xCH59uR4XRTU/VQTIJBc2BzZU3Atr4soHI4b0m9KhWNWNWfgKrzFF49YUVb1iG64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
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

--_000_CH3PR11MB8434D38CAD7625BC359E80748D112CH3PR11MB8434namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> on behalf of Jonathan=
 Cavitt <jonathan.cavitt@intel.com>
Sent: Wednesday, June 03, 2026 20:06
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, Saurabhg <saurabhg=
.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Brost, Matthew <matthew.=
brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MBZ assert

In xe_vm_fault, the reserved fields must be zero.  This is not asserted
test-side, however, so add the missing assertions.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 408bfdb718..386a0981aa 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -3060,6 +3060,8 @@ static void get_property_exercise(int fd, uint32_t vm=
)
                 igt_assert_eq(f.address, f0.address);
                 igt_assert_eq(f.access_type, f0.access_type);
                 igt_assert_eq(f.fault_type, f0.fault_type);
+               igt_assert_eq(f.reserved[0] | f.reserved[1] |
+                             f.reserved[2] | f.reserved[3], 0);
         }
         free(faults);
 }
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
--
2.53.0


--_000_CH3PR11MB8434D38CAD7625BC359E80748D112CH3PR11MB8434namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;igt-dev &lt;igt-dev-bounces@lists.freedesktop.org&gt; on =
behalf of Jonathan Cavitt &lt;jonathan.cavitt@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, June 03, 2026 20:06<br>
<b>To:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;<br>
<b>Cc:</b>&nbsp;Cavitt, Jonathan &lt;jonathan.cavitt@intel.com&gt;; Gupta, =
Saurabhg &lt;saurabhg.gupta@intel.com&gt;; Zuo, Alex &lt;alex.zuo@intel.com=
&gt;; Brost, Matthew &lt;matthew.brost@intel.com&gt;<br>
<b>Subject:</b>&nbsp;[PATCH i-g-t] tests/intel/xe_vm: Add fault reserved MB=
Z assert </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">In xe_vm_fault, the reserved fields must be=
 zero.&nbsp; This is not asserted<br>
test-side, however, so add the missing assertions.<br>
<br>
Signed-off-by: Jonathan Cavitt &lt;jonathan.cavitt@intel.com&gt;<br>
Cc: Matthew Brost &lt;matthew.brost@intel.com&gt;<br>
---<br>
&nbsp;tests/intel/xe_vm.c | 2 ++<br>
&nbsp;1 file changed, 2 insertions(+)<br>
<br>
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c<br>
index 408bfdb718..386a0981aa 100644<br>
--- a/tests/intel/xe_vm.c<br>
+++ b/tests/intel/xe_vm.c<br>
@@ -3060,6 +3060,8 @@ static void get_property_exercise(int fd, uint32_t vm=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(f.address, f0.address);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(f.access_type, f0.access_type);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(f.fault_type, f0.fault_type);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_eq(f.reserved[0] | f.reserved[1] |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; f.reserved[2] | f.reserved[3], 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(faults);<br>
&nbsp;}</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">LGTM,</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Reviewed-by: Priya=
nka Dandamudi &lt;priyanka.dandamudi@intel.com&gt;<br>
--<br>
2.53.0<br>
<br>
</div>
</body>
</html>

--_000_CH3PR11MB8434D38CAD7625BC359E80748D112CH3PR11MB8434namp_--
