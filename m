Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A412E67803
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 17:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9F310E3B7;
	Mon, 22 Dec 2025 17:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENzsrTrw";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877F810E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:49:19 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BMECGKH2199451
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:subject:to; s=
 qcppdkim1; bh=Tm7SETFsKoWV9cRrCH7SXgwTArWV/1sIcIxWhxbmixg=; b=EN
 zsrTrw8qCilOhJ+WuE32WAyo21XuwKGqgcwHy8hGFXCRlARh6Rtmpaet3qd1G8WS
 8AKL0zsSyzAHlKwg93DPKQRzzoGYcp39K3XeL2M5ZgAFhQ3+Xmvm0U05xAYrSESd
 pVzCc4uTczpDZO/IlpX1APBEnh8Mcgygstu/DaR5QQpUdTrt3hBUXwZLqQF1JWkp
 d7QiCGfbeIEm0kaBEjbmaPwNDOROx+RxMBYIZO0uuO/jatEB4bFy6wwU/l8l4LBo
 Kws2k6+hZAsR0NZjAmG4ilcpceLp0h6mTUSIgMHgZBYr3ZPu7V/qI7K0EN9RQn9J
 HLvfW2ZXh5YKqZygLbjQ==
Received: from ds2pr08cu001.outbound.protection.outlook.com
 (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.50])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fws9k1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 17:49:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivSDfc4XNdcRUphkIoT/a1NxWcwnE0mJY9tHrn9YAvmq6CHZRuNDxhktjusQAIiDof//xuYAfSoH+KNqrGZDWfwp+QzjaYBCYb1TjNlg+NMqdemc1G7zamY/1P+Zp8NrvCHQ70CJE50Zuo9wh6wBoMmmZewxq2DO9nIWOz+JuvjfMVQAiqk3eV+2Wqq+/2JS6s9enJuJPizxO+/JTKByhuvUPeD1SRHZkqskoVai/1Uas+PQrLiA/nJ4Z4StCBTiVPlQMPpZ7f7xchBedpDTeuFbStOYnjroMdTiIQZxfiz4hhiw5eAznT1o0xyBoLDBz1ReMcvmQ62fTDVQ4WyBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tm7SETFsKoWV9cRrCH7SXgwTArWV/1sIcIxWhxbmixg=;
 b=s/aR938Pc5+N0eAAXabQajwYJXvgTmJVik85wxmWKN4NQwDynderGBIte35tIOuxs83OQyDtrIgyRGhRwNiu3VQacsAIQv3H/+0Z986ky4TJOF62kzKfq2qZVDuoyWLRfHYpiGP94lUurIUg28AeHSPrsyPGsIojA4u5Lp5Is5u2oh7BLupsJBsotlT310pAIqQ/ATIiaC9zE4Fr3y+RxKbRHsCaxxR/TEwjjKpfhLSrFTRZJPy7poQqcl8ZTtz9W7X+JxIwlH4VqXdMzV1iQPxO7omBZRCOqh0Pi6+wD/+jjF+1KYyXdA1+ztNtGPQ2Ds/x2V/WV+XqYNXXI+K0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 (2603:10b6:806:407::18) by DS0PR02MB9618.namprd02.prod.outlook.com
 (2603:10b6:8:f4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 17:49:12 +0000
Received: from SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::ffcb:499e:b7d4:3d95]) by SA6PR02MB10503.namprd02.prod.outlook.com
 ([fe80::ffcb:499e:b7d4:3d95%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 17:49:11 +0000
From: "Jitta Vignan (Temp)" <jvignan@qti.qualcomm.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Lakshmi Kalyani Lingam <llingam@qti.qualcomm.com>, Aditi Verma
 <aditiv@qti.qualcomm.com>, Maheswara Pappula <maheswa@qti.qualcomm.com>
Subject: Introduction and Intent to Contribute to IGT GPU Tools
Thread-Topic: Introduction and Intent to Contribute to IGT GPU Tools
Thread-Index: AdxzaiWdcHajmZKXQoesBoVcvngXng==
Date: Mon, 22 Dec 2025 17:49:11 +0000
Message-ID: <SA6PR02MB10503A8AC8548FA6C527BFB8881B4A@SA6PR02MB10503.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR02MB10503:EE_|DS0PR02MB9618:EE_
x-ms-office365-filtering-correlation-id: c5a26943-f297-43f9-ecf7-08de418269fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|8096899003; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zFjj3g1sELgJZ5lHwAY2ZeYdX9pfA3Ax5+Tw3j7XUsO3iyJkDnpbFvJkDpul?=
 =?us-ascii?Q?84dlYIjhVN0mTALsQeO4ecTeSo7ds7OkRNbGQ3AvDAKLhR2zIUm8q9GVdPf7?=
 =?us-ascii?Q?5QoWgJzm+v5V0rY2UaHv2U+vGKr/JoA/qGpVIk0lv4dfhF3zBBYfJU3ZyfpL?=
 =?us-ascii?Q?soHJ4+xchabcERUn9pNLmPtA7RXopttmthSGvhSqAGoliZrJCqbXT3ORX1Zs?=
 =?us-ascii?Q?Bv4n2yC+B1S1k/7hi+SB6+oOjL288Y3ez7iEqsTpDAqzvCTBZ/IqrSraNNOE?=
 =?us-ascii?Q?HrsiWzUHJbuLlsS1LK+BtafFPKTwER6KgTwZVL7fYcno9cgHITx0in4Usj3B?=
 =?us-ascii?Q?bsCuaBbiDKL46oDDuTzb2pjwKU3pcSAfOZ+Mh/ofvfKX0cTaQyjKjQCgUEO1?=
 =?us-ascii?Q?5ZY7G8famtTC40DDojfDZasWJwopaLFd1jNHnA03xLqGF6DmoyWk5qw90KKA?=
 =?us-ascii?Q?5xo+xuNn3ZrnLpRyAOEqYyD7pL1almcl2BSpP9/VQSMeWszbJPTQVc6fTnwX?=
 =?us-ascii?Q?c/5khaxwn4l4qtKJpgM0cONXpaEY0t6qu9hfP2duTzxxSKUVN0dm253fv9j0?=
 =?us-ascii?Q?bZQNPFib/qFGwItVqVx+nd91hDyODYJx7kUydkhar8uGXtWyvODyvgrvalx5?=
 =?us-ascii?Q?tsGSp2o5zIz6F+JSfSeSadQGisBDhUdzFb/wWK3GzAIJBoJ509qWx2kiMXJA?=
 =?us-ascii?Q?TLh7pKQSwDna0TbKth1BB+bTzk4wfNEuZqapo0D/gZK8DTME1N6d0JGD9RK9?=
 =?us-ascii?Q?MbE1e4ZrH5IeWBhtr39RNbjkdBuWGMpUWPQK4j81tj1/s5joT36CZPAfTyx8?=
 =?us-ascii?Q?2SgVfhjwbskTWFvM1oCqAYiOpn0wPmnIygRZyOfPRLv3gTtnJhZavLEdmkWl?=
 =?us-ascii?Q?7XK6mvHf1vz/tpQ076CjSW3QnKQn/iLYriZ+u8oTSBisJ9el7r8Q8dyVvlFk?=
 =?us-ascii?Q?auNPiCIUDr5IKmyk22M366VlF5XZxTddSc3p+A1bEIkpfx7KurGP7t3KMDOX?=
 =?us-ascii?Q?QOOvsgYi8xRXTADNBsA+EiL7yB6dJUdbU8FOL5BLkcBDg3vFR3tMBcyiCpiC?=
 =?us-ascii?Q?V/EgWu2GNWvzaSbOn/AQPvGv1vWoF0QWPHdZxnwIGrZyrJESJZfsnWKAezZX?=
 =?us-ascii?Q?USoYQ3mfk5jsM72wDtrZLLz8YtI+S0MNiBwDvwh84/iArvTpA+BCPKdgGVqW?=
 =?us-ascii?Q?zetIaJneHzQnCClMJgsV+aPZXMeWuHvGD2RroF5VTDUCDojf6v3rxEwYW51I?=
 =?us-ascii?Q?R3AEiCsuw8w7nwXHe3oiO9c4DsCKxxZEoxMbfjX2CYUNoTvzLKT8Mc9+Rbig?=
 =?us-ascii?Q?GPhaXAll2ELk15vX1cY5N7qzKyRio+0fcRNgbKxZsoIGvQWc3M13XZJjvABx?=
 =?us-ascii?Q?YLV7GcKH0kVIg2t2+eNRT93bIhwJ/2rNLUb75ZyjNJO7sK4SOe5k0XcvSGFd?=
 =?us-ascii?Q?78HhCHpLBO1nBrPz5+qCSWImXSmGdFHVpnCgoTzAa0QO7Q0ZOssOZ5t5yryY?=
 =?us-ascii?Q?I4QvZJv+VYAgc2JhvwCD8g0SDuEH166HtUwe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA6PR02MB10503.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(8096899003); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K8s6c3rgpE5Z7MUEqierV1X7c1880Z1IuUPFnNUrZ1s8kyRNsRPmweG7rJiE?=
 =?us-ascii?Q?ozrK7cz9P2Z83b3CxiK/bQyjeAreMnq94XKaL3wSUVdVCXMD3du2Ny5aPUfU?=
 =?us-ascii?Q?cbApnU+tMqcW+sDI+aZuo8DIBquG27ybNggzDuCOcdxRUs+IJHLMPTFIjQNW?=
 =?us-ascii?Q?Vlriu8z97goMywt/V0S4CnuqYlnCiHfwlCgGBv5bs44OB6egH1kqkm4vduhB?=
 =?us-ascii?Q?BVX6ie3iB0e269ccVWRJLxwfe8AWLpJQiufZkI+dr9K1i6rzWZ62zGepS4FZ?=
 =?us-ascii?Q?UvnmHsKkg4MME8ArSxp1EHxxAuZU56LcpjdCmbYS6rLsT+r/fmbmNENCg1Tu?=
 =?us-ascii?Q?q1DMHXfzKiGxRlzksWmDK4xqui0LneV0mJ8eyyj4bgc2dylNaXPcaUul4u1b?=
 =?us-ascii?Q?WjffuhRnO4NngCcfMNqy4l1yEgLUyOsWonGqU6SSNPfKitdgPXqqpjYi4ETu?=
 =?us-ascii?Q?34j5l1KK5mWA/rtA2SR35ElvUJ4IjMahFHuSQ87e/NddkjAcy8UVw0vUXTye?=
 =?us-ascii?Q?50TzUqdqxYCtFdBXE1SlV5eb/JopqDlFNl7E7MgQcEOiRGK/KeubQ//aDZVf?=
 =?us-ascii?Q?UVXRaBKhJHDuNB8F7rkyfUzsRwbd+lnmZ+cg2OJBXtcvCSw8mrpufvr7BwIZ?=
 =?us-ascii?Q?C8eIZZbj6HMTtPCcH1wjOzKb7mQqK95Gjg1J7J91nIPAcA6bqdd+uw+1Hdz2?=
 =?us-ascii?Q?xTDtLLB3Oz5vK3mhJv5MUGDCAtSzaV4F+p03GExP1b7rrSLNTaGsqpPookFV?=
 =?us-ascii?Q?axiwi7h1mzO6rR0gei8VDuWYaFiLkclMtTRwuK0XVtOCkDvS49KoqPiwukZ/?=
 =?us-ascii?Q?Z/VHJ1lhjYE5PZwJ/D9iZMYtMlOfs9YZ1y7nSPZj/IyVPYxzv9EDAsJ/mCTk?=
 =?us-ascii?Q?0MYpO2gDt16NvU1BXbb4m1OwaqDrGK4o+AINI4Ko1S1aQB5WB7MjrmcPj5LQ?=
 =?us-ascii?Q?g5ZRxhUFqGWmCYgnsrkOg1AeY7q3LxySHaBR1JSmASGW9djY1/Wkojyh9LJV?=
 =?us-ascii?Q?mAH81K6/9a2ZDk6R04qqI/EPDdzk50Gxqeomos6MLMhW0COCHyH4bwSx848N?=
 =?us-ascii?Q?37PefbM3O9XN9uLqqwRtNcY7fMrOVy2nXgfp/n48TCQ4Sd9qlrXlrLipCiud?=
 =?us-ascii?Q?CFzeyY2uICCzIEIvcIEByM+Z5zhZ+wdw0nYIUs0kfANqGf8iN7PEpfq5aAlx?=
 =?us-ascii?Q?dKqwZBNDKnO6FuNvNDwqZ/ttEGou9wowFyqvfUqnNzqPs+uLlBMZFx4Gx0Iz?=
 =?us-ascii?Q?3k1npNZrZCy/V7SGZ/5ZCb4MXQ7tSM3/mBaR2+luMg6cgjYa4JuJMh83xVmy?=
 =?us-ascii?Q?QUtyRcFyvOMV1QrDelJtk3cppremleey4ZlXP/1RYXZFfJIpPg+kUHjtPmGB?=
 =?us-ascii?Q?ZSbIFnpx+LAbxjTpHp8ZJ2as8BUQ775y0W+Czpr53mrhwI0zpTdNWpD2A1Gc?=
 =?us-ascii?Q?iP7jFQtJyrSCDGWQMdVLINkdLe7O1lfBVTtouRwCnysKTN0R3OklMVT8+wCM?=
 =?us-ascii?Q?KE8dzhW0PgnqqW54e20CI8KLSg3CMzFkqtQYxpywBHI/O9zmCef0WA3UNVhx?=
 =?us-ascii?Q?gSrVHrRqDvUl4iuapbmXHX8E+qrqcKeaSRFT5ev5Jzi9hc/It+vEs8zwVT0D?=
 =?us-ascii?Q?uJX0RW0hZI8EdF5eJGRV7Aad2OdoZ4Smwo0UYMZdqdbXdFfIbjSnOQmJ43wN?=
 =?us-ascii?Q?juynC0XOH5UdaoyHqOGedZj4wXr8VN2zUB4VVa0dA5P6Lr24hWbHwoutIQDt?=
 =?us-ascii?Q?qaXyO3Y00g=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA6PR02MB10503A8AC8548FA6C527BFB8881B4ASA6PR02MB10503na_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tWkoo3nja0W+LjDjI7mRwxhfefxkvxDlmAyfo6cx1tldoK/7tM4HeRhVULocrnOVwB0HsA+ktNhyp/lY7Qn+rnzSarHIZh1Dl3fOyoZFgimK8ffYIibg2G+VDZIuEOsvmo9Ktknvu/78579OVxJg4B9XYPg7XdT/bUYxhW9UG/H+4Q6M4eMyM+cvdnU+z3m6sfgWts6ShZJQUQsuk0ClDdSS3Y1xBqLrNF0b1JpMMTDvwXk1joWTolKCE3RzZO/aNNpn31u+fOyfUWXTEmV4uV2TsknXDLwmAwim3rzCic/NqW5/vG/vSk7LiaMRetVNCZhk7SGvK+V2IVdMRtpj879jOfdR2NWGCHJpTjzc0XmBUWKGHRmBQZ0Ua9M6c/lyfIquLl2iF2+QLsM2aIJZaD/mV5Gn+sD1Bo/r55bzyUlbR0ro+HKU1fvBoBsNpLX+7VD1swqA9BIjRexfhBNcs418ZUeRj6k1F/Xpk7cFmKtx9u11ClT03Htyw2M+L75f+v1RlU1gG04BHdVAmRDAUZaRKrjFDxL0oJd/76Vbxmk6g5PxC18WlwFx3RhNf1XOiFgIxi1VGYtOxEgZHbSq/otaULgbpEx5/DLXYANL8Vm2YWsdGZYBjt+yUFn0GXNf
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA6PR02MB10503.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a26943-f297-43f9-ecf7-08de418269fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 17:49:11.2776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2CebMwDkrfjmMieHb9ofVm+a7wzEdNIvCedW8LwxuNBWy8Q7MsGincWfKdFEdbUnSpCu2NnFlqkLOtO1/c3cHpXPe92bdpE8jQPPQZ0NhsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9618
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=6949849e cx=c_pps
 a=ITiX5wGoaVWtfJBAqtKqhw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=2WCoXrTvrKHXFLBqH60A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=9xMFS2YSa9Lxy3va:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2MyBTYWx0ZWRfX+lClCMaGwRjJ
 nNN1wZSIUgTBIpB8ks3v8ISealYeLCyyhdp+xjklgz473Xsi1qUEN1uUTALceI3rg477svifAEE
 PbD+T/hQkOBJ+CZuZWJak9TYzcafGY5ejYiDSNBfzIohSsyAV6R+zRM/FmiQnKPfO8GCcol9tfY
 Jovy7J2mKAUCGeFX6yNNBfgRp7Eo6F0tutEwX7hiCEdZHs34mjSABJoJXq7OCIVqsuXEt8j4Kms
 +eSG66ZGY6ms+TNhl0E/MyJoi+OeYoWQtxr4df3DSBLRt8sQ0RRxHocOgUHH8iGnnsqsDobLt4G
 z0CSFP2MNboDMeYJ3z99ZUtRDs8+BNpZgsSO5SeIecGoHPweIm9KG7rMZhgl5FGtRrM94VuskI/
 pKkvkdFRbFEh9W9o++9h0hSa77o6CiqU9LQoCtAd/lHjhNH4XG9ctAc0ZrBkRDks0c3IeJtkE6Z
 W1JrquR4z4CTeXENp9Q==
X-Proofpoint-GUID: AEqt_lQy6cyjZezRR1pB_hR3mQcs79jd
X-Proofpoint-ORIG-GUID: AEqt_lQy6cyjZezRR1pB_hR3mQcs79jd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220163
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

--_000_SA6PR02MB10503A8AC8548FA6C527BFB8881B4ASA6PR02MB10503na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

I have subscribed to the mailing list and created an account on gitlab.free=
desktop.org. My intent is to start contributing to IGT GPU Tools, specifica=
lly by adding new test cases under `tests/msm` for Qualcomm chipsets. These=
 tests will focus on validating GPU driver behavior and kernel graphics int=
erfaces for MSM platforms.

I have reviewed the CONTRIBUTING.md guidelines and will follow:
- Kernel coding style.
- Proper use of IGT macros (`igt_subtest`, `igt_fixture`, `igt_assert`, etc=
.).
- Adding descriptive documentation using `igt_describe()`.
- Running `checkpatch.pl` before submission.
- Using `Signed-off-by` for all commits as per DCO.

Please let me know if there are any additional steps or recommendations bef=
ore I start submitting patches. I will ensure patches are formatted correct=
ly and sent via `git send-email` with the subject prefix `[PATCH i-g-t]`.

Looking forward to contributing and collaborating with the community.

Thanks,
~Vignan


--_000_SA6PR02MB10503A8AC8548FA6C527BFB8881B4ASA6PR02MB10503na_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Vijaya;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Everyone,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I have subscribed t=
o the mailing list and created an account on gitlab.freedesktop.org. My int=
ent is to start contributing to IGT GPU Tools, specifically by adding new t=
est cases under `tests/msm` for Qualcomm
 chipsets. These tests will focus on validating GPU driver behavior and ker=
nel graphics interfaces for MSM platforms.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I have reviewed the=
 CONTRIBUTING.md guidelines and will follow:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Kernel coding sty=
le.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Proper use of IGT=
 macros (`igt_subtest`, `igt_fixture`, `igt_assert`, etc.).<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Adding descriptiv=
e documentation using `igt_describe()`.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Running `checkpat=
ch.pl` before submission.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Using `Signed-off=
-by` for all commits as per DCO.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please let me know =
if there are any additional steps or recommendations before I start submitt=
ing patches. I will ensure patches are formatted correctly and sent via `gi=
t send-email` with the subject prefix
 `[PATCH i-g-t]`.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Looking forward to =
contributing and collaborating with the community.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Vijaya&quot;,serif"=
>Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Vijaya&quot;,serif"=
>~Vignan<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SA6PR02MB10503A8AC8548FA6C527BFB8881B4ASA6PR02MB10503na_--
