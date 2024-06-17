Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D11EC2BA15
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 16:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1824C10E45E;
	Mon, 17 Jun 2024 16:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qIQrhVKz";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855D010E45D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 16:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMnqgq6z0B8JK/BdWQHfnHeSdv457Q91HL1lYNsOND6W34GIhbQE/j2Oi+NyglTmuKhgU4aGtUF56qgDD1oqKogN8E2uRxdWp43nOEk16W2aVBT5kZGrMp+lO/prnAVDId4eL6pFlHUMc7Pb4rBdD3twF/CDi77wjXytIlr23P/wmqr9ASxUk7R2y/zKEKwxJCs939YDzqZvtdRrXr3SyPTrj/dutYMbyhkCsCAg5Lv0eNZgooOZs6ow1KJkfoiWs/ctvUnH45+1n/AzokJGNZuVs734l448dQ+4geQ8g8d+mdCYS4wOniR8OD5lpfDQa4FZiYXsCFyJzu1zCZeBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXRmgL6FZEsp8jca8bL3X1fxQ652oQ62LrRkRFedD9s=;
 b=TP/rp7Ns5xiFs6vDRdZkHoKftTeYWCXOs+pXyAtRWr15pY/qjWqei3Nt1vOPrqjZVKy1hpQsruq7oeAto3MsoZpwPhCMQv/KKSAamuDHPbf8oQMfel0BrFA7JaWtyGIdKnR16yx3b3P6dMMJc4UOhnKz3mlhwvtmltZYg2a94BmX3jm4cKgfMnhf5YWTyNFl3GPvqHh3Q5ifmp+ZseCd/5MfZewH/DMW07KfEMIRmnB1W648WW5ykFRVUN/wo20Yzb/OKkrVh1DIYTWxGAqqd8rFsy+ruXrdSnRPYn8pDIdF35J49fLv5DPR6fu9DgWIis85+BG9j/+XKbUOlo4T+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXRmgL6FZEsp8jca8bL3X1fxQ652oQ62LrRkRFedD9s=;
 b=qIQrhVKzcCX/HVx2RSJr+D+w6iTbt1gyI0nE7w46+DjjQvP4D6zthhMLQVCt1JZd+H/c0nHCaQ7AXAg8B8zIVtUeXUPcLLI7iCe5H/38XPt20lSBA9I2dsOMtrPESW2XrIVpko712vxWlHDWv3NeF9bxpSqaCutdYIaNl57jLhc=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by CY8PR12MB7682.namprd12.prod.outlook.com (2603:10b6:930:85::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 16:11:39 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%5]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 16:11:39 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests/kms_bw: add subtest for only connected
 outputs
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_bw: add subtest for only connected
 outputs
Thread-Index: AQHawM9x6lxazAim+U2jqcLje3RjpbHMIEMB
Date: Mon, 17 Jun 2024 16:11:39 +0000
Message-ID: <CH0PR12MB5284668C51C572A3496CCBD28BCD2@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20240617161052.1113250-1-kunal1.joshi@intel.com>
 <20240617161052.1113250-2-kunal1.joshi@intel.com>
