Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364C96E4AB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2020 16:35:16 +0000 (UTC)
Date: Mon, 9 Mar 2020 18:35:12 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200309163512.b5gjkiqds4wwjash@ahiler-desk1.fi.intel.com>
References: <1583719347-32199-1-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583719347-32199-1-git-send-email-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/kms_chamelium: Add support to
 validate RGB/YUV pixel formats
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 07:32:27AM +0530, Kunal Joshi wrote:
> Currently, only hard coded pixel formats are validated which are not
> generic across platforms which leads to SKIPS.
> Added support to validate only those pixel formats which are supported by
> platform. Covering both RGB and YUV pixel formats.
> 
> v2: added support for RGB pixel formats (Swati)
> v3: simplified constraint and made it more readable (Petri)
> v4: -used igt_format_str instead of macro to print fourcc code (Ville)
>     -dropped patch#1 because of above change
> v5: -Removed connector_dynamic_subtest_end macro and modified
>      connector_dynamic_subtest to allow scoping depending on
>      requirement (Petri)
>     -Changed test names to make it more revealing (Arek)
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
