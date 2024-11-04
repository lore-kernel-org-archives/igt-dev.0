Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C790DD111A0
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 04:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCA810E047;
	Mon,  4 Nov 2024 04:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PZWlvbxB";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228AD10E047
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 04:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EG5jdQnXbx2O2XMZdCMZsKYoLKHFqb6TkOdlntACBSvvAkAn87UUuI0uc7NyWZW+FlQ+4rKTuc4EyivFRovbMvRZZUhI284B2DapZQbgIvxYqGVxwBv5XDfj/Mr88Uaw6+LKNg2T3n7fZNZ2USXSDrGG7AqYoUfAlmBrMKyMEQleL409+Kb6B2TGMZ4j+G5wOvC7/4qQbSKKC5dm4bUPVdIcRhEF927eXXjoSuVEejkTlPQCnLP23JM8MUbOib4WbGLUduCV7zS2Gp2Rz9SvWfraJLuUmEc6M+ZTYKzLoGXxoTdzOnXL4GlIJ7+0NiKN+LAGJy8SSaXtqJwa/Vpqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dVrSB7SNCxXq/GDEiosbND+vBUf7TW45G7e241Am0k=;
 b=Hp8Hgx57HWxnccbA8KDckbFp2NBep+KjGf5lEPPfoedF6jhbZ3URk81I+xhKCjUSeZ70AN7QtEWoKTfmpEB9l0JtHPggM9R5DjwRHAQu1T73WsdqEJOE/hKXfc11RkL/dwTYZJtxVI4mRpxkc2oPJvYXtj3+FeGca0GjSbt/1vUw11mcWvZPjFttg2onPF2dg5NBPtZTH8fqm0ad8iBUInW0lmXYZI8nymUoJDxN5Q5PLztefffRTIAQLhnR0Pu2KkntIjvvPVU89Sa+GQ69Dki8YCt7FZnvoT1zqYiyGl/iTgKl5VRJPtJXn0H3Tv5NjgZlv9S4+9IlAx1AdaY4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dVrSB7SNCxXq/GDEiosbND+vBUf7TW45G7e241Am0k=;
 b=PZWlvbxBu+N50IeSpFY8XJko0wCqqFXsObLwhWI+WoeTnP+1GZbu9CiI2SBZHX5bdGnaoVui3/w1PvczPeoH7hEn6MljeFIHYvGoBixIJXWFcZqdNRXVdgjCYZhgJc0OagafQIMcMWdAlm3Q2yoazrasCv3Qo7TzfXGCY6f5rwA=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 04:11:16 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 04:11:16 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] lib/amdgpu_pci_unplug: fix bo mapping to CPU
