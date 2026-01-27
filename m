Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF2D2594B
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 07:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB06910E149;
	Tue, 27 Jan 2026 07:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t1fM2DOW";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010063.outbound.protection.outlook.com
 [40.93.198.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9D310E149
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 07:18:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bISOyRnzWZ6XjbyJbFU7+QRzf8Pi8Sc3B8mwTAICp8s0tyc6yGhg1mvVJcPEiSR4QKKWEMqGY+bMpvK+QeN/HAPeZZyUvPM9CKDuGPf+NPefJd7tAORxgpIFrDLL2zmXW7p8b6pzcepLqom6xWCl79DqmVl7R49UVsDeKnqswFVQ3CJgKMjuFRsWcbcoQO+tkSMbBFdJuUWaaBV+BSNLWdib4HKfKnbTRsaQlTfoBNDrJRlNXCju0QNaOiirANnjLUTxb7RwTl2JFVEw9NIgGCjS5C3rOTCU9Px+NY/xdUJdtYl1FXCcF7FSAEQsU8vVppTnuEjMezEer73wrbTDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISNZTtIRJXnnieJUuyyXJDnC+Z1L7ezahi8ZX3e5kkY=;
 b=XOKqzIc64CDHV3l+s/o/9AhG/5PFSMIc177mG3vqe5pj2zLjenF414vrwGZQz7EBKTeTmED99X/1t/tu6FG1avsUkDargdXVFCrX+AkC8aTaHIF4xthEnKMj75yzKY311/bm9FVnXHlMrlMgYM5qjCjaXUADDb/RrVjV6y/OYx/5XvKJocYFPBpYWmVHO2QeEuSH4qFrjou9OFaOeMA/QWrdDyJGWfcZH41yCIA9IRuIxeqUiRv+VUR1ory4udJp3FiF6JnYb96BABBlANmNagI1zcjcC4sBV5a2140IDnPs0Vt0gzRa6qFNtk0daee0+1dNeeqx39iTXSxfn/5oBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISNZTtIRJXnnieJUuyyXJDnC+Z1L7ezahi8ZX3e5kkY=;
 b=t1fM2DOWt5LUnKOBxXlL2qSB9Zyt3k0sYUdjgUipDeUpQY3ZDQbjBJoodc3DxnhpNx/it0cGyPYMtCQZslM4ehtdUSai6C/++HHe88Acri9mNK0Qy/NX55IwVKFBrcD895aWqRJWkVA8YfMCemhcXxRBJO+YzC2JuINTDQHHrb4=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 07:18:17 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::833a:459:cc0a:fd2f]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::833a:459:cc0a:fd2f%3]) with mapi id 15.20.9542.008; Tue, 27 Jan 2026
 07:18:17 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "Hung, Alex" <Alex.Hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/kms_hdr: Fix typo ST2048 to ST2084