In-Reply-To: <20240617161052.1113250-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-06-17T16:11:39.173Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|CY8PR12MB7682:EE_
x-ms-office365-filtering-correlation-id: 10835df6-363c-42bf-2e77-08dc8ee82ba7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?HWcSvlJ8yHJAamRJ6i9SzLcwisZts2TnBW8mP0KLuBSRzoprwj9EpNOAJmSg?=
 =?us-ascii?Q?LyHwX6HD1cnEYv62ni+ISevir5M6N8u/eO93GA2CQ4XVveOSxTNRJhHfIinW?=
 =?us-ascii?Q?QiPI4OrZ2CY8Udrz2xpTDev1Bqg5hvO4d5Q7d6ZECyAzrbARJ14nK0uX+krw?=
 =?us-ascii?Q?TOmTISNMQtc/v9nedPF2aVNilf9zUXtTFTLwPqwytLskT+dmV/OqpqWuWpYl?=
 =?us-ascii?Q?ip1n4cZUxu9KmyTdduseEusrayTc1QLLdFrFKFD2iyaVXANSOZvYnQJdYkIB?=
 =?us-ascii?Q?GiTnGWlFHjs2UNrichb3/olq/mMmPCwFJ7dQmBXvEUlOPakiA5yScze+7OmM?=
 =?us-ascii?Q?VaMqNVQpicGuQj6G+4I650RDWPTZxpUeTlW8q2QaDsth6CIz+bR7Pa0ZEf2E?=
 =?us-ascii?Q?LmyIVLNYpFffSrw/tzOcgjJuz0aM7Z7y467wjDObdlOBN6xe+qDSBn7RrwIB?=
 =?us-ascii?Q?0QnFhZ0HXU8+QGoLn4evTNU4GBpo7fqAS5HnRWS7M+nqsisrDTroNq6VOQIM?=
 =?us-ascii?Q?tG8ZWS1qvnOemO2Wm3wYaQJU6vyTB7NCGV4uC+w2jtpgDR5RLfApOGteeQ1R?=
 =?us-ascii?Q?JkhFvE7SO7LlrrHL+Q7yBmK1XTzDpTRJ9m0oxLtzJORceUvBn4LH4q+U8GPa?=
 =?us-ascii?Q?t2rHLRLM12lyAlUA3Z6NedDZl8uB1up1MnIOadNADwpP3ZxD1LUcjNORK5zD?=
 =?us-ascii?Q?rqHd/6gM9Nl+/JucIFvQQ+/Hx5Qnmn0S4UbmaofwVnC3Qdw4WfHM7sY6Ixck?=
 =?us-ascii?Q?8ZdhqUd/7HY869l+a5JFaL2MmMP/Yz1aF/p8W00irNVsEhSMwnZzgZ5J0Ywg?=
 =?us-ascii?Q?3JipECu4S/8Q5hG2bgoQ22Cci20QuhNa/abBe24J9gZgsxnB8G+oBVw/oL6s?=
 =?us-ascii?Q?kbtqZUZIOGCW6jaCZ5kFt1eVN+q3A/rXgda/4O3VdmhLp48nTv0crXpxctVJ?=
 =?us-ascii?Q?7QKD6Sjsb2hS3fmNB9FhEU3xlfiCSOS5rt0xTEYeuppWdwZ78A9UTACc9uGx?=
 =?us-ascii?Q?KcuV3LFNm5bzFee/I6VtkHUCdsvViE/YJPPwUHh8VkwaoL28RVOPhpaCEEfF?=
 =?us-ascii?Q?jBSIFDfDmJ5De6CBoOOr6Fr5zlFBkNvPHDiLy/3ouylNL5+nO6OWYEJhZFty?=
 =?us-ascii?Q?qZhSZf34EhRb4ehj6PTdPjiKL9EHjz6YVjTP/eYJhFMA3iX+RjWW9L9LPe0M?=
 =?us-ascii?Q?WpYeEosIeWDKSfLiHlxbysBN5Z11i1Gqi0Tp/qtoLekipCh6IyhOOkTlWVPF?=
 =?us-ascii?Q?DiUNIon56ekmWvXn6P1nctGmvoAXmv8jUhjfUbKOHN58GcNfDYMtWInpYHuC?=
 =?us-ascii?Q?rF1Jvya0+mXabXQJ+MOle4BKskiJG4MJFEwdzI6DZCwJ8rwuG/dMRxEDjzmf?=
 =?us-ascii?Q?Va+Cn88=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3X9i7UGRiPm+jYH7OCGltwEVQE8zWnv+2Wj8MPYtd53AZXDEx9MK9OaqH7OK?=
 =?us-ascii?Q?HLHV/GTJu79tO7zS91xlmPCTSqu/IHz3LR9nfYx9Z0ysrXJR1tJyOiChnM60?=
 =?us-ascii?Q?Yl9EMN56v0z5PPlJjVATOSFrbe2DuPw0B7z/g0iUUXJhMkDIV7QrZKOw/kvT?=
 =?us-ascii?Q?VEWMogJnQX4ImlY5CQmMLBwB/wD2/Hz0WLdmkXJUm5A12DEtCEugPQfTrFu7?=
 =?us-ascii?Q?owBPg6b3DS/5luNnstcGdq5R5Gr7evkho6ZpDABg9sq/NUWEwIVL6Pfs/sXf?=
 =?us-ascii?Q?q46cmRf1QmH81zX9clrriIOcqqMTrVrDyU8USKGT6/0a7ZLv0aTI05+Itz7/?=
 =?us-ascii?Q?vDYSl63KZBs658wsscFPjyIfIU67IiHdglX6gfGXHa2gv4Th3VW3Iw7rbcVC?=
 =?us-ascii?Q?/cCYAHxx4TTRRzikdfiIKCEfrszRFQrZea67eEDKazqsVRLw0Z6uufrXF4IL?=
 =?us-ascii?Q?KgkcQgvW0xmzr15t7WS8FdQs95LjQmWCzMLhWLz3EG13zK3VWV2ACC38sVP8?=
 =?us-ascii?Q?BVHslfmxak7zSetKnxcWWF/+fbssYf1H0F6m2eeQfvo+c2dtzvtn1aYJ+1BU?=
 =?us-ascii?Q?9b+rByg9RjLrcuC2ospx6gAMP0yiqM1+IclBQfrD28UIUx1pbFRbKUwZxLL2?=
 =?us-ascii?Q?w3JPis9fmnvRaK6DiFzkovJ5JnAFcagyhYk7jfs2Fc9AeWPQabqfJBA7bS2C?=
 =?us-ascii?Q?eWVgmqM554kdyiRd86TPwZNwlGq3bzypF36eoDbX0teSGJKsGaywhaADKN3H?=
 =?us-ascii?Q?TAkyl5Ck3SfIAjXcBwKvh6M5t38xyf86Ej4WhzLj2UcABEOm4SvbKtZLLrNR?=
 =?us-ascii?Q?VYJU5gfAVCAAY0iJgAwpefVwBec+SaxiXUlnSwmRUFr5AnqsiiLmV7AJ2xim?=
 =?us-ascii?Q?cgxW85QlQuvT8u0HOkY7DmgwAhU9gjwfz55ILKIKJokTVig3WDmNZgcwVGrz?=
 =?us-ascii?Q?gmYWctcjEunC4rd+BiFoqlAhMOnVy3+nfEA2ux+kToSkAP7mFzdxgI22neru?=
 =?us-ascii?Q?Kb+IczaF3MKKd54Y7eWi/IRmTIgrCqwH+WBfXLaHAIDFT9sMOCLgx+KNKb7K?=
 =?us-ascii?Q?kwbZidGV7txZRQnVQVGmgVh03rZMTjhzMHE24CGt2DUAtrwpdXS539gDMxp1?=
 =?us-ascii?Q?vmCoZihadS2Ja+NWzrJlDmJK9hgbgLpRP+rpy2eD8UKwcfjBsTy+1Lpwg/7I?=
 =?us-ascii?Q?DmPgztRysG2IOiD8url19KRAavvweZUm0q9Xgon1w4tzeplXE0yDtBnS0SfE?=
 =?us-ascii?Q?Y/kT+uMmSCTGOe+I+kNS14/Pp3mckHpj3lQYU2snMV4cw05wif/K2AH/U/xA?=
 =?us-ascii?Q?GQ0Vs3Oz+HJTHD97ZZvHR36EtD4+qpdtzuW2TGfOagUlZBUzFsU38HEd73YC?=
 =?us-ascii?Q?ZD1ohEBjnaqGW7l8H9Byj0/ObMVONGyzQNnd2v7BmbcqrkeXqPKAbR3XzK1n?=
 =?us-ascii?Q?oZUpuIK+SCrZT7szKRdIs04IZpehlOe912467pA3SvZSJFwu/I+1raT2v9No?=
 =?us-ascii?Q?OuwUVRsyBYKfG80wsHQ0C4jQG5qHQ7HqL/s8Km4h1zAxpZddAf0hUUaJkwOP?=
 =?us-ascii?Q?xOrmBWSHr/lKEfEDPSs=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB5284668C51C572A3496CCBD28BCD2CH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10835df6-363c-42bf-2e77-08dc8ee82ba7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 16:11:39.5237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nQTiRus0Fbo9xBaSbPxza3TTOeV5dyGMTlVxAN7HWGD28kDAGscwk6pjhOnWdvRtgpo3fSw3ml5Z+/fJwSg/bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7682
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