Thread-Topic: [PATCH] lib/amdgpu_pci_unplug: fix bo mapping to CPU
Thread-Index: AQHbLm2pnu+SWZenbk+udvFGTvEht7KmgiKw
Date: Mon, 4 Nov 2024 04:11:15 +0000
Message-ID: <DM4PR12MB5152AE01EA0C7903C9D2E7FDE3512@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20241104035653.146383-1-vitaly.prosyak@amd.com>
In-Reply-To: <20241104035653.146383-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=06856946-6f48-4899-a71b-675830fd59ac;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-11-04T04:10:34Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CH2PR12MB4071:EE_
x-ms-office365-filtering-correlation-id: 0bf0496d-b432-4df3-fa70-08dcfc86ba47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?M+YNrFGoJ+pEcRop50OLvnMCxxQwTIg32yx0IuofOO5H8WmnLKGoydt83O0M?=
 =?us-ascii?Q?q4hJ24EicfPrzlHCphyZ3LJRVu/NbujTaedalz+OquIhkUQ0f0OPZyUd5gT/?=
 =?us-ascii?Q?h5wtciAufNoD1tLcu45jLMKkEzivP56YLE70zfDwcOrDnD7ylqRUFToDlXSK?=
 =?us-ascii?Q?Ii3LQA7ws+3sr4YfwU+1iuyUewUmYfedFb1jdu19PBed7XbARHkOuoX6P3vf?=
 =?us-ascii?Q?4I2lyL3xvBfUtUqVWFei1Lu2eANN3T6e6P+G9TBU+dOh3T0ZznccDfaWOvHL?=
 =?us-ascii?Q?Fj5i/uUeiopdZZ1+SSJ+aeEZ7wUDYyG+6G0hdeoF/MhfKrC/FHMOk0gerB+w?=
 =?us-ascii?Q?hgkW5r1bC83t4tbOM21T8LfnxicxO+tkAeKAzxeH4/8CFNrAraEq7YpJyM/J?=
 =?us-ascii?Q?jjkBMI/tSUR5d09BG6DeFnQGfLwyHhj1Vn8DlRX+vi3yJFKylkg89PcT/wZC?=
 =?us-ascii?Q?iXc4ruBnWcxE70fzO5w5aXu7r90qHQoYTvxjGukRtYjt76WUHrK/x7hVYD9U?=
 =?us-ascii?Q?qJk7bCzeVl+WufF2HAIPlpfcDI6ibL3j+6DGJZ+jwl1y92hMuAIbA9aKL/tZ?=
 =?us-ascii?Q?Z0WQh5WRx/MdpGRmOddkKGZkqa5qovsnUmKR/kxdd6Jdb2M9BQMi2bX0sQX9?=
 =?us-ascii?Q?mhPetexbYEB5RZxXXYgMZV2wLVc4+eYEWJmW0eTg54ntxiRDMvq++bUmjstN?=
 =?us-ascii?Q?Sh0anVOrjuQn8UFDcQkUMkZS6QDTiwtJAcdkDvEnjKX/frFArfujcfgi9XVZ?=
 =?us-ascii?Q?IVxv99uUY8gyhx9tGCCWad0Pb6dZpC1YOyJCx+muz6/19bTF9sjCAYcilQ+J?=
 =?us-ascii?Q?ciwX8XD/aBRbt5TGzedAtGi10Z6gayYBhxg1e+nBHIHpOtESap5i11cyeSQY?=
 =?us-ascii?Q?YpydULWHbsieLiPjJFrYoEPn2o4eqPcIM5MHhUK+HVgnCYNSb3fdz5EUMv9o?=
 =?us-ascii?Q?qY7dJD9YDfTHYjXGGGg4exakAJhrbE5NjZVJfkgFgbuS7HC4aLWeF10WPdrZ?=
 =?us-ascii?Q?gtkDsYamu9oeUnjPCs1CVh/x69SPfsfwL3rBEh7VrgzfKX3NiT00NrNUt+/5?=
 =?us-ascii?Q?4r/+LSPHtxE7k+zRUWeJKPKnNk0wd1IQo8coXjsJJRcGVRxgpFchA1scnqYO?=
 =?us-ascii?Q?1TRR/m1ybfAR/KOBQUtrHtKgnmJiyEI0Q08/9TWdpkJzifTQQ5WWWPPsB/aO?=
 =?us-ascii?Q?CY2OYNVpbwUQVfy5f6n3RrAWnTx4dsFEDLdCCu/+ABPqMGZZabK0C3IsKQ0j?=
 =?us-ascii?Q?08rXnyySwNQPas+9r0vSqcszyA+u1TtGksto/qL/HFz8rc/xsH8Wc5wyDxkq?=
 =?us-ascii?Q?3EKtFjxwD5Pt/H6AjjORBs4/mM/phuxJjKJYLu2DwGI92XJOC9ycJdIzccqZ?=
 =?us-ascii?Q?r9ou17c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SLb3MIYlRSBGxJ4R1AgcfOlah0du73XWQzmceM87DX+LDUZY7CWNVyUB9aBj?=
 =?us-ascii?Q?mv/3XbZQ1f8L1hatvi/2ssmMvCbWkWwioRKjKBM0Plt//q8l3yDdf6XNqiaS?=
 =?us-ascii?Q?COrlnVVy1bQjF4qPc5su6vUhgVsxEG2ELv4qhdGuOzRz5dtswvMDj6PSHjUc?=
 =?us-ascii?Q?dCf0EvDwkvt/JE+fuaHmeTYK0b5ICCb2A//Vww2qobzPRogkJ6t1j9Fo4SSz?=
 =?us-ascii?Q?ttHavce3SoGDh07Op9LGKyz6kRCVx1DmzmnWV8TOE9iZIZzdRv1NMlK3F/RB?=
 =?us-ascii?Q?swDF5oKUmODtvEVTnFDl3EU/E+bho+pZqwHQM8CwtcBN2P0rqfAHTrGqj9zx?=
 =?us-ascii?Q?Pd6x9n7QgZ5GGk4gvQGT3AK0cg8dLrrUnb2PnQ0i5sf32I3QQeBrqWQaiAyV?=
 =?us-ascii?Q?Ly1ZdiSZYj110SiEXf7/BIGlPW2tkrJBqoqrBuyQX1wMcTlCZ085rDQjHbyq?=
 =?us-ascii?Q?s8zSqFw0LcTdL7AKm7craUGRtybUENsAAYzKh1BN16DfVZ7hYvulmDTHFGxg?=
 =?us-ascii?Q?cSk9XTb6F/HjqIl9Cv2/WOH/rN+hP+Ihy0s6guG0k89MwOJ6zS7R+Mklk1cd?=
 =?us-ascii?Q?mHrVwWRt2YUtbJLobif3Ng7ziMEk6aE+gXe3UaPWt67W+Nd027giYB7S9w6R?=
 =?us-ascii?Q?XhSPh0Lxpm9dOgW9kAz9t77I0RWtDPjOt6pjN9zEryV4k+7KqAmDFIDXmh7O?=
 =?us-ascii?Q?rRu717mqrhHd//HfQsZe8B0ftdg8x+8Oe5zjGdZ59HBY6xmSGpDwqW/1n85J?=
 =?us-ascii?Q?+WkmiQGk++hDRWCKFl/AWKlabDHbBqf6P4VAt9b1b18rcQnsNTxdA4Uo3ulm?=
 =?us-ascii?Q?lQlLRlocMnBM4HjLiMARoSxem1L54r/LspJB8zomTBey0E/Y7/AK7MJgqmyg?=
 =?us-ascii?Q?9WEv/xhg8I1i1GIAfPX7lKSilGD2x/9sMlneGgPrseRoBqSs5K+QRVu9iiCx?=
 =?us-ascii?Q?f9105AuHpk1USKtCsiZqyr0wCZAo1cnFSM2urzD/n3W79o5/m+f/U9pDtCGp?=
 =?us-ascii?Q?v0rzJ3WB86YasLUFZ7kBfvnC/Sm+faHf0y15y6IuFjYeuQgXmLpiOj35g/8h?=
 =?us-ascii?Q?kyEpBktTnW0lurXqZ5TUVsQn76IzTnZlfITqYf20wyy8qoAHxPsSMr2IFLWM?=
 =?us-ascii?Q?n9pgRBFF7EkNWlmgAB5O2EKFgjFX+XGY8zBX/WceNdl5RwTZveVDM14EvLTN?=
 =?us-ascii?Q?QBhaFejXvacFYsPX1idoqWs03ZhEdjOK1thinfZl0E4XQH+fx6CDxFXEa8Ws?=
 =?us-ascii?Q?uRK5C4/bEWHxWFM+7Eyp70RhCllzex8inP1WIcoexMsYBIfp77avH2E0zUzg?=
 =?us-ascii?Q?CHJ6sQxz51JcfonGGWvjnYE2Hn7B92k9qBlSuIfYXwidaO5Scdlg4c3HpdmX?=
 =?us-ascii?Q?hYcyhGG4kBk9cRcY8yYLmwN1P62nTWXYew6SoeqQw4stRr6k5knD7sZ0fCaV?=
 =?us-ascii?Q?f1n1h8o0D01e8ORcs5aNb+naIqpHmLgP4jh5tKXsONt3MweXHxGnZnIvtiHy?=
 =?us-ascii?Q?RwHb6oPppKalOKIhadl9L1Q2+UZMwV4RlJcp/SEwbs4hxz8dsU/YeDzLJHo4?=
 =?us-ascii?Q?UbdQZAp6l1KUcyJByvA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf0496d-b432-4df3-fa70-08dcfc86ba47
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 04:11:16.0084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tfJlryqmbJVc4rDDK2yXYIMNAc04tKQi7I1Szw4dQBh4Cflq0QFJFQ4Wv59c1yhsIz5z5Qlgx5BW1e+qxDA2Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

