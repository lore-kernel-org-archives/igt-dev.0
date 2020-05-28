Return-Path: <dri-devel-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20200528133835.5087-1-rohan.garg@collabora.com>
In-Reply-To: <20200528133835.5087-1-rohan.garg@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 May 2020 15:20:31 +0100
Message-ID: <CACvgo501HGxkVXAEafXZ0XukN2J3WSKmo3Ds9bpODt4X4Lor-g@mail.gmail.com>
Subject: Re: [PATCH i-g-t] panfrost: Test labeling functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rohan Garg <rohan.garg@collabora.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, alyssa.rosenzweig@collabora.com, ML dri-devel <dri-devel@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rohan,

On Thu, 28 May 2020 at 14:38, Rohan Garg <rohan.garg@collabora.com> wrote:
>
> Introduce tests to cover the new generic labeling ioctl's
> being reviewed here [1].
>
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
>
> [1] https://patchwork.freedesktop.org/series/77267/
>
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> ---
>  include/drm-uapi/drm.h    |  23 ++++++-
>  tests/meson.build         |   1 +
>  tests/panfrost_bo_label.c | 129 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 152 insertions(+), 1 deletion(-)
>  create mode 100644 tests/panfrost_bo_label.c
>
Listing high-level comments, haven't looked at the test itself:
 - make/name the test generic - I would imagine we can use dumb buffer
on panfrost, vc4 or others
 - catch the missing locking - a) two writers, b) missing read lock
would trigger user-after-free
 - use invalid handles - to highlight the mismatched gem_object_put
(as mentioned off-list)

The last two categories would produce various kernel
warnings/warn/bugs with earlier revisions.
Might be a good idea to run the test against those, to ensure the test
triggers correctly.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
