Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 13 Oct 2023 20:41:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Message-ID: <ZSmPWdt1yFbh23xy@ashyti-mobl2.lan>
References: <20231013042012.409376-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013042012.409376-1-shawn.c.lee@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH] tests: save GPU engine
 information more properly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Shawn,

without the i-g-t tag in the title this path was picked up by the
kernel's patchwork.

Can you please use the [PATCH i-g-t] tag?

On Fri, Oct 13, 2023 at 12:20:12PM +0800, Lee Shawn C wrote:
> We encounter a unexpected error on chrome book device while
> running kms_busy test. It will restore GPU engine's timeout
> value but open incorrect file name (XR24 in below).
> 
> openat(AT_FDCWD, "/sys/dev/char/226:0", O_RDONLY) = 12
> openat(12, "dev", O_RDONLY)             = 13
> read(13, "226:0\n", 1023)               = 6
> close(13)                               = 0
> openat(12, "engine", O_RDONLY)          = 13
> close(12)                               = 0
> openat(13, "XR24", O_RDONLY)            = -1 ENOENT (No such file or directory)
> 
> Test code did not save engine data properly to cause this problem.
> So modify the code to save GPU engine information into a globla variable
> to avoid test deamon to open incorrect file again.
> 
> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/147
> Fixes: 9e635a1c5029 ("tests/kms_busy: Ensure GPU reset when waiting
> for a new FB during modeset")

please don't break the Fixes: line.

Andi