--_000_CH0PR12MB5284668C51C572A3496CCBD28BCD2CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Aurabindo
________________________________
From: Kunal Joshi <kunal1.joshi@intel.com>
Sent: Monday, June 17, 2024 12:10 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: Kunal Joshi <kunal1.joshi@intel.com>; Pillai, Aurabindo <Aurabindo.Pill=
ai@amd.com>
Subject: [PATCH i-g-t 1/2] tests/kms_bw: add subtest for only connected out=
puts

forcing DP connector doesn't work well and tests are skipping
with unsupported mode, add new test which runs test on connected
outputs only.

v2: added debug print for better clarity of skips on unsupported mode

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/kms_bw.c | 43 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 05f7e79ad..9f376bfe3 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -48,6 +48,19 @@
  * @2560x1440p:       2560x1440 resolution
  * @3840x2160p:       3840x2160 resolution
  * @2160x1440p:       2160x1440 resolution
+ *
+ * SUBTEST: connected-linear-tiling-%d-displays-%s
+ * Description: bw test with %arg[2]
+ *
+ * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
+ *
+ * arg[2]:
+ *
+ * @1920x1080p:       1920x1080 resolution
+ * @2560x1440p:       2560x1440 resolution
+ * @3840x2160p:       3840x2160 resolution
+ * @2160x1440p:       2160x1440 resolution
+ *
  */

 /* Common test data. */
