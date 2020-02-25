Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D6F6E8B4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 10:44:01 +0000 (UTC)
Date: Tue, 25 Feb 2020 12:43:57 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200225104357.skg5ke5mj4kacui5@ahiler-desk1.fi.intel.com>
References: <20200220143237.18855-1-maciej.ramotowski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220143237.18855-1-maciej.ramotowski@intel.com>
Subject: Re: [igt-dev] [PATCH] Reduce Docker images size
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
To: "Ramotowski, Maciej" <maciej.ramotowski@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Prefix the title with ".gitlab-ci:". If you look at `git log` here or in
the kernel repo you will notice that this is a common practice - it
clarifies what part of the project you are touching.

On Thu, Feb 20, 2020 at 04:32:49PM +0200, Ramotowski, Maciej wrote:
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Cc: Oleg Vasilev <oleg.vasilev@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Maciej Ramotowski <maciej.ramotowski@intel.com>
> ---

Some context in the commit message would be nice. Try to explain the
reason for your changes addressing the explanation to people who know
what docker is but are not very savvy in it.

>  Dockerfile.build-debian         | 39 ++++++++----------
>  Dockerfile.build-debian-arm64   | 68 +++++++++++++++-----------------
>  Dockerfile.build-debian-armhf   | 67 +++++++++++++++----------------
>  Dockerfile.build-debian-minimal | 44 ++++++++++-----------
>  Dockerfile.build-debian-mips    | 70 +++++++++++++++------------------

What about Dockerfile.build-fedora ?

>  5 files changed, 132 insertions(+), 156 deletions(-)
> 
> diff --git a/Dockerfile.build-debian b/Dockerfile.build-debian
> index b143a532..6cf7a1f0 100644
> --- a/Dockerfile.build-debian
> +++ b/Dockerfile.build-debian
> @@ -7,25 +7,20 @@ FROM $CI_REGISTRY_IMAGE/build-debian-minimal:commit-$CI_COMMIT_SHA
>  # just few extra dependencies for building IGT with all the optional components
>  # enabled
>  
> -RUN apt-get update
> -RUN apt-get install -y \
> -			libunwind-dev \
> -			libgsl-dev \
> -			libasound2-dev \
> -			libxmlrpc-core-c3-dev \
> -			libjson-c-dev \
> -			libcurl4-openssl-dev \
> -			python-docutils \
> -			valgrind \
> -			peg \
> -			libdrm-intel1
> -
> -# autotools build deps
> -RUN apt-get install -y \
> -			autoconf \
> -			automake \
> -			xutils-dev \
> -			libtool \
> -			make
> -
> -RUN apt-get clean
> +RUN apt-get update && apt-get install -y \
> +    autoconf \
> +    automake \
> +    libasound2-dev \
> +    libcurl4-openssl-dev \
> +    libdrm-intel1 \
> +    libgsl-dev \
> +    libjson-c-dev \
> +    libtool \
> +    libunwind-dev \
> +    libxmlrpc-core-c3-dev \
> +    make \
> +    peg \
> +    python-docutils \
> +    valgrind \
> +    xutils-dev \
> + && rm -rf /var/lib/apt/lists/*

So bundling all the commands in a single RUN instruction doesn't make
much difference because the base images are build with `--squash` (see
.gitlab-ci/pull-or-rebuild.sh) and there is no build cache enabled on
freedesktop's gitlab.

However this change makes the desired behavior a bit more portable :-)

The main difference is this `rm -fr ...` which makes the image 327.47
MiB compared to the old 340.31 MiB (+/- the margin of error caused by
having packages that are 3 months fresher).

It would be nice to have that captured in the commit message.

-- 
Cheers,
Arek

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
