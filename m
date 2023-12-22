Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FCB10E763
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 09:45:23 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e18689828so2032690e87.2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 01:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20231221201543.3162414-1-matthew.d.roper@intel.com>
In-Reply-To: <20231221201543.3162414-1-matthew.d.roper@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 22 Dec 2023 09:44:50 +0000
Message-ID: <CAM0jSHPuGRL+RjQqHARmwQroUw3T7p6Cef9gk7Lk2_Fke8N6=g@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib/intel_mocs: Initialize MOCS values directly
To: Matt Roper <matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 21 Dec 2023 at 20:25, Matt Roper <matthew.d.roper@intel.com> wrote:
>
> The #define's at the top of the file don't really provide any value and
> just make it harder to quickly check which numeric index is associated
> with which behavior on a given platform.  Drop them and assign the index
> fields directly.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
