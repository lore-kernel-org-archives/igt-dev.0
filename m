Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCF4C369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 08:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED5410E16F;
	Mon, 21 Apr 2025 08:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ppWHVUyS";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5FD10E16F
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 08:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnK7QtJXQ2YJ8drNhkzVZLHLIPKZ91zpXhUJJYPArWv+xq3TclcQhwslPOid3MSdeUjCv0/CpBJeyZj5ZmBxelv6Ij/TwpcOHtWlZNvRXkXx4nZZmhDYLVwfqU10Q3Z6cCidys/vm81Z8LHcOx9YHvoRAjbVBjSPWIcLj8yGnRaboh4hBGH595q3GWP5aWKhf/DYEbnanlvhVV5ozDHfCpYArszBRS9PwIxVbklKWY2FQ0antFeJm9i7tN3jeCjA1Qf8THX69VI/qoQssgZ6V7d3YbLJrxtwPtMyaZhDeoJjbbZKpaflsMAlCD4pxukiefCX3YKcoTaU/EEYl/wGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyoz8sKfMtxKNXpuH3dFTRdOlLqDpKW9BVk0A7aIolU=;
 b=OFYr9kKC520NEBxXrYJtRRYfjb2cJR3ml10GJqdULZfxaOjN5TZe1oo8ojerdIBaFUqf4f7mgyR4tP7GKx4PtP65i/sl3iPNRWu4iKAsr+Bjj299UcsKtUWdJd9dkXB5cXuz4tg7aIFT2h9TfyzPYS5Uqq5iJcjkUkSHusY5QKwz/BIAQmVgKYOLNp5thmFooqnlZWT4lgmQ8cOA3s6g7idPi9XV030M1sJbLdCwC8+IOC0RJejOFU4yK00NgXn6q5xtRcS9j25ZBLUVv6SusnTzJ0RO67HZp9OR1DOzcpLd2TzcsCsS/SmsL5jOlJcGtAvx2g6kX3YX801zZ6BMog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyoz8sKfMtxKNXpuH3dFTRdOlLqDpKW9BVk0A7aIolU=;
 b=ppWHVUySLuTKKx7Mb+ObkyZd7NcCV+cH/Yzm1EfZZtWuQHHGZEaRJM2JnkKaHPqxFMHcd5USj/3sp+Tt03QpRV8NjK4aOBFd0KaVsaT3j5nloEtyGBX0Kb+bZwn5lt1c7W2CsB/zRjSMaFYrWNNQ7bM/Y3pCns5ifQN3GZslt10=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Mon, 21 Apr
 2025 08:11:22 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.030; Mon, 21 Apr 2025
 08:11:22 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Subject: RE: [PATCH] tests/amdgpu: add missing user queue destroy for cs_nops
