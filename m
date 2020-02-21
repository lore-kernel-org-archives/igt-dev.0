Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5776E28E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 11:37:02 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id p14so992584vsq.6
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 03:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
 <158227742073.7916.10741931818420037780@emeril.freedesktop.org>
In-Reply-To: <158227742073.7916.10741931818420037780@emeril.freedesktop.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Feb 2020 11:36:47 +0000
Message-ID: <CACvgo515WL_CNH4jxa5=4d140n6yc7eok0_QWnjYpqhCbL1MrA@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdHMvY29y?=
	=?utf-8?q?e=5Fsetmaster=3A_new_test_for_drop/set_master_semantics_?=
	=?utf-8?b?KHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi all

On Fri, 21 Feb 2020 at 09:30, Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> == Series Details ==
>
> Series: ts/core_setmaster: new test for drop/set master semantics (rev2)
> URL   : https://patchwork.freedesktop.org/series/73650/
> State : success
>
> == Summary ==
>
> CI Bug Log - changes from IGT_5451_full -> IGTPW_4186_full
> ====================================================
>
> Summary
> -------
>
>   **SUCCESS**
>
>   No regressions found.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/index.html
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_4186_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * {igt@core_setmaster@master-drop-set-user} (NEW):

For anyone wondering, the failure is expected as outlined in the commit message.
The patch to address the issue can be found on the dri-devel mailing list[1].

Feedback and review is highly appreciated. For both the IGT test and DRM patch.

Thanks
Emil

[1] https://lists.freedesktop.org/archives/dri-devel/2020-February/255718.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
