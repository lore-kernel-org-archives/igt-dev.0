Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EA4C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF5610E41B;
	Fri, 17 Jul 2026 08:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="QrOhAkWG";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="p8ud4WqA";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCF610E41B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:14:57 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7CaJt2902527
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:14:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=K+Ay5vki1pmwSfDUClA0UtnmzpGVibOe9VedxNG6JJM=; b=QrO
 hAkWGQDzsBJ+98Ng27xigU8n8tFGd3xRWw3GE2kiVaS+q6p+hSfyim1SCNVgFw1B
 1rzbzaB3Oc9NMV4j8G67xEKyvgIuH5TFPrhX4E+KPLYHGxWvB9TeHxdESIoKqC1/
 xPfwhE0LqiwchFwWXnrSYmuhogImdPQXaaCV8/qv5wmoZ38P4vIHk/a6yBdig51K
 +zlj1uUZQ2S9KMNirF9MiMwaxdzsnNaVd7iuqVjkbDi+6jfufcYbJeprP0tSjeQt
 eN8lc5/G0vzahYoIjTRkctpf/aJHH7osT2N4XnG0qgnrfELoL6sIbL6rNF++rRN1
 M7rqAr4+Bjb0x4OFGqw==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021138.outbound.protection.outlook.com [52.101.100.138])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnhk6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:14:56 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvxwojBKqcf3E/O7V302ZkG4HAQpgEldWjSoDT75Uuv6m8QtoUy/9I9NLA0rljObUv2beHehrpSga/QL3NTLJn25sJqavCcp7EFL2dQyM2cf348H7t5N5aPH8V95J6+m0bZAGpbCC8xu48B17MPUfMOZ+5uNN6j4/iByKqtWzn59FCP+K8N/+Doiucv8Zqi9ilFxhlIBXS6cAz5I9I33iej2m9pXM45rSxkLqfOoafu8xLiJoGfJMgiX7k9YJmdhHJN3ebDtizDhnY3qg4hP02egXZ2K5oUtRyEvSBKh4CSdWLNXsIrgPTZWsvwMeOes6OSdpjfF9bIoJAzUfyQJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+Ay5vki1pmwSfDUClA0UtnmzpGVibOe9VedxNG6JJM=;
 b=oaqGTvBTANfHQeJjJPeO02y2FJrRKfeQdjnyOGHkCFtaAyhQm/cYvAUDfFfIVD5MjC10nDliPsT3iWipFtKHu2c8Wq6ZhLo0Q9KNhiD6uBORLlhdSlGi5QOz3uH6B4CQ2auCVQgu7VKLXWTh4bQVJEzLmrH9BG4z/XZhBZuOXnInK/byQNdwOFK97IeFW294W2qDw1mj4IyJxsEj7/BVwtniAFlwEQOYYlTN9yPizv0tZ0Og79GP2XrA1cCC+oOfWJYXbgrHpzDnOaK6A7YTXTGNX5onEhpWTSwre+yuRdBY6GLeLfpE6azcAVdzP9EQAJ7fSsxoGiZi0azkhDa47Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+Ay5vki1pmwSfDUClA0UtnmzpGVibOe9VedxNG6JJM=;
 b=p8ud4WqAleNfMpkt6U/auHLraBobPoXre7fx8b2YxZqZN36d3ceKrEyq+Rh7QDvIB+ILYaUdYXyEvgBJfH60vq8VfsHctK1QEytoK9kfbcAUQEcE6PeZc7s9xd2SHAVFtWuD4HFk2f6PFJ4Mp4dZX9jgNZvlPLsSRQsNLOI8yro=
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:222::6)
 by LO0P265MB6100.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 08:14:53 +0000