The change looks good to me

Reviewed-by: Jesse.zhang<Jesse.zhang@amd.com>

-----Original Message-----
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Monday, November 4, 2024 11:57 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhan=
g@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>
Subject: [PATCH] lib/amdgpu_pci_unplug: fix bo mapping to CPU

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This commit addresses a bug in the buffer object (BO) mapping to the CPU by=
 adding the AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED flag to prevent mapping f=
ailures.
After an AMDGPU PCI unplug, we now handle expected failures in the DRM_AMDG=
PU_GEM_VA ioctl call.

Additionally, amd_pci_unplug.c has been reformatted to comply with kernel c=
ode formatting standards.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_pci_unplug.c | 82 ++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c inde=
x 078398b5e..107e1cbbd 100644
--- a/lib/amdgpu/amd_pci_unplug.c
+++ b/lib/amdgpu/amd_pci_unplug.c
@@ -18,8 +18,7 @@
  * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
- *
-*/
+ */
 #include <linux/limits.h>
 #include <fcntl.h>
 #include <sys/stat.h>
@@ -68,10 +67,10 @@ static int
 amdgpu_hotunplug_trigger(const char *pathname)  {
        int len;
-       int fd=3D -1;
+       int fd =3D -1;

        fd =3D open(pathname, O_WRONLY);
-       if (fd <=3D 0 )
+       if (fd <=3D 0)
                goto release;

        len =3D write(fd, "1", 1);
@@ -93,7 +92,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struc=
t amd_pci_unplug_setup

        unplug->num_devices =3D amdgpu_open_devices(render_mode, MAX_CARDS_=
SUPPORTED,
                                                                           =
               unplug->drm_amdgpu_fds);
-       if (unplug->num_devices =3D=3D 0 )
+       if (unplug->num_devices =3D=3D 0)
                goto release;

        if (setup->open_device && setup->open_device2 && unplug->num_device=
s < 2) { @@ -105,7 +104,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, =
const struct amd_pci_unplug_setup
        tmp_str =3D amdgpu_get_device_from_fd(unplug->drm_amdgpu_fds[0]);
        abort_oom_if_null(tmp_str);
        unplug->sysfs_remove =3D realloc(tmp_str, strlen(tmp_str) * 2);
-       abort_oom_if_null(unplug->sysfs_remove );
+       abort_oom_if_null(unplug->sysfs_remove);
        strcat(unplug->sysfs_remove, "/remove");

        r =3D amdgpu_device_initialize(unplug->drm_amdgpu_fds[0], &major_ve=
rsion, @@ -140,6 +139,7 @@ static void  amdgpu_hotunplug_teardown_test(stru=
ct amd_pci_unplug *unplug)  {
        int i;
+
        if (unplug->device_handle) {
                amdgpu_device_deinitialize(unplug->device_handle);
                unplug->device_handle =3D NULL;
@@ -149,7 +149,7 @@ amdgpu_hotunplug_teardown_test(struct amd_pci_unplug *u=
nplug)
                unplug->device_handle2 =3D NULL;
        }
        for (i =3D 0; i < unplug->num_devices; i++) {
-               if (unplug->drm_amdgpu_fds[i] >=3D 0 ) {
+               if (unplug->drm_amdgpu_fds[i] >=3D 0) {
                        close(unplug->drm_amdgpu_fds[i]);
                        unplug->drm_amdgpu_fds[i] =3D -1;
                }
@@ -206,10 +206,11 @@ amdgpu_nop_cs(void *handle)
        struct amdgpu_cs_request ibs_request;
        struct amdgpu_cs_ib_info ib_info;
        int bo_cmd_size =3D 4096;
-       struct amd_pci_unplug * unplug =3D handle;
+       struct amd_pci_unplug *unplug =3D handle;
        amdgpu_device_handle device_handle =3D unplug->device_handle;

-       struct amdgpu_cmd_base * base_cmd =3D get_cmd_base();
+       struct amdgpu_cmd_base *base_cmd =3D get_cmd_base();
+
        r =3D amdgpu_cs_ctx_create(device_handle, &context);
        igt_assert_eq(r, 0);

@@ -221,7 +222,7 @@ amdgpu_nop_cs(void *handle)

        memset(ib_result_cpu, 0, bo_cmd_size);
        base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
-       base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP , 16);
+       base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16);

        r =3D amdgpu_bo_list_create(device_handle, 1, &ib_result_handle, NU=
LL, &bo_list);
        igt_assert_eq(r, 0);
@@ -252,10 +253,11 @@ amdgpu_nop_cs(void *handle)  }

 static pthread_t*
-amdgpu_create_cs_thread(struct amd_pci_unplug * unplug)
+amdgpu_create_cs_thread(struct amd_pci_unplug *unplug)
 {
        int r;
        pthread_t *thread =3D malloc(sizeof(*thread));
+
        if (!thread)
                return NULL;

@@ -270,7 +272,7 @@ amdgpu_create_cs_thread(struct amd_pci_unplug * unplug)=
  }

 static void
-amdgpu_wait_cs_thread(struct amd_pci_unplug * unplug, pthread_t *thread)
+amdgpu_wait_cs_thread(struct amd_pci_unplug *unplug, pthread_t *thread)
 {
        unplug->do_cs =3D false;

@@ -280,13 +282,13 @@ amdgpu_wait_cs_thread(struct amd_pci_unplug * unplug,=
 pthread_t *thread)

 static void
 amdgpu_hotunplug_test(bool render_mode, const struct amd_pci_unplug_setup =
*setup,
-                                         struct amd_pci_unplug * unplug,  =
bool with_cs)
+                                         struct amd_pci_unplug *unplug,  b=
ool with_cs)
 {
        int r;
        pthread_t *thread =3D NULL;

        r =3D amdgpu_hotunplug_setup_test(render_mode, setup, unplug);
-       igt_assert_eq(r , 1);
+       igt_assert_eq(r, 1);

        if (with_cs)
                thread =3D amdgpu_create_cs_thread(unplug); @@ -311,9 +313,=
9 @@ amdgpu_hotunplug_simple(struct amd_pci_unplug_setup *setup,
        amdgpu_hotunplug_test(true, setup, unplug, false);  }

- void
- amdgpu_hotunplug_with_cs(struct amd_pci_unplug_setup *setup,
-                                                struct amd_pci_unplug *unp=
lug)
+void
+amdgpu_hotunplug_with_cs(struct amd_pci_unplug_setup *setup,
+                                               struct amd_pci_unplug *unpl=
ug)
 {
        memset(unplug, 0, sizeof(*unplug));
        setup->open_device =3D true;
@@ -327,39 +329,44 @@ amdgpu_hotunplug_with_exported_bo(struct amd_pci_unpl=
ug_setup *setup,
        int r;
        uint32_t dma_buf_fd;
        unsigned int *ptr;
-       amdgpu_bo_handle bo_handle;
+       amdgpu_bo_handle bo;
+       amdgpu_va_handle va_handle;
+       uint64_t bo_mc;

-       struct amdgpu_bo_alloc_request request =3D {
-               .alloc_size =3D 4096,
-               .phys_alignment =3D 4096,
-               .preferred_heap =3D AMDGPU_GEM_DOMAIN_GTT,
-               .flags =3D 0,
-       };
        memset(unplug, 0, sizeof(*unplug));
        setup->open_device =3D true;

        r =3D amdgpu_hotunplug_setup_test(true, setup, unplug);
-       igt_assert_eq(r , 1);
+       igt_assert_eq(r, 1);

-       r =3D amdgpu_bo_alloc(unplug->device_handle, &request, &bo_handle);
-       igt_assert_eq(r, 0);
+       bo =3D gpu_mem_alloc(unplug->device_handle,
+                          4096, 4096,
+                          AMDGPU_GEM_DOMAIN_VRAM,
+                          AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
+                          &bo_mc, &va_handle);

-       r =3D amdgpu_bo_export(bo_handle, amdgpu_bo_handle_type_dma_buf_fd,=
 &dma_buf_fd);
+       r =3D amdgpu_bo_export(bo, amdgpu_bo_handle_type_dma_buf_fd,
+&dma_buf_fd);
        igt_assert_eq(r, 0);

-       ptr =3D mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, dma_bu=
f_fd, 0);
+       r =3D amdgpu_bo_cpu_map(bo, (void **)&ptr);

        r =3D amdgpu_hotunplug_remove(unplug);
        igt_assert_eq(r > 0, 1);

-       amdgpu_bo_free(bo_handle);
-
        amdgpu_hotunplug_teardown_test(unplug);

-       *ptr =3D 0xdeafbeef;
+       if (ptr && ptr !=3D MAP_FAILED)
+               *ptr =3D 0xdeafbeef;

-       munmap(ptr, 4096);
-       close (dma_buf_fd);
+       amdgpu_bo_cpu_unmap(bo);
+
+       r =3D amdgpu_bo_va_op(bo, 0, 4096, bo_mc, 0, AMDGPU_VA_OP_UNMAP);
+       /* here the expected failure EBADF  9 Bad file number */
+       r =3D amdgpu_va_range_free(va_handle);
+       igt_assert_eq(r, 0);
+       r =3D amdgpu_bo_free(bo);
+       igt_assert_eq(r, 0);
+       close(dma_buf_fd);

        r =3D amdgpu_hotunplug_rescan();
        igt_assert_eq(r > 0, 1);
@@ -382,7 +389,7 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unp=
lug_setup *setup,
        struct amdgpu_cs_fence fence_status =3D {0};
        int shared_fd;
        int bo_cmd_size =3D 4096;
-       struct amdgpu_cmd_base * base_cmd =3D get_cmd_base();
+       struct amdgpu_cmd_base *base_cmd =3D get_cmd_base();

        memset(unplug, 0, sizeof(*unplug));
        setup->open_device =3D true;
@@ -390,9 +397,8 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unp=
lug_setup *setup,


        r =3D amdgpu_hotunplug_setup_test(true, setup, unplug);
-       if( r !=3D 1) {
+       if (r !=3D 1)
                goto release;
-       }

        r =3D amdgpu_cs_ctx_create(unplug->device_handle, &context);
        igt_assert_eq(r, 0);
@@ -404,7 +410,7 @@ amdgpu_hotunplug_with_exported_fence(struct amd_pci_unp=
lug_setup *setup,
        igt_assert_eq(r, 0);
        memset(ib_result_cpu, 0, bo_cmd_size);
        base_cmd->attach_buf(base_cmd, ib_result_cpu, bo_cmd_size);
-       base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP , 16);
+       base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16);

        r =3D amdgpu_bo_list_create(unplug->device_handle, 1, &ib_result_ha=
ndle, NULL,
                                                          &bo_list);
--
2.25.1