Thread-Topic: [PATCH] tests/amdgpu: add missing user queue destroy for cs_nops
Thread-Index: AQHbspNSSvSVW1GchUqFN/q/PtFkRbOtxLQQ
Date: Mon, 21 Apr 2025 08:11:22 +0000
Message-ID: <BL1PR12MB5753986669F58748F26CE3F993B82@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250421075926.31094-1-sunil.khatri@amd.com>
In-Reply-To: <20250421075926.31094-1-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=d33f4ac2-b584-47d7-84a8-75a195bdee33;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-21T08:11:04Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|PH7PR12MB5733:EE_
x-ms-office365-filtering-correlation-id: aa71a50f-6076-4181-e4bc-08dd80ac1aac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oSrfcCzch5wyP6tXRWmvpZ8pK4xeb9Mt5uBPzpKzGqtEzFsGSychi7w5En/9?=
 =?us-ascii?Q?YfAS0zyuwZ1slwkqVamI54ILugTkqepYLjKdbnwbsr4yedrYgixT1S1J4vBN?=
 =?us-ascii?Q?1t1ps24vC6b2iul1CvYanzrNttwLRDG2OagolX8oT//gvBNdQZy+Fa/qHSdp?=
 =?us-ascii?Q?7Ni4RSBxU3hY6dIT1JH0h7HjZRWDxM2mSQ0KwTh41NkTcg7NB6aC5+0i80JA?=
 =?us-ascii?Q?H75hiu57TPMZxbVaIvCLyjtN/ROa0Q5kB4iegYndS3D4R8jRlzNCLbjBpZ8Y?=
 =?us-ascii?Q?Et3GxAk7HJSyo+qYrQwD9PnuylDg83+FPzfyaOi09C95aCViVDbyaQbDArRP?=
 =?us-ascii?Q?pvujE/OW0+A1YKsxo39m7VmC8desU4mMHyOKhjxdOZCwnSMyAXsR5QAaBv4i?=
 =?us-ascii?Q?JEBiDw2x/aMLRUmiiMbQOtblUmAFq831jB37Qsf3w76hfl0PshQJiY058Sb5?=
 =?us-ascii?Q?XlgvDtvE0uDsyqp+FQufNV4VZrHKgq2JCP5eXW30EQe+fWvAJ+4MviihMc8+?=
 =?us-ascii?Q?qGNveRqL/dwWq2uWT0n3SwsTa+zXLn/Zorcjl6B3xgb81sFblq+3wQEDXUWw?=
 =?us-ascii?Q?J2qojb2+bOwcFNFqN/YhYUlRU7EVanJbodblEPIYSxGh52yhVbQODC/0eeLm?=
 =?us-ascii?Q?Vzz3GgS+/ug8ltzPCE7os7zhwTfa5TLhuNKuGLf5cND5s3tuoe03nzXfZpUf?=
 =?us-ascii?Q?uNdTDozWCF7ErbwlLutwDR0ypTG2OqODFNsHwGF4G8Svv93pEVIinESMQYvr?=
 =?us-ascii?Q?9We3hfUrw9H9p/t3gXt0eXRgH1nwo2x4eiOKR8+TDA+aNPJLd7xfMwgVDIJ5?=
 =?us-ascii?Q?ze8yJcOJBDNSZzkuTo4NBH5alNWwLir/wJHqCbkNa5JQkv1JS6EoEv/GRbnT?=
 =?us-ascii?Q?XQqs6IqJRGFcfqNlBop2ZcI4klNd13jluWWCKy0lNQXaNAtOIcFayBfq0mGQ?=
 =?us-ascii?Q?GZ/65z+6j/heWgAjHJdz9zIYz8Q3Ci/VujZhM1n5WFi0cXY95DSKXC2s0xOZ?=
 =?us-ascii?Q?FV2CJCTjA4mDh7ZhcDwwqu2QOuVB2mQjXMSyd3jOAZx4u5LTzivgO5T0KndM?=
 =?us-ascii?Q?p1OvQcI8aA9hYarQfe8qF95B2bXIH70En1DwLE2WourxtU0eQBKyQzwzlQG9?=
 =?us-ascii?Q?kYjwLlddLTWtClmGs5BFf8McxmXLIuQJSgfXBvy1ULAK+RUkkJgqrOJeOGSp?=
 =?us-ascii?Q?p9pgKjpHHwgNG96qHpteenm+o/eFmAhrWo2OX4XdZanHgS19t+a5hhenCurh?=
 =?us-ascii?Q?yjPGi3HO7jAtqG5+aAGpu6vUB2FDTA/RTKQuxqJ7hAug6DbsKa6Cq9xUVt4E?=
 =?us-ascii?Q?Qkh0fZtY2S72rZ9WsWRuiAqZMltU1ODDv4wln+NMWP0zHeNc8tBe5q8X2csY?=
 =?us-ascii?Q?MqulasP8MS1iyOP8mFbAzoE2vsnryHYmc9U1ebiiE82j9XM4s345x+x+Fzvl?=
 =?us-ascii?Q?6JX2fSXEv2Lw3+rlMVk2VmK5T40L2o6e36MicGjj/p/EZ/tmFBXNxQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TUBZyHq/CVL6Oc163ntd90kzBU4frcGiAxZV2AhRvTI1VKNADb2GU23NkSU2?=
 =?us-ascii?Q?hePcQR5dBz03HpMuTB7iBvnusRcv3a01g9qZowC0NUCQrcI6O/8joq5t1HFx?=
 =?us-ascii?Q?yhqZMlQVwYX5TOyRMX7+pKxDIHOuoWgzWzmdwHn7l1WqA/IN1ybnMtpzfeWd?=
 =?us-ascii?Q?GnJ2Ao0c71d3mUQacstBeqqGbYBTCWRukZbcXCSSAEfgLkijYB+49T2YB3iA?=
 =?us-ascii?Q?lLnHFlXTXhB64An5ZH2HgISPWrQP39IyDV8OIgBv1G0oEn36zbaPEripF6pR?=
 =?us-ascii?Q?iy1DCLYkgu5XBNhAnLL1HnrkjCCEs85k5mdu2g1o9R5WxpH2YaWje0SC0o5k?=
 =?us-ascii?Q?HRPMcjt+oeuBBouKAsDWbIOnhHau0ZyJ7nZUBKDrhVKOM0hQ9nQgP8oOpKZz?=
 =?us-ascii?Q?FZdjNalQKAN2ptQbZHWTCnmhD13tXi1l8V49dBwbTXLRyKsupMb9tFP63xJe?=
 =?us-ascii?Q?XLQDpZOKrUMKwsJNENuh2X++A2EAPh31hj0D7Y7Ovi+jG/gvrnO4itRQ7i7g?=
 =?us-ascii?Q?LOrNpLNkQm/nkh/09BtZtOZmXxeVfJKtM+J3SUzv9hU456/uqljsyWbEcA+V?=
 =?us-ascii?Q?iIrtjM/LJ8vjg5MRAo5E8DHTJX8dn625QxxtTblBDwZQ4nU8chql5rmpZ3E6?=
 =?us-ascii?Q?8tQ6FGi32EBl+4w3k8HQcFVc0dJViKAuJCwwJctW/KQPcJYBY24MrvL60ma5?=
 =?us-ascii?Q?HgDOnVzZByH9mwwAzF09+Svyc67z7jjO2jnOsoqRcQtkyjNhnkYaKvSaDBO2?=
 =?us-ascii?Q?BE9NLJdkWWuvSY2jWrUOsZArGxGSfT5bGQuooJWcWbySHMYC4yxOZLG3ULaJ?=
 =?us-ascii?Q?QVpJR/pqt7kx/iGSUiXEi53cgj5U+1N5QDlF5tt4ucOHhztDgGQj+Ii/vz/A?=
 =?us-ascii?Q?vN2ZFXSL74+ovSdd56cUfGUBpB8H8c/rDt5csvIT95fphuWoQEvR4IFdrEVB?=
 =?us-ascii?Q?+2yfUBQOhc09d+pWfbcc79L0/LnCySKFFa97ewuIluezs79h5dCgq94BQtkG?=
 =?us-ascii?Q?MHgwRo/tmNgroR+rMCi+6L1mGqAymOL1q/NNT6Y9KyPaSJwmHUFPfUlX8HvJ?=
 =?us-ascii?Q?kJ6PhxNXDjWTOg5tckHI+mM7hAI2IM7ZkXETjWBU6MA7fz0z8clLVlouc+uL?=
 =?us-ascii?Q?TYh8J40riNQGXHnCUG0WcNUIkckPK7F7kccZ3o8LLsLLoSumprb/ZbrNVLrn?=
 =?us-ascii?Q?u3bI1mhzAOE9unZo8eg3XKbDy/cqGODMS6vhQWlI0Ig5XsSgrKypIDQTGxVf?=
 =?us-ascii?Q?OjqvZfzc0moPvpIrjktzz+4iBSHlgtNsM+5eNceQuC6LyzX0bEnHyZPQIgwk?=
 =?us-ascii?Q?i5OhLVjhp4x0hrZfO98SbtA4WcwxwsFZ3VncrxN5m4GilqFBFStEwzLRMNvj?=
 =?us-ascii?Q?x9dMXk571+3YZy8ARr/M3gCc9KQIVY/1nCkDJc6T7aUZL27vyf9D5puLCPrb?=
 =?us-ascii?Q?Y2WFwKZCKugeSzWxFdC7nyUbOV5NM+3pnTUOeLJ0c12PDDyKEKd/aoM5nI9a?=
 =?us-ascii?Q?WHuhPb2wCxIR3w32TwQua6epGz+6bpDPVYI8AzSX4Nqum0t1lr6MGf92Cxoy?=
 =?us-ascii?Q?XQ7yPWjpAmF+5yxd/V4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa71a50f-6076-4181-e4bc-08dd80ac1aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 08:11:22.6686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ALmqUWnrKpoOC8OMdAUvtQHDhxjSD64jhBQXXbnS+Z41H3lqX0fMGgFoNY0m8bq6bYALua0xwfibxxjq07P3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733
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

Adding jesse

-----Original Message-----
From: Sunil Khatri <sunil.khatri@amd.com>
Sent: Monday, April 21, 2025 1:29 PM
To: igt-dev@lists.freedesktop.org; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Khatri, Sunil <Sunil.Khatri@amd.com>
Subject: [PATCH] tests/amdgpu: add missing user queue destroy for cs_nops

user queues after completing the test case should destroy the user queues a=
nd do the necessary clean up. clean up was missing for cs_nops and that is =
added with the patch.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_cs_nop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c index 16=
7699328..67bb0419d 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -139,6 +139,9 @@ static void nop_cs(amdgpu_device_handle device,

        amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
                                 ib_result_mc_address, 4096);
+       if (user_queue)
+               amdgpu_user_queue_destroy(device, ring_context, ip_type);
+
        free(ring_context);
 }

--
2.43.0

