Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9B5C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BA810E909;
	Thu,  1 Aug 2024 10:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gH831U0x";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0236910E909
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:59:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTF6LCl9OgGE2h1AYQ/Aij44p7vbPWGYa1A2+qCXjyuvuXkLH4OPKeM6e/c2VEIwI7huVQXkaMl5MKviK1hkv3mFn3PsUs1jjBGfwytmXMiU1jJ7KuT6x+ZiuOFjQUTJ5u5gz0sjyUd/r3g4VuumEUxKqqxXe58MCPgSrnqY8LGFjcts2ETybJAVG0k9rNNc/hu5tS0o1phwvwOKgVhlaCwyqVZgU94JXAPDxkSaHKyIL61x3slUzRtTrLkoPY8h3YAjfOkAiNvEdNg3huqmg0zQUoyfTVSfHYkIYmYuLAHLCCc3MCswEKjp2f0Fg9IPqRhgZ+N7OJfFcah2uCsScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjXsOwH1uuMH5xciMTuWQeYkbh0imJbUTAlDBcZok7w=;
 b=HzNC6oug4WcfZi+OjskTnRAK7A9tdDlkxkWtdnVU8cbPV2/KM3xZ7DkEcx0xYGXQ3fJ1/C+gzQAlxbMqBX66EPG5t2u+U/C17TJw8hCj3iSq1liEAX8KBQou0JkPHg5KkA/LXwttH/FENlgHWXfhi+qZ/HGfKYmDtMy9I2Jrhz73XotqJaR6bLLbHQAE4C/TAqUXJCOnj/eHNhdidsUjZ6lzwjmpcq9/auSrxsUJc0N5MILsgulSu790TAwWYPuex6j/Th/ezNdCijZjN8JELF0gS0+kBWGi6j6e8yt4Ge5bwB1cNVlWzabA4A1U8Sdn67H446KGHwhI3lpYVB7/wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjXsOwH1uuMH5xciMTuWQeYkbh0imJbUTAlDBcZok7w=;
 b=gH831U0xnXwdEJ9Ad8g1Q5aLGImmElDEsHTutjPGs5D8zX+6+rXJWsk0a2PG61/WtebjuUK1MeIRzrSKzr3rG+GldJk/FkMDJ9zyHUWSP7I2Ce74kZng59ZXeF5XFIrNVpEBtauGlCXmOw83HSSR9NhOusofKptlP/e5TMttD4c=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by SA3PR12MB7902.namprd12.prod.outlook.com (2603:10b6:806:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 10:59:44 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 10:59:43 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu: update bad length case
Thread-Topic: [PATCH] tests/amdgpu: update bad length case
Thread-Index: AQHa4/kAPg+OoEFJtkOQxuTvauBpeLISO1kQ
Date: Thu, 1 Aug 2024 10:59:43 +0000
Message-ID: <DM4PR12MB5152C2F43ECF8D64C93E6608E3B22@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20240801095540.2517506-1-Prike.Liang@amd.com>
In-Reply-To: <20240801095540.2517506-1-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=37aaf834-ce45-49b6-94ab-3f693ac9a09a;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-01T10:57:48Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|SA3PR12MB7902:EE_
x-ms-office365-filtering-correlation-id: cb745c91-4957-4305-3cd8-08dcb2190cc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/Rjp0/qqhR1LHQuYH3+gCsWZoidmaB9qotju6BfhPPVjcRagDiuS6moZyOaM?=
 =?us-ascii?Q?NSpP2sgV6aQVJ0I3DnBHYsuQcb4mw94D0UkVf9cpQeyrH4EhfCNBSQROt8iH?=
 =?us-ascii?Q?7nI2dFAKMY67dl/bV9ro/IEvuRR3XmNpRH251ZLDaWajCBq7I2KcTBvFFxTX?=
 =?us-ascii?Q?QoFW//fiTPwA08ZStFdOBl4SMVaYwAHUN9yUTeAS2B9aeIj1QruWiz4M06Kl?=
 =?us-ascii?Q?nKyE392l6R2VZF4iCjoLQ/dAM+9NP/swkuXnL/dJd4BoOLWv9Cib1Ao/P0V3?=
 =?us-ascii?Q?yFGcb2U8qBUM/FFFBeMdApGhob9kfAQkClc69LvamzO03f+8UBJjf9gB7NUR?=
 =?us-ascii?Q?OJK1BCCum+xVADDS4/+oKUpzpUCUGUwx06Ye58QqklIQUiMBSimglPcVky/e?=
 =?us-ascii?Q?7VXHZ7YR+wlLceKTZXyTj/wmIVCRrgUuzmLlfkThdQYCNAXS4UBeSmWOdl6L?=
 =?us-ascii?Q?icp3ePRxmjTHBfyGDYZzShDKYG7movL+fZ3nJY4nA0vS7PNTTxp/bSKKvauX?=
 =?us-ascii?Q?dUxSGG/p0Oa/FY/ZO/SnAwbxd4uLxIajlOsc8m/AhBgzMI4fRXAGEUUzAFqT?=
 =?us-ascii?Q?cydRZCCmH2gxKcepgEGk4YWa9tQBAG8sx2ESWxqEoZkNki0fR6KXFTMHBBnT?=
 =?us-ascii?Q?/7Nl5/tUtYw90mMQBmp3qGFN3Y2S2gPmArvyUXfMxwdZZTLg/2ivWRX9ncHZ?=
 =?us-ascii?Q?t6h0qwf+qlo5WTYmNo41X7iPQ2cpUMfMMbFtX0eRStic51mZ5ihmsAWUZT9s?=
 =?us-ascii?Q?Pmw8oJubHiBx/suwE6iCw7oQnBVHPx2szNPLzeuBAYAYzb+YDcIO35kgaY8d?=
 =?us-ascii?Q?xpw6kEufjMXV1u/K7vsQxuX28yN0vvWCiaCXcZbkc2NX3RxbwnD7AnbsUHHZ?=
 =?us-ascii?Q?iVJNbzGqT8InyD7l3v9woy7wOi7n3LcbCRF+PjIdvxUmsueDT0i+w7xxTvQR?=
 =?us-ascii?Q?jxAKnCPQztk9vneD32Qv4t23i2IRQHxOW4/yYhrAUCbwH7WQriMzldypFLTW?=
 =?us-ascii?Q?Dlt/AVZUtyG0gDLja4r2/5SquU9lYvnrFinuvt1OGLoZJrbhZgBgQrOwY/2C?=
 =?us-ascii?Q?PsdXD7HAQO8tc8+Qcv4MuF5Z1T1/pbuycjqUBYXUseMAjTU891dLfGbn0WvO?=
 =?us-ascii?Q?BwgpnwoypcniubDl3/fJiFdbrcsD5D8z6TgdpEmJxxBXHBIJInH6ha4SxsEc?=
 =?us-ascii?Q?+vpGPrBuoknT2PXns+2kihLGR3UwfFzmPia/c3fTJM2yjrfvw2zZ4xEOgeon?=
 =?us-ascii?Q?ZPIOAIzhkpHqgH5amnRcncSZq7gDicPuVWfiChArcjUtzkhRB55HHa9J4256?=
 =?us-ascii?Q?ELcG4O/icbkWE6lpylN56zUPW/1iaqkK1Ygpbvtw9+I23SLPRWdQmwfANZlb?=
 =?us-ascii?Q?iNxeqWr4SMFTZv7KLENb/Po9EuU/9EGbtqscT4fzr7tpqnYqqA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GNVpdxiOxe8VlkVkiow9r+qysglTk1VzLiIAr46vrOLk3l760yh9m2nPkn04?=
 =?us-ascii?Q?1EPY88b3bWgFr1+NL0xEry9O9DFW+kMdVbtmIzXJPp9jnZgSlLCjv7nG05Lm?=
 =?us-ascii?Q?7y08tbHHuf7buHGn51lAaglQyLS4cik6Sul/ZotUlpvBOFuvfM0UcB+6R8Mt?=
 =?us-ascii?Q?CejaXk8mar1EQVhTr4uFDaUiku6zaSm59WnCAEQdrDPEGhENP+tSDoTdJbgT?=
 =?us-ascii?Q?6+kWQi8qIhBhZUSJWAOwVv8Ui0qRYf9f4leLCi6ziDhp9JtFMKASXUt8mbnr?=
 =?us-ascii?Q?agyGkMmF16gW/WZuDjhxU6zqOqYp3mZ/kPGyRxZzULMfYYOz8+ZrNAFeDzfS?=
 =?us-ascii?Q?5Xf+RO4wANruQ5unO9XLLqD2I6YNI2UwWUh5EZpBlpMbotFTIRfNC9w0nGKO?=
 =?us-ascii?Q?t+6p7VfvFTtWE3PmkNYxvo30RuWXTvHLor8mJLEu+8kDunOOI+dX2NEA1vVI?=
 =?us-ascii?Q?fleEwUjVXgCkCrinmY/8WQcC1kVA4qO5jkCE/G0NUt4rOV1rurxXZSNTE+7t?=
 =?us-ascii?Q?X4PURdLXLwkS0LYzsoWJ+jQT1zHdbUGBUxDZ8sixPVgeFIn0Qy6CQORNl5EJ?=
 =?us-ascii?Q?9Ohe5sqms3R6KTLrv2glcpbPB6SvnM5MTh6+7nwrquoSQxT5fYjSXFRyChV3?=
 =?us-ascii?Q?prJzDhXZj+SFDydYWLqmKhr3EAYFo5El2MhnJoU5wSmujmW4oHVrhZVajMCH?=
 =?us-ascii?Q?YmtLgApumIWmLWQNDZoaoPlWrBkdt6lPR1r/VsBSpvS4gAhpz4ygRpy9U04U?=
 =?us-ascii?Q?G4HjSUdnM+4IO/Zk/0U0YbdVyGhJ6JVeT1mDa+i12fsqJqIDZsA8NXhBhUEC?=
 =?us-ascii?Q?Mo1BqAgIyNSs4Npu1jLMve7qOiy0iU61FAuPgoz5UasVPqvqxrnVlqKpX/zy?=
 =?us-ascii?Q?KIGidMKAR5pLrgzCpFHpoCTZcPfY0S6DvBKqXzdMoT0Xo6Rou1hezrOx54xG?=
 =?us-ascii?Q?ko6ZFXIQbtsN7WOM7RUlrVmN2NnXdLiAW2QLO/I4CB5Y5gkl0VUHinealAYj?=
 =?us-ascii?Q?CkTtXQgLLrm0qnoOrRwu5+AUuBVSonHPCYWHrfOSsn/VCqAlutELGVJSEqpW?=
 =?us-ascii?Q?ezNxa/nNTx1QVnOAd4YJn4zvGk7Up8IX3fN3vEO0xcldSv5Wj7MdXiv3GllL?=
 =?us-ascii?Q?fn3KPx28xEsNa9jJUwcLtBn25JMRCtaTejXtitsPcuwrjhIZlkoz5apDcEhl?=
 =?us-ascii?Q?imlJfdF8yxsaYrgvgt0eExKlEEw6fGohS2XQQt+zQIGNcKXU0WNaRX1Aywfq?=
 =?us-ascii?Q?EOU/TqPDArW4NkTgak2Qmms1QDRXmxuo40Uv80G9LwqrefELHEbIKqC6IEQm?=
 =?us-ascii?Q?LSkGg7SkOkDRRLMdq6pfO1BSXx2XfnCiGxm2whaNkxyje9GDGc15dvO7dk3y?=
 =?us-ascii?Q?ReYLxa1CTBKQ4gs2jjrYSsp8u03B7T1dN/uG/BYctuozh3V5TYqQumX4x/ie?=
 =?us-ascii?Q?mjTHk8ah3/Cmx9H6+ccMNUmYcUtHwZABDAFGJBHpVFonnnP5G41AyuDxBZuF?=
 =?us-ascii?Q?kyPObMC6D304EK3w4BV/IUTQifuji1y8rBcwfKUS6Bp5J5o337mdFVidDVAQ?=
 =?us-ascii?Q?YezviylCrT+1V6sFz60=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb745c91-4957-4305-3cd8-08dcb2190cc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 10:59:43.7534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YrGD1RimizXxMct0+HYD8YhAdZTTN7UndF60V236ulOlga3AjQMEsDJx2bILn5p5eM+HNEtqq9RGNOoVlQoEDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7902
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Prike,

-----Original Message-----
From: Liang, Prike <Prike.Liang@amd.com>
Sent: Thursday, August 1, 2024 5:56 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Liang, Prike <P=
rike.Liang@amd.com>
Subject: [PATCH] tests/amdgpu: update bad length case

In the bad length case, when the header length has more than 4dwords than p=
acket stream length then CPFW will pending on the stream data and raise a C=
P halt error which requires do the pipe reset. As to the orignal case of he=
ader length is smaller than PM4 stream length then the PM4 stream data may =
will create a bad opcode error which only requires the queue reset. So for =
testing the pipe reset need to update the header length bigger than the PM4=
 stream data length.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c index =
f675b97dd..503b68431 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -189,7 +189,7 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs =
*func,
                      const struct amdgpu_ring_context *ring_context,
                      uint32_t *pm4_dw, unsigned int cmd_error)  {
-       uint32_t i, j;
+       uint32_t i, j, stream_length;

        i =3D 0;
        j =3D 0;
@@ -198,6 +198,11 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs=
 *func,
          * But the range applies to all asics.
          * 0xcb-0xcf, 0xd2-0xef, 0xf1-0xfb
          */
+       if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_OPCODE)
 >  this case is for bad opcode, not for bad length. It will have an impact=
 on other cases.
> Thanks Jesse
+               stream_length =3D ring_context->write_length / 16;
+       else
+               stream_length =3D ring_context->write_length;
+
        if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_OPCODE)
                ring_context->pm4[i++] =3D PACKET3(0xf2, 2 +  ring_context-=
>write_length);
        else if (cmd_error =3D=3D CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
@@ -223,7 +228,7 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs =
*func,
                ring_context->pm4[i++] =3D upper_32_bits(ring_context->bo_m=
c);
        }

-       while (j++ < ring_context->write_length)
+       while (j++ < stream_length)
                ring_context->pm4[i++] =3D func->deadbeaf;
        *pm4_dw =3D i;
        return i;
--
2.34.1

