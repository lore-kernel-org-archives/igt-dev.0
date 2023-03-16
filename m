Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D5410E19F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 13:37:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r29so1555091wra.13
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 06:37:49 -0700 (PDT)
Message-ID: <a26be195-c032-1e40-4fec-23a60eb0f1f9@gmail.com>
Date: Thu, 16 Mar 2023 15:37:45 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230316022659.73202-1-zack@kde.org>
 <20230316022659.73202-4-zack@kde.org>
 <DM6PR05MB7099906944F388E2AF52683CAEBC9@DM6PR05MB7099.namprd05.prod.outlook.com>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <DM6PR05MB7099906944F388E2AF52683CAEBC9@DM6PR05MB7099.namprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/8] igt/vmwgfx: Add triangle test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 16.03.23 г. 14:54 ч., Martin Krastev wrote:
> From: Maaz Mombasawala <mombasawalam@vmware.com>
>
> Add vmwgfx tests support in tests/meson and a tri test.
> This basic test draws a triangle using vmwgfx and checks if it has
> been rendered correctly.
>
> Signed-off-by: Roye Eshed <reshed@vmware.com>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
> ---
>   tests/meson.build        |   2 +
>   tests/vmwgfx/meson.build |  14 +++
>   tests/vmwgfx/tri.c       | 210 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 226 insertions(+)
>   create mode 100644 tests/vmwgfx/meson.build
>   create mode 100644 tests/vmwgfx/tri.c
>
> diff --git a/tests/meson.build b/tests/meson.build
> index 632e36e0..b2d75afa 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -508,6 +508,8 @@ subdir('v3d')
>
>   subdir('vc4')
>
> +subdir('vmwgfx')
> +
>   gen_testlist = find_program('generate_testlist.sh')
>   test_list_target = custom_target('testlist',
>                output : 'test-list.txt',
> diff --git a/tests/vmwgfx/meson.build b/tests/vmwgfx/meson.build
> new file mode 100644
> index 00000000..46961503
> --- /dev/null
> +++ b/tests/vmwgfx/meson.build
> @@ -0,0 +1,14 @@
> +
> +vmwgfx_progs = [
> +       'tri'
> +]
> +vmwgfx_deps = test_deps
> +
> +foreach prog : vmwgfx_progs
> +       test_executables += executable(prog, prog + '.c',
> +                                      dependencies : vmwgfx_deps,
> +                                      install_dir : vmwgfxdir,
> +                                      install_rpath : vmwgfx_rpathdir,
> +                                      install : true)
> +       test_list += join_paths('vmwgfx', prog)
> +endforeach
> diff --git a/tests/vmwgfx/tri.c b/tests/vmwgfx/tri.c
> new file mode 100644
> index 00000000..6fc02967
> --- /dev/null
> +++ b/tests/vmwgfx/tri.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/**********************************************************
> + * Copyright 2021-2022 VMware, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without
> + * restriction, including without limitation the rights to use, copy,
> + * modify, merge, publish, distribute, sublicense, and/or sell copies
> + * of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> + * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> + * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> + * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> + * SOFTWARE.
> + *
> + **********************************************************/
> +
> +#include "igt_vmwgfx.h"
> +
> +static void draw_triangle(struct vmw_svga_device *device, int32 cid)
> +{
> +       struct vmw_default_objects objects;
> +       uint8 *rendered_img;
> +       bool save_status;
> +
> +       vmw_create_default_objects(device, cid, &objects,
> +                                  &vmw_default_rect_size);
> +       rendered_img = vmw_triangle_draw(device, cid, &objects, true);
> +
> +       save_status = vmw_save_data_as_png(objects.color_rt, rendered_img,
> +                                          "vmwgfx_tri.png");
> +       igt_assert(save_status);
> +
> +       vmw_triangle_assert_values(rendered_img, objects.color_rt);
> +
> +       /* Clean up */
> +       free(rendered_img);
> +       vmw_destroy_default_objects(device, &objects);
> +}
> +
> +static void replace_with_coherent_rt(struct vmw_svga_device *device,
> +                                    int32 context_id,
> +                                    struct vmw_default_objects *objects,
> +                                    const SVGA3dSize *rt_size)
> +{
> +       struct vmw_execbuf *cmd_buf;
> +       SVGA3dRenderTargetViewDesc rtv_desc = { 0 };
> +       SVGA3dCmdDXDefineRenderTargetView rt_view_define_cmd = { 0 };
> +       SVGA3dCmdDXDefineDepthStencilView ds_view_define_cmd = { 0 };
> +
> +       objects->color_rt = vmw_ioctl_create_surface_full(
> +               device->drm_fd,
> +               SVGA3D_SURFACE_HINT_TEXTURE | SVGA3D_SURFACE_HINT_RENDERTARGET |
> +                       SVGA3D_SURFACE_BIND_RENDER_TARGET,
> +               SVGA3D_R8G8B8A8_UNORM, 0, SVGA3D_MS_PATTERN_NONE,
> +               SVGA3D_MS_QUALITY_NONE, SVGA3D_TEX_FILTER_NONE, 1, 1, *rt_size,
> +               NULL, drm_vmw_surface_flag_coherent);
> +
> +       objects->depth_rt = vmw_ioctl_create_surface_full(
> +               device->drm_fd,
> +               SVGA3D_SURFACE_HINT_DEPTHSTENCIL |
> +                       SVGA3D_SURFACE_HINT_RENDERTARGET |
> +                       SVGA3D_SURFACE_BIND_DEPTH_STENCIL,
> +               SVGA3D_R24G8_TYPELESS, 0, SVGA3D_MS_PATTERN_NONE,
> +               SVGA3D_MS_QUALITY_NONE, SVGA3D_TEX_FILTER_NONE, 1, 1, *rt_size,
> +               NULL, drm_vmw_surface_flag_coherent);
> +
> +       cmd_buf = vmw_execbuf_create(device->drm_fd, context_id);
> +
> +       rtv_desc.tex.arraySize = 1;
> +       rtv_desc.tex.firstArraySlice = 0;
> +       rtv_desc.tex.mipSlice = 0;
> +       vmw_bitvector_find_next_bit(device->rt_view_bv,
> +                                   &rt_view_define_cmd.renderTargetViewId);
> +       rt_view_define_cmd.sid = objects->color_rt->base.handle;
> +       rt_view_define_cmd.format = SVGA3D_R8G8B8A8_UNORM;
> +       rt_view_define_cmd.resourceDimension = SVGA3D_RESOURCE_TEXTURE2D;
> +       rt_view_define_cmd.desc = rtv_desc;
> +       vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_RENDERTARGET_VIEW,
> +                          &rt_view_define_cmd, sizeof(rt_view_define_cmd), NULL,
> +                          0);
> +       objects->color_rt_id = rt_view_define_cmd.renderTargetViewId;
> +
> +       vmw_bitvector_find_next_bit(device->ds_view_bv,
> +                                   &ds_view_define_cmd.depthStencilViewId);
> +       ds_view_define_cmd.sid = objects->depth_rt->base.handle;
> +       ds_view_define_cmd.format = SVGA3D_D24_UNORM_S8_UINT;
> +       ds_view_define_cmd.resourceDimension = SVGA3D_RESOURCE_TEXTURE2D;
> +       ds_view_define_cmd.mipSlice = 0;
> +       ds_view_define_cmd.firstArraySlice = 0;
> +       ds_view_define_cmd.arraySize = 1;
> +       vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_DEPTHSTENCIL_VIEW,
> +                          &ds_view_define_cmd, sizeof(ds_view_define_cmd), NULL,
> +                          0);
> +       objects->ds_view_id = ds_view_define_cmd.depthStencilViewId;
> +
> +       vmw_execbuf_submit(cmd_buf, NULL);
> +       vmw_execbuf_destroy(cmd_buf);
> +}
> +
> +static void destroy_rt(struct vmw_svga_device *device, int32 context_id,
> +                      struct vmw_default_objects *objects)
> +{
> +       struct vmw_execbuf *cmd_buf;
> +
> +       SVGA3dCmdDXDestroyRenderTargetView rt_view_cmd = {
> +               .renderTargetViewId = objects->color_rt_id
> +       };
> +
> +       SVGA3dCmdDXDestroyDepthStencilView ds_view_cmd = {
> +               .depthStencilViewId = objects->ds_view_id
> +       };
> +
> +       cmd_buf = vmw_execbuf_create(device->drm_fd, objects->context_id);
> +
> +       vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_RENDERTARGET_VIEW,
> +                          &rt_view_cmd, sizeof(rt_view_cmd), NULL, 0);
> +
> +       vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_DEPTHSTENCIL_VIEW,
> +                          &ds_view_cmd, sizeof(ds_view_cmd), NULL, 0);
> +
> +       vmw_ioctl_surface_unref(device->drm_fd, objects->color_rt);
> +       vmw_ioctl_surface_unref(device->drm_fd, objects->depth_rt);
> +
> +       vmw_bitvector_free_bit(device->rt_view_bv, objects->color_rt_id);
> +       vmw_bitvector_free_bit(device->ds_view_bv, objects->ds_view_id);
> +
> +       vmw_execbuf_submit(cmd_buf, NULL);
> +       vmw_execbuf_destroy(cmd_buf);
> +}
> +
> +static void draw_triangle_on_coherent_rt(struct vmw_svga_device *device,
> +                                        int32 cid)
> +{
> +       struct vmw_default_objects objects;
> +       uint8 *rendered_img;
> +       struct vmw_surface *default_color_rt;
> +       struct vmw_surface *default_depth_rt;
> +       SVGA3dRenderTargetViewId default_color_rt_id;
> +       SVGA3dDepthStencilViewId default_ds_view_id;
> +
> +       vmw_create_default_objects(device, cid, &objects,
> +                                  &vmw_default_rect_size);
> +
> +       /* Replace default rendertargets with coherent equivalents */
> +       default_color_rt = objects.color_rt;
> +       default_depth_rt = objects.depth_rt;
> +       default_color_rt_id = objects.color_rt_id;
> +       default_ds_view_id = objects.ds_view_id;
> +       replace_with_coherent_rt(device, cid, &objects, &vmw_default_rect_size);
> +
> +       rendered_img = vmw_triangle_draw(device, cid, &objects, false);
> +
> +       vmw_triangle_assert_values(rendered_img, objects.color_rt);
> +
> +       /* Clean up */
> +       free(rendered_img);
> +
> +       destroy_rt(device, cid, &objects);
> +       objects.color_rt = default_color_rt;
> +       objects.depth_rt = default_depth_rt;
> +       objects.color_rt_id = default_color_rt_id;
> +       objects.ds_view_id = default_ds_view_id;
> +
> +       vmw_destroy_default_objects(device, &objects);
> +}
> +
> +igt_main
> +{
> +       struct vmw_svga_device device;
> +       int32 cid;
> +
> +       igt_fixture
> +       {
> +               vmw_svga_device_init(&device, vmw_svga_device_node_render);
> +               igt_require(device.drm_fd != -1);
> +
> +               cid = vmw_ioctl_context_create(device.drm_fd);
> +               igt_require(cid != SVGA3D_INVALID_ID);
> +       }
> +
> +       igt_subtest("tri")
> +       {
> +               draw_triangle(&device, cid);
> +       }
> +
> +       /*
> +        * Check that vmwgfx correctly handles coherent rendertarget
> +        * surfaces when no explicit sync is given from userspace
> +        */
> +       igt_subtest("tri-no-sync-coherent")
> +       {
> +               draw_triangle_on_coherent_rt(&device, cid);
> +       }
> +
> +       igt_fixture
> +       {
> +               vmw_ioctl_context_destroy(device.drm_fd, cid);
> +               vmw_svga_device_fini(&device);
> +       }
> +}
> --
> 2.38.1
>