Thread-Topic: [PATCH] tests/kms_hdr: Fix typo ST2048 to ST2084
Thread-Index: AQHcjxTIHGZLet6N6EyOUgrClj0j2rVlm4Vn
Date: Tue, 27 Jan 2026 07:18:16 +0000
Message-ID: <CO6PR12MB5489B9CB1C345EABF0842920FC90A@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20260126224011.557616-1-alex.hung@amd.com>
In-Reply-To: <20260126224011.557616-1-alex.hung@amd.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-27T07:15:03.272Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=1;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|CY8PR12MB7684:EE_
x-ms-office365-filtering-correlation-id: 2a0d94aa-80f6-4fcd-c6d6-08de5d743de5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?IOdeU5SHY4njwSPzWn7+Zt4hLiFhNneg7cGbG3E+/5cDKfiiJRGbcx6njy?=
 =?iso-8859-1?Q?cmYNvlj8CTkuVehsle5pG0nThaPKcbGjcS+QogKObcVLblVvLVpBQfouC9?=
 =?iso-8859-1?Q?8mgh0EJkyX9ZzYr9sbvugpMQ7wTsTNYnTJI9U8pkR00o7W/iXy46s0gkWw?=
 =?iso-8859-1?Q?82+Ir6vjzq6NdXjxk1s8p3BsOX71pPj9HukGOMES7yGrQ+zHL35QyCd7+V?=
 =?iso-8859-1?Q?Vtdo+ULkWatcj8AQCMQLnap7v5pPAVEw55olCD8ZLaTKCWh7u0B/mrb03c?=
 =?iso-8859-1?Q?If5oMc7/qP+eNOvmHxGLFZ2M2qSvqIvkFv7dESMngwH9+mXidvwZ28Fyi1?=
 =?iso-8859-1?Q?ADJRNR+7tloDSUga05XvjJg18RoIQnJiC4/ySi9vLtkwfzbh2FwI96pfcI?=
 =?iso-8859-1?Q?ot0dJIx+GEWAiOx/pUtm2efCJh484018Tm60+potPHC1AwIGwNmSIgXdwI?=
 =?iso-8859-1?Q?sL6dVVj7wzG7nmrQwkCQBpMgD27PRZaiz36Hk+h9w6xsjNU92SXoeGPIZb?=
 =?iso-8859-1?Q?LXBtIl/41kvghBBfNTswVbyEXeDwMs53r/9JrNozeB3UH1SuMoEDwpVlIq?=
 =?iso-8859-1?Q?RyrHZm1E8kWZeVFlBHpVnMhHR7IRiputqHjM/IMTNYms5Me3T4olxtpDZf?=
 =?iso-8859-1?Q?fWBA3KC2cbClc8RATymT4qmC6Rg3udBVn6+cXRG0zM6l1i5eZq1d2VDkmP?=
 =?iso-8859-1?Q?lhVVeIKNRnlwXCHXcnA/L4MfuBJ1ijF8biAMNMJ1CHkQ7HI0MnJ4ktBn1O?=
 =?iso-8859-1?Q?ixo+mIpmXgg2NiRM1Nnf3PUXs9rpIN0mHrfoabMeFzc1de6MoA/1yEelgL?=
 =?iso-8859-1?Q?WbtnMBqjssgGdEJJwVSfWzjE7irNL9wly/IGJtJLQVJkO8HlMcFnTDHs6E?=
 =?iso-8859-1?Q?BPCQ5MGBycRY7QyQdV1L/bUxDJQZPOD0eDTADLYqENZ5VmRgAfvmjz1Rsa?=
 =?iso-8859-1?Q?MBGsOve4TCbF4kEm0HPvHGenVLZ9fkR4yVMlQ2//23lHZ0XXFeZU6knJ5k?=
 =?iso-8859-1?Q?4awlLX5vmP3525oCvuEsCi1EPAXmIHNAwm9E9/FiQ7vwFjMtoyXiy5RvQq?=
 =?iso-8859-1?Q?zezwidowG28ac9JYvh4b+r29YhyrEXRh6En9uy9nkrLlg8SGpwvYzSeSo/?=
 =?iso-8859-1?Q?gLn11zHZPWUHRx3ILesfNvgcELUx/r79UNF8vlDOUxa3+APZtsfRfgm6Hj?=
 =?iso-8859-1?Q?AQzhg7PoZBDiBQYYXbdDzyw7NKroogsH4GuB2pxiDQKXF0p36Be/ZbrLOu?=
 =?iso-8859-1?Q?urRA2WdtIybJ1/ZBwHuGLsHhI+TUP3KT+Ow+q7mgUTKNyAoPXZ12I2al6H?=
 =?iso-8859-1?Q?bbGgnHRQY+HOyKfluBD3Jy3gSMW1IhbM3F/7kN1MVD3WrvY3Y2Wq2nKWqQ?=
 =?iso-8859-1?Q?b+PBNBT/unBmtZ1oSGFwlGFQVGrN88JkgK/L40iQafokhgRhHIXwqFMG6k?=
 =?iso-8859-1?Q?bYy6kfz70GPoYxhj/gRzNc6uwbCqqT13ho3un9YCGB/keAaey7JFxR4zH9?=
 =?iso-8859-1?Q?ep/7lQ8+1QegQYVzpXKtSplIcB1DRRumdBs4ZO1I0MTP8BpQoJP3tdRrkx?=
 =?iso-8859-1?Q?JCj0yZ5Ka7C1JZU/Ei9w6PnAq+toNxb6bHdh3RvaSkSx0NkGw6x2Ky2X+r?=
 =?iso-8859-1?Q?ZMjyjeax+NlLR1zAXBMglyrnCI4dNQlj0mC8szqsTTj6eU69JEDPwBfM3d?=
 =?iso-8859-1?Q?TEW7NWuv5OgBUMJaJcU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oa4XQgJduVyRZLB6tOvqMiiLXdIGZ9cGBoIaf/Tpp0Og7Lz/WFEbhYsEh9?=
 =?iso-8859-1?Q?c7la0R6NdJnrUNwo/StEhf2zft3VXaN+BWPFM6NO7UQt8pAIiFvvn9GqBT?=
 =?iso-8859-1?Q?YDQCdNtgp/lGzwsFBehJGagJzfvYH34pOx0Coh2Yz5q4PDkIN7+ngcPE4/?=
 =?iso-8859-1?Q?gAYd4GK64f3CZ2rDe3GAfH85bUqSz5bwW5kPH9/LaeczrlLAc3He7TBY4W?=
 =?iso-8859-1?Q?/KKlVWXlvR/gfFV5nPeQ6Go0D7QDfURVu+z43peO0Fu5ezF0X2HLlTST9L?=
 =?iso-8859-1?Q?nnsVypHS9jeHocc2vHhe5FCgnFVM55crTaViNfJNuwsZ7KS3EGteSuujZG?=
 =?iso-8859-1?Q?H+1DCvbYTlhu8XAmR1Knfc0ugo9FaPVADwN+FNuIf78ai5IkCdSXX5wwj4?=
 =?iso-8859-1?Q?4UuCY5k0ma0n9rz3/U2wXlmJ2/6dG0HUr5j4ZTnVNiqkcxLlpCuTGk3Wik?=
 =?iso-8859-1?Q?1KWz4pGVU+RuFo3hKHgPp/NNj+OEgQbePGW+igWrv6XupRPGssRo9d3F1x?=
 =?iso-8859-1?Q?TyvIhH1eBHZ1uR1ONm4pFvHwNxe5+g4mkY9VOMe90UojuV4N4eu/jMsjnN?=
 =?iso-8859-1?Q?vF2XZx8wNDAJBHc9zs9F5A6+mZr/dA9vocRG+oNJTYdXFRfKHllqLqp1BU?=
 =?iso-8859-1?Q?T1I7pLBeGsXg4w4J+cvsatFThPzUlG5mMGuafTIom/IONN4ns5msD+a/3k?=
 =?iso-8859-1?Q?lbV2TIm5SJbY9D3JqElAQkSo4oSCThpx0hTxKG16JWkbVMLHnrglCc8UCg?=
 =?iso-8859-1?Q?wSsolTRka2HiFjokuRA55vLFP9ImRz+VMmy9DL6iwB6vzZQMspuRhVSUvz?=
 =?iso-8859-1?Q?JVM5dSmVGh4fK1wSdlVfEecHqzlw7xjKgVN0NSHK7lDUMSRfmfiCXTWYKD?=
 =?iso-8859-1?Q?bgI2mW7PHyqkLRqeBfkWkLZv6wbHEF/96fM6tzUrArYt6cZHcEDXhXfSdG?=
 =?iso-8859-1?Q?pliw8aig1M/ffrHiBe80dvQLZT3dWT29E4pQAavX8AoiNmfpIyhods+pYP?=
 =?iso-8859-1?Q?BmV/AIfcp1ZWqzTMenQl+0oq0kKnozFwuJQm9SNMtxkKHiyRZnv8YiIwMw?=
 =?iso-8859-1?Q?DxwTC3P1KCCDVqSShggpxRCGrN9fLJhIxerKoKq1oAhX75HFdNCUN/5s8J?=
 =?iso-8859-1?Q?Ok/PShhEuxbvgjU7u0MHa7X/Bva0ZyXsRfiD8kuCIqje8WRQrOMvmw/nyI?=
 =?iso-8859-1?Q?mBpTpZVv1P7G81n0NvkSOr1xYkHKZDvrP1icFOUodA5hDBE9XRTIp2iG1C?=
 =?iso-8859-1?Q?bGweQiwyOWp9aW8QG8jxL1TT2PJJXHOmxonmUiA4FjX88yMRZcNJYtAdAX?=
 =?iso-8859-1?Q?+QLLgT0KtVTOP1QfxlpPbyIhZKx0fRRRh1N957dbjzrIP3DtEV5TvADwPl?=
 =?iso-8859-1?Q?A3WVC5mPNB2Sz7f6z6c+DfZzzwbc5ZkiT7p8yUUWb0IrNApNRnGTubbe8/?=
 =?iso-8859-1?Q?WSJi5q3ANB9IuM11YhU1ErdyxrkVcDuUGkjh7MxABEv3KdPrTvTGbtojI/?=
 =?iso-8859-1?Q?/Nt13bID2HlBQjA8/b8cbTHEvbygldCIxRWo0+T3QwD20vBtZnOPyLfza4?=
 =?iso-8859-1?Q?VIyTiwhmznlzJmkxaP1vq2RSqpp45x8ZXvOJhqvqAO5YocS8GEBV5nOZkE?=
 =?iso-8859-1?Q?eE3zUc4ad70YWQUbH/SO3prZBkm0ZlysGCzZSt0wFTgD0hbHX46+WBCkNJ?=
 =?iso-8859-1?Q?+w6TNwnEjJ0tmkSCSIP2xLP1RHJhgmVs8HVFiC605c2E7x6e+7NQgN005R?=
 =?iso-8859-1?Q?eE/fMxVq1tjrEPbpTCKmiJPs/2T7Sw39sD8KPuoupnu+7B?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB5489B9CB1C345EABF0842920FC90ACO6PR12MB5489namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0d94aa-80f6-4fcd-c6d6-08de5d743de5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 07:18:16.8740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwfMyQTzYkHQhaljPBcWu/7dLKwQaeSfezjH1dQ88bsY4m0HSSrwVvG8gmDn9kDgnFQlSf2rDENJeLEthS/L2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684
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