@@ -55,6 +68,7 @@ typedef struct data {
         igt_display_t display;
         igt_plane_t *primary[IGT_MAX_PIPES];
         igt_output_t *output[IGT_MAX_PIPES];
+       igt_output_t *connected_output[IGT_MAX_PIPES];
         igt_pipe_t *pipe[IGT_MAX_PIPES];
         igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
         drmModeModeInfo mode[IGT_MAX_PIPES];
@@ -62,6 +76,7 @@ typedef struct data {
         int w[IGT_MAX_PIPES];
         int h[IGT_MAX_PIPES];
         int fd;
+       int connected_outputs;
 } data_t;

 static drmModeModeInfo test_mode[] =3D {
@@ -108,6 +123,7 @@ static void test_init(data_t *data)
         igt_display_t *display =3D &data->display;
         int i, max_pipes =3D display->n_pipes;
         igt_output_t *output;
+       data->connected_outputs =3D 0;

         for_each_pipe(display, i) {
                 data->pipe_id[i] =3D i;
@@ -124,12 +140,12 @@ static void test_init(data_t *data)
                         continue;

                 output =3D &display->outputs[i];
-
                 data->output[i] =3D output;

                 /* Only allow physically connected displays for the tests.=
 */
                 if (!igt_output_is_connected(output))
                         continue;
+               data->connected_output[data->connected_outputs++] =3D outpu=
t;

                 igt_assert(kmstest_get_connector_default_mode(
                         data->fd, output->config.connector, &data->mode[i]=
));
@@ -173,7 +189,7 @@ static void force_output_mode(data_t *d, igt_output_t *=
output,
         igt_output_override_mode(output, mode);
 }

-static void run_test_linear_tiling(data_t *data, int pipe, const drmModeMo=
deInfo *mode) {
+static void run_test_linear_tiling(data_t *data, int pipe, const drmModeMo=
deInfo *mode, bool physical) {
         igt_display_t *display =3D &data->display;
         igt_output_t *output;
         struct igt_fb buffer[IGT_MAX_PIPES];
@@ -189,11 +205,15 @@ static void run_test_linear_tiling(data_t *data, int =
pipe, const drmModeModeInfo
         igt_skip_on_f(pipe >=3D num_pipes,
                       "ASIC does not have %d pipes\n", pipe);

+        igt_skip_on_f(physical && pipe > data->connected_outputs ,
+                      "Only %d connected need %d pipes\n",data->connected_=
outputs, pipe);
+
+
         test_init(data);

         /* create buffers */
         for (i =3D 0; i <=3D pipe; i++) {
-               output =3D data->output[i];
+               output =3D physical ? data->connected_output[i] : data->out=
put[i];
                 if (!output) {
                         continue;
                 }
@@ -208,6 +228,8 @@ static void run_test_linear_tiling(data_t *data, int pi=
pe, const drmModeModeInfo
                 igt_output_set_pipe(output, i);

                 igt_plane_set_fb(data->primary[i], &buffer[i]);
+               igt_info("Assigning pipe %s to output %s with mode %s",
+                                kmstest_pipe_name(i), igt_output_name(outp=
ut), mode->name);
         }

         ret =3D igt_display_try_commit_atomic(display,
@@ -219,7 +241,7 @@ static void run_test_linear_tiling(data_t *data, int pi=
pe, const drmModeModeInfo
         igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, =
NULL);

         for (i =3D 0; i <=3D pipe; i++) {
-               output =3D data->output[i];
+               output =3D physical ? data->connected_output[i] : data->out=
put[i];
                 if (!output) {
                         continue;
                 }
@@ -230,7 +252,7 @@ static void run_test_linear_tiling(data_t *data, int pi=
pe, const drmModeModeInfo
         }

         for (i =3D pipe; i >=3D 0; i--) {
-               output =3D data->output[i];
+               output =3D physical ? data->connected_output[i] : data->out=
put[i];
                 if (!output)
                         continue;

@@ -265,10 +287,19 @@ igt_main
                 for (j =3D 0; j < ARRAY_SIZE(test_mode); j++) {
                         igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
                               test_mode[j].name)
-                       run_test_linear_tiling(&data, i, &test_mode[j]);
+                       run_test_linear_tiling(&data, i, &test_mode[j], fal=
se);
                 }
         }

+        for (i =3D 0; i < IGT_MAX_PIPES; i++) {
+                for (j =3D 0; j < ARRAY_SIZE(test_mode); j++) {
+                        igt_subtest_f("connected-linear-tiling-%d-displays=
-%s", i+1,
+                              test_mode[j].name)
+                        run_test_linear_tiling(&data, i, &test_mode[j], tr=
ue);
+                }
+        }
+
+
         igt_fixture
         {
                 igt_display_fini(&data.display);
--
2.25.1


--_000_CH0PR12MB5284668C51C572A3496CCBD28BCD2CH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" style=3D"color: inherit;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Aurabindo<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kunal Joshi &lt;kunal=
1.joshi@intel.com&gt;<br>
<b>Sent:</b> Monday, June 17, 2024 12:10 PM<br>
<b>To:</b> igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Kunal Joshi &lt;kunal1.joshi@intel.com&gt;; Pillai, Aurabindo &l=
t;Aurabindo.Pillai@amd.com&gt;<br>
<b>Subject:</b> [PATCH i-g-t 1/2] tests/kms_bw: add subtest for only connec=
ted outputs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">forcing DP connector doesn't work well and tests a=
re skipping<br>
with unsupported mode, add new test which runs test on connected<br>
outputs only.<br>
<br>
v2: added debug print for better clarity of skips on unsupported mode<br>
<br>
Cc: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
Signed-off-by: Kunal Joshi &lt;kunal1.joshi@intel.com&gt;<br>
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
---<br>
&nbsp;tests/kms_bw.c | 43 +++++++++++++++++++++++++++++++++++++------<br>
&nbsp;1 file changed, 37 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/tests/kms_bw.c b/tests/kms_bw.c<br>
index 05f7e79ad..9f376bfe3 100644<br>
--- a/tests/kms_bw.c<br>
+++ b/tests/kms_bw.c<br>
@@ -48,6 +48,19 @@<br>
&nbsp; * @2560x1440p:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2560x1440 resolut=
ion<br>
&nbsp; * @3840x2160p:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3840x2160 resolut=
ion<br>
&nbsp; * @2160x1440p:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2160x1440 resolut=
ion<br>
+ *<br>
+ * SUBTEST: connected-linear-tiling-%d-displays-%s<br>
+ * Description: bw test with %arg[2]<br>
+ *<br>
+ * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16<br=
>
+ *<br>
+ * arg[2]:<br>
+ *<br>
+ * @1920x1080p:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1920x1080 resolution<b=
r>
+ * @2560x1440p:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2560x1440 resolution<b=
r>
+ * @3840x2160p:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3840x2160 resolution<b=
r>
+ * @2160x1440p:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2160x1440 resolution<b=
r>
+ *<br>
&nbsp; */<br>
&nbsp;<br>
&nbsp;/* Common test data. */<br>
@@ -55,6 +68,7 @@ typedef struct data {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary[IGT_M=
AX_PIPES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output[IGT_M=
AX_PIPES];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *connected_output[IGT_MA=
X_PIPES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_t *pipe[IGT_MAX_P=
IPES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc[I=
GT_MAX_PIPES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo mode[IGT_M=
AX_PIPES];<br>
@@ -62,6 +76,7 @@ typedef struct data {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int w[IGT_MAX_PIPES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int h[IGT_MAX_PIPES];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int connected_outputs;<br>
&nbsp;} data_t;<br>
&nbsp;<br>
&nbsp;static drmModeModeInfo test_mode[] =3D {<br>
@@ -108,6 +123,7 @@ static void test_init(data_t *data)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D=
 &amp;data-&gt;display;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, max_pipes =3D displ=
ay-&gt;n_pipes;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;connected_outputs =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe(display, i) =
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; data-&gt;pipe_id[i] =3D i;<br>
@@ -124,12 +140,12 @@ static void test_init(data_t *data)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; output =3D &amp;display-&gt;outputs[i];<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; data-&gt;output[i] =3D output;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Only allow physically connected displays for the t=
ests. */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!igt_output_is_connected(output))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; data-&gt;connected_output[data-&gt;connected_outputs++] =3D outp=
ut;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert(kmstest_get_connector_default_mode(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-=
&gt;fd, output-&gt;config.connector, &amp;data-&gt;mode[i]));<br>
@@ -173,7 +189,7 @@ static void force_output_mode(data_t *d, igt_output_t *=
output,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_override_mode(o=
utput, mode);<br>
&nbsp;}<br>
&nbsp;<br>
-static void run_test_linear_tiling(data_t *data, int pipe, const drmModeMo=
deInfo *mode) {<br>
+static void run_test_linear_tiling(data_t *data, int pipe, const drmModeMo=
deInfo *mode, bool physical) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D=
 &amp;data-&gt;display;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb buffer[IGT_M=
AX_PIPES];<br>
@@ -189,11 +205,15 @@ static void run_test_linear_tiling(data_t *data, int =
pipe, const drmModeModeInfo<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(pipe &gt;=3D=
 num_pipes,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ASIC does n=
ot have %d pipes\n&quot;, pipe);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on_f(physical &amp;&am=
p; pipe &gt; data-&gt;connected_outputs ,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Only %d connecte=
d need %d pipes\n&quot;,data-&gt;connected_outputs, pipe);<br>
+<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_init(data);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* create buffers */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D pi=
pe; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; output =3D data-&gt;output[i];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; output =3D physical ? data-&gt;connected_output[i] : data-&gt;ou=
tput[i];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!output) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
@@ -208,6 +228,8 @@ static void run_test_linear_tiling(data_t *data, int pi=
pe, const drmModeModeInfo<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_output_set_pipe(output, i);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary[i], &amp;buffer[i])=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_info(&quot;Assigning pipe %s to output %s with mode %s&quot;=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_pipe_name(i), igt_output_name=
(output), mode-&gt;name);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_display_try_co=
mmit_atomic(display,<br>
@@ -219,7 +241,7 @@ static void run_test_linear_tiling(data_t *data, int pi=
pe, const drmModeModeInfo<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(=
display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D pi=
pe; i++) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; output =3D data-&gt;output[i];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; output =3D physical ? data-&gt;connected_output[i] : data-&gt;ou=
tput[i];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!output) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
@@ -230,7 +252,7 @@ static void run_test_linear_tiling(data_t *data, int pi=
pe, const drmModeModeInfo<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D pipe; i &gt;=3D=
 0; i--) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; output =3D data-&gt;output[i];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; output =3D physical ? data-&gt;connected_output[i] : data-&gt;ou=
tput[i];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!output)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
&nbsp;<br>
@@ -265,10 +287,19 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; ARRAY_SIZE(test_mode); j++) {<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_s=
ubtest_f(&quot;linear-tiling-%d-displays-%s&quot;, i+1,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_mode[j].name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test_linear_=
tiling(&amp;data, i, &amp;test_mode[j]);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test_linear_=
tiling(&amp;data, i, &amp;test_mode[j], false);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; IGT_MAX_PI=
PES; i++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; for (j =3D 0; j &lt; ARRAY_SIZE(test_mode); j++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtes=
t_f(&quot;connected-linear-tiling-%d-displays-%s&quot;, i+1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; test_mode[j].name)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_test_l=
inear_tiling(&amp;data, i, &amp;test_mode[j], true);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_display_fini(&amp;data.display);<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB5284668C51C572A3496CCBD28BCD2CH0PR12MB5284namp_--
