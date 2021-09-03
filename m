Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF466E8A3
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 15:20:39 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id ay33so6113394qkb.10
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Sep 2021 08:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210903140348.252686-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210903140348.252686-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 3 Sep 2021 16:20:11 +0100
Message-ID: <CAM0jSHOoua7XmtzC4M77hrUxKP7aWovTbLkAJiie-yCRLzb=5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] test/gem_exec_suspend: Enable the test
 for discrete GPUs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 3 Sept 2021 at 15:04, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Discrete GPUs don't support gem_set_caching() and uses a single,
> kernel provided mapping mode, FIXED. Adjust the test accordingly.
>
> This makes the test run on DG1.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