--_000_CO6PR12MB5489B9CB1C345EABF0842920FC90ACO6PR12MB5489namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[Public]

Looks good to me.
Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

Thanks!

Regards,
Wayne

________________________________
From: Hung, Alex <Alex.Hung@amd.com>
Sent: Tuesday, January 27, 2026 06:40
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Lin, Wayne <Wayne.Lin@amd.com>; Hung, Alex <Alex.Hung@amd.com>
Subject: [PATCH] tests/kms_hdr: Fix typo ST2048 to ST2084

This is a HDR test so it should be ST2084, not ST2048.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_hdr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f4c88bc04..e95ee53b1 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -155,14 +155,14 @@ static uint16_t calc_hdr_float(double val)
         return (uint16_t)(val * 50000.0);
 }

-/* Fills some test values for ST2048 HDR output metadata.
+/* Fills some test values for ST2084 HDR output metadata.
  *
  * Note: there isn't really a standard for what the metadata is supposed
  * to do on the display side of things. The display is free to ignore it
  * and clip the output, use it to help tonemap to the content range,
  * or do anything they want, really.
  */
-static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *me=
ta)
+static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *me=
ta)
 {
         memset(meta, 0, sizeof(*meta));

@@ -486,7 +486,7 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,

         draw_hdr_pattern(&afb);

-       fill_hdr_output_metadata_st2048(&hdr);
+       fill_hdr_output_metadata_st2084(&hdr);

         /* Start with no metadata. */
         igt_plane_set_fb(data->primary, &afb);
@@ -616,7 +616,7 @@ static void test_static_swap(data_t *data, enum pipe pi=
pe, igt_output_t *output,
         }

         /* Enter HDR, a modeset is allowed here. */
-       fill_hdr_output_metadata_st2048(&hdr);
+       fill_hdr_output_metadata_st2084(&hdr);
         set_hdr_output_metadata(data, &hdr);
         igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10)=