Received: from LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c]) by LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
 ([fe80::cc2d:a46c:188c:17c%5]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 08:14:53 +0000
From: Robert Mazur <Robert.Mazur@imgtec.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <Robert.Mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
Subject: [PATCH i-g-t 10/10] tests/imagination: Add DEV_QUERY runtime_info
 tests
Thread-Topic: [PATCH i-g-t 10/10] tests/imagination: Add DEV_QUERY
 runtime_info tests
Thread-Index: AQHdFcRYhlME6ELFZEesdtcbFszLjg==
Date: Fri, 17 Jul 2026 08:14:53 +0000
Message-ID: <b0e9a03fafe7476aa5644b327ec25afa20260717-test-imagination-add-support-v1-10-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
Accept-Language: en-150, pl-PL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO0P265MB4797:EE_|LO0P265MB6100:EE_
x-ms-office365-filtering-correlation-id: 53fe1c02-378d-452b-cec4-08dee3db7add
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: OCeBS43+tjoVyDF31HyTU7G0QSzcDXFKihi7FG/Fkv6hpgyxQAfkYlxwgayZJEdfjWmr6WptsprauBey9abk24xmZigecCelFMddBhi7bLoe2AKGX8vK9Ls2BUHH3Qs/iw+EJtYLSPIMHiqq9GjBBxCxxqJZnIL87USJtST/aNcmkAbW3jh21PL0ePXvBwS4HmpvfV7XeWZe7/sGgHX3+/wcqvfj2pW5cehq5S2pV/ms6rFyXYQM9hwgIdP/MbXZouOTaN4CtKalYZGFucm+c8RuI4o8o40JO8on6AU9lBFG61Lo2rSam8fFHmtvXmWK0n6PyQmQG7+9ghMpvGUncLcFdPRUk5zg6pRrX3SahZ1UIeIKDDrCd9w/PFxrBlQSHRMlcPjuYhngc+oj7ZpvyEF8X0fkAa8nQ178XxAtxDEdA2qo1GTj3+KccMbceIJILSIcBOpOaljAkQTqarWJimLZlOIVUuoKd5a4Uq7Ap01e0oD7sP5SzHz9YkLzeSDBWvZem+h1naGpbdXMkAqpDJcJktZyiFpESu4h9cECkQOdJED2ZMCVRLzhrcFHKL7KThFvBvTk6oavtl2e6tDpQPtXw2kt8lufZrYo843mC/6bcx9ZcGgynmxbEJQYijDe7s5QFDBE6P0291qaTga9+m+dBfVflUYrqFhhsrqDOfqTGH7UizD7GNqbzfE07CZbxpFDxPht4RiC88cBVg6jl0AID4GDdwuBVHT/gYkG4a8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6tGTzm/elnA5tzs+yQUBmBlB8nI+y+f2XWv3VBQn9xjnVxaQOSFJ06UR4yNe?=
 =?us-ascii?Q?+zQYdqKwzd0AwjBm/QmIFjjDgry44/kNrDjEubI8ivKgfmqG4qE/wzIVESkJ?=
 =?us-ascii?Q?jO4bO9vegeLKOu9YfhvUBvpVYY8ixWY2EQgYnZ8jUuozFxlgfBIGzF71duh2?=
 =?us-ascii?Q?/NDEmWgTjCLz0IfNfvY4ctiP8JPFCSNllRtmbhvwE5XTzsFrerSMW8R7XnSf?=
 =?us-ascii?Q?nClkXKZydPMO9+Wrpm5ItMMMgvbt0aFX9wEOf4kjIyWvcYvqLyyRkNRr98ZJ?=
 =?us-ascii?Q?u3Sa+qu+CtVQZunUksPY0U4K/YzAOI+Gu4if+NQJSUtBNwogEnphKjw0n0Hu?=
 =?us-ascii?Q?VbjxE7dOEHkXCRCeQwpMoadpmEkmPjR3zuzH3dRR0qBEgN7KUPqQ8JRTEGZ3?=
 =?us-ascii?Q?40iNBjroRYzint2hEofMYiQdczbPcAhkX3z2HhD1pcy79qkUUd+lP9nXZm+n?=
 =?us-ascii?Q?ESMIlf6hfDFl1pNH8vGibkjCvx2x5ylHtnGp50HzZuLNA+ODCqqcjJFoqr3X?=
 =?us-ascii?Q?luCbryO7Pnz50kw8V3RIGiJmOOFKaEUr/LgSFQ+3bZhnQrjJd4wZrvLJlZ7w?=
 =?us-ascii?Q?i30s5n/l7eEBmU0EgV4eSHBoV6CZL+ByainmSi7GW6wMLekkTdkLlV6dAyjL?=
 =?us-ascii?Q?hFVXfTi0dtkSU/yfc0W8NOnPcyMMx9GJCasezw8Mp9GRjuVggFO02JRcogF5?=
 =?us-ascii?Q?rAUMx+l1UQD4HjEn5Rx7PQYMKfoTvuagc0z8UN9IcfQMUUrTcPpMTB7MKwo9?=
 =?us-ascii?Q?5oKOP4h7yJywC1Po6CgGGWEiHycYTeanGNnzcCrTsE2VyUwOq3gOG0LMG6m7?=
 =?us-ascii?Q?tu338hIT9NlGw+IkDxwzshj5w50wv4zfupw55U1n6A+YnahBq+Q4OS41Po0s?=
 =?us-ascii?Q?PfhUegKUaRd5GZ/42M0vpuOHaFD/UIKtSewNioNcfRR+rNHpkWoZ+FsJp8ta?=
 =?us-ascii?Q?TCAXBdoCrVyQ5duEKtdCTuGmWwHjJKi8KLpUSUEfbshLwDTfBDY1oWU9sRlN?=
 =?us-ascii?Q?59wvHJOHZwS+fDghXo1Cgi0NLR8l7YGrcWMxsGDqdpHvzU833iDZwbDvwTXr?=
 =?us-ascii?Q?gBcHDzCQofTTFY3Oc6gnl0qYgceKbspEEz2RXG6q98TIYKdWOgWXSCCmWyZE?=
 =?us-ascii?Q?qSda5KqEXl+g5daRMsgiC3hRNafEE4OGCNNxhFArolcNeS5qDZCQWk/ZkI0U?=
 =?us-ascii?Q?BzG4L3B31hyU5unRqkGgzqpKFGtFvQNXlTiB6rWaGg8twqi9hC+7QEi6vgrI?=
 =?us-ascii?Q?TpFos9L5gRVtMukvJrPHeMBQvGrrTQ03Y9KC2uqX1Fc1a56vOHv7RwfhI9Q4?=
 =?us-ascii?Q?iHAhlZlEx8/pEqQE2LPZwgvpAKjBNgXsq9g+khNVDhfyIvdVXRwUlpndmWMe?=
 =?us-ascii?Q?5cACeh+ii346BDtKdBWiPmQlAsyvWh2baaNdINaO8YjD1169cVgoOX8Fa6BT?=
 =?us-ascii?Q?k9fIdqMHf//Em0CQ44c4R7xUJhWfKpvt1DABy2XkzZz+hzPcxOgai+9zPMzR?=
 =?us-ascii?Q?yCxqzzxFTAg3MX3gAVktnpDxdW6dfsH6gvqzuFPGUxY6wN3mmx+3q+c/aTzq?=
 =?us-ascii?Q?onNTmaBtaSW4XX5dt6Ql7NWaelOQEd6VGUl9nC1iOTkVATFs2BtgJixEWgZi?=
 =?us-ascii?Q?DGYbTViEQZYPz8sWtV9lXGIQTo1f9tThSSI1eYSGsUoox215NpTrwLFzrbCQ?=
 =?us-ascii?Q?j7O8RSyM/LEKClpLMJag6db5xfea5fg9zbd+DXrIUZ/dn1xeBgIY+SGYuDFP?=
 =?us-ascii?Q?w9QS2S0J+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <580C9BDEE316BD4FAFF31D7F65A49EC2@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: noiHZ1bcj8Wb23fWI6v1otNhA5v7mBpAoRw0jYSjMwGMG/AUvS67UFZNmn7WrRRUefFd8pAU4eq8u76bksvVbFc+XBVfYi6mESyGtwHPVFo03GrLbRup1s4Y5Mc47gLWMskV2BO1xEyo7VzqYM7zrWwd378o/DaO4wUsPdDabG0/hKffvyeunON53+56RF5lUwKYaIrWEXkTaDjXvQ+h05wjSpd8UMVBkLxpUMh97og03gxl1wShTY97A6C6gG/M7GkQFvmi7ImaUegs3HeQoX0bLJb57YDsHkOv+KRxxkTuRqA1ZbZv5UYdGoH6p/K4mV9Ap5GwpQI7o/mWpJShDQ==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P265MB4797.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fe1c02-378d-452b-cec4-08dee3db7add
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 08:14:53.1457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rOGDqFBW1XeFWWcFnWnlD4bFciEU36oO/i1h2CCyLoX7YMRWAJ8LrCalAp79KHF5Tj7PkhT8RL6GfEdd5QQ4jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MCBTYWx0ZWRfX+CMVYiwQg2zo
 4eP8rSYelwOEGKkDK8kUrDJfu9IcfYbVlWVUD3wTRUX1xswcxINxX5kV5oBpo/PvTQOYffGXGE6
 wHMHb05jkwcIfHd23cVHQ5LGpI3uOmR9/enP4a5NChGHG7QTUt+y68HWw3A2xsJUixPDK50FIgo
 5GMLLtV45ZoOkvKb7IiQXq+wqSjSdJlzGEZi4haP8We7b5MFT8yXahn+wGhfHDaDtWnRXhOgsFD
 654ssdLPIUONVBTxcaCXxiOapadqLEz0RNhF4774PPzA/MLUkr1eCXk988/u/4rTwKRrRD+mYEF
 rs4GEvTubptaB4wtW8KG0vX7hZB+XWahyXSXGWHIS+AqSGFuGHkUdgiHHeObnLIQUOKjndvFrJf
 iERF/Relz//ZWl8McVcYr2FSn+F+1otTyCn3s55AkILGnzTYMecDxlyUdzHKknTgiykYo837JBs
 oB6rqZAIbrBSTbhEueg==
X-Proofpoint-ORIG-GUID: aIqBiYkO5i_xeGtR6wabF5Dq7crv90eZ
X-Proofpoint-GUID: aIqBiYkO5i_xeGtR6wabF5Dq7crv90eZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MCBTYWx0ZWRfX1uJiCGrTrjkO
 An1weulSVck1A+6N8ApSUdwLgiZS4dTPPIjSZFfgzLx8C7y0frc2V/teiVF9ASa3Z7Nbb7CZUfV
 s+Dp7Ot/50atzx10ddpwgnfT3SxXMBc=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59e480 cx=c_pps
 a=6U4DLK95ou5xXD95RakwAw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=r_1tXGB3AAAA:8
 a=L8LdILqEO6YnCbYE5soA:9 a=CjuIK1q_8ugA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

From: Donald Robson <donald.robson@imgtec.com>=0A=
=0A=
Add test validating runtime info fields from DEV_QUERY.=0A=
=0A=
Signed-off-by: Donald Robson <donald.robson@imgtec.com>=0A=
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>=0A=
---=0A=
 tests/imagination/meson.build        |  1 +=0A=
 tests/imagination/pvr_runtime_info.c | 31 +++++++++++++++++++++++++++++++=
=0A=
 2 files changed, 32 insertions(+)=0A=
=0A=
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build=
=0A=
index dc08a5d8b..59749b51e 100644=0A=
--- a/tests/imagination/meson.build=0A=
+++ b/tests/imagination/meson.build=0A=
@@ -5,6 +5,7 @@ pvr_progs =3D [ 'pvr_dev_query',=0A=
 	      'pvr_heap_info',=0A=
 	      'pvr_hwrt',=0A=
 	      'pvr_quirks_enhancements',=0A=
+	      'pvr_runtime_info',=0A=
 	      'pvr_vm_context',=0A=
 	    ]=0A=
 =0A=
diff --git a/tests/imagination/pvr_runtime_info.c b/tests/imagination/pvr_r=
untime_info.c=0A=
new file mode 100644=0A=
index 000000000..eb5aefad6=0A=
--- /dev/null=0A=
+++ b/tests/imagination/pvr_runtime_info.c=0A=
@@ -0,0 +1,31 @@=0A=
+// SPDX-License-Identifier: GPL-2.0 or MIT=0A=
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */=
=0A=
+=0A=
+#include "igt.h"=0A=
+#include "igt_pvr.h"=0A=
+=0A=
+#include "pvr_drm.h"=0A=
+=0A=
+#include <stdbool.h>=0A=
+=0A=
+IGT_TEST_DESCRIPTION("Test that the runtime info query returns valid data"=
);=0A=
+=0A=
+int igt_simple_main()=0A=
+{=0A=
+	int fd =3D drm_open_driver(DRIVER_POWERVR);=0A=
+	struct drm_pvr_dev_query_runtime_info runtime_info =3D {0};=0A=
+=0A=
+	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,=0A=
+				sizeof(runtime_info), &runtime_info, 0);=0A=
+=0A=
+	igt_assert_neq_u64(runtime_info.free_list_min_pages, 0);=0A=
+	igt_assert_lt_u64(runtime_info.free_list_min_pages,=0A=
+			  runtime_info.free_list_max_pages);=0A=
+=0A=
+	igt_assert_neq(runtime_info.common_store_alloc_region_size, 0);=0A=
+	igt_assert_neq(runtime_info.common_store_partition_space_size, 0);=0A=
+=0A=
+	igt_assert_neq(runtime_info.max_coeffs, 0);=0A=
+=0A=
+	igt_assert_neq(runtime_info.cdm_max_local_mem_size_regs, 0);=0A=
+}=0A=
=0A=
-- =0A=
2.43.0=0A=
=0A=