;
         igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, =
NULL);
@@ -676,7 +676,7 @@ static void test_invalid_metadata_sizes(data_t *data, i=
gt_output_t *output)
         struct hdr_output_metadata hdr;
         size_t metadata_size =3D sizeof(hdr);

-       fill_hdr_output_metadata_st2048(&hdr);
+       fill_hdr_output_metadata_st2084(&hdr);

         igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EIN=
VAL);
         igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata=
_size + 1), -EINVAL);
@@ -748,7 +748,7 @@ static void test_hdr(data_t *data, uint32_t flags)
                         prepare_test(data, output, pipe);

                         /* Signal HDR requirement via metadata */
-                       fill_hdr_output_metadata_st2048(&hdr);
+                       fill_hdr_output_metadata_st2084(&hdr);
                         set_hdr_output_metadata(data, &hdr);
                         if (igt_display_try_commit2(display, display->is_a=
tomic ?
                                                     COMMIT_ATOMIC : COMMIT=
_LEGACY)) {
--
2.43.0


--_000_CO6PR12MB5489B9CB1C345EABF0842920FC90ACO6PR12MB5489namp_
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
<div style=3D"text-align: left; margin-left: 5pt; font-family: Calibri; fon=
t-size: 10pt; color: rgb(0, 128, 0);" class=3D"elementToProof">
[Public]</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Looks good to me.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reviewed-by: Wayne Lin &lt;Wayne.Lin@amd.com&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks!</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Wayne</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Hung, Alex &lt;Alex.Hung@amd.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, January 27, 2026 06:40<br>
<b>To:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;<br>
<b>Cc:</b>&nbsp;Lin, Wayne &lt;Wayne.Lin@amd.com&gt;; Hung, Alex &lt;Alex.H=
ung@amd.com&gt;<br>
<b>Subject:</b>&nbsp;[PATCH] tests/kms_hdr: Fix typo ST2048 to ST2084</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">This is a HDR test so it should be ST2084, =
not ST2048.<br>
<br>
Signed-off-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
---<br>
&nbsp;tests/kms_hdr.c | 12 ++++++------<br>
&nbsp;1 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
index f4c88bc04..e95ee53b1 100644<br>
--- a/tests/kms_hdr.c<br>
+++ b/tests/kms_hdr.c<br>
@@ -155,14 +155,14 @@ static uint16_t calc_hdr_float(double val)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (uint16_t)(val * 50=
000.0);<br>
&nbsp;}<br>
&nbsp;<br>
-/* Fills some test values for ST2048 HDR output metadata.<br>
+/* Fills some test values for ST2084 HDR output metadata.<br>
&nbsp; *<br>
&nbsp; * Note: there isn't really a standard for what the metadata is suppo=
sed<br>
&nbsp; * to do on the display side of things. The display is free to ignore=
 it<br>
&nbsp; * and clip the output, use it to help tonemap to the content range,<=
br>
&nbsp; * or do anything they want, really.<br>
&nbsp; */<br>
-static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *me=
ta)<br>
+static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *me=
ta)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(meta, 0, sizeof(*me=
ta));<br>
&nbsp;<br>
@@ -486,7 +486,7 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; draw_hdr_pattern(&amp;afb)=
;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_hdr_output_metadata_st2048(&amp;=
hdr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_hdr_output_metadata_st2084(&amp;=
hdr);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Start with no metadata.=
 */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;=
primary, &amp;afb);<br>
@@ -616,7 +616,7 @@ static void test_static_swap(data_t *data, enum pipe pi=
pe, igt_output_t *output,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Enter HDR, a modeset is=
 allowed here. */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_hdr_output_metadata_st2048(&amp;=
hdr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_hdr_output_metadata_st2084(&amp;=
hdr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_hdr_output_metadata(da=
ta, &amp;hdr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_prop_value(=
data-&gt;output, IGT_CONNECTOR_MAX_BPC, 10);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(=
display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);<br>
@@ -676,7 +676,7 @@ static void test_invalid_metadata_sizes(data_t *data, i=
gt_output_t *output)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hdr_output_metadata=
 hdr;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t metadata_size =3D s=
izeof(hdr);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_hdr_output_metadata_st2048(&amp;=
hdr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_hdr_output_metadata_st2084(&amp;=
hdr);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(set_invalid_=
hdr_output_metadata(data, &amp;hdr, 1), -EINVAL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(set_invalid_=
hdr_output_metadata(data, &amp;hdr, metadata_size + 1), -EINVAL);<br>
@@ -748,7 +748,7 @@ static void test_hdr(data_t *data, uint32_t flags)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prepa=
re_test(data, output, pipe);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Si=
gnal HDR requirement via metadata */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_hdr_output_=
metadata_st2048(&amp;hdr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fill_hdr_output_=
metadata_st2084(&amp;hdr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set_h=
dr_output_metadata(data, &amp;hdr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i=
gt_display_try_commit2(display, display-&gt;is_atomic ?<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; COMMIT_ATOMIC : COMMIT_LEGACY)) {<br>
--<br>
2.43.0<br>
<br>
</div>
</body>
</html>

--_000_CO6PR12MB5489B9CB1C345EABF0842920FC90ACO6PR12MB5489namp_--
